 /*
 * 240p Test Suite
 * Copyright (C)2014-2022 Artemio Urbina (PC Engine/TurboGrafx-16)
 *
 * This file is part of the 240p Test Suite
 *
 * The 240p Test Suite is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * The 240p Test Suite is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with 240p Test Suite; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#define FONT_WHITE 14
#define FONT_RED   15
#define FONT_GREEN 13
#define FONT_GREY  12

#define IFU_REG_BASE 0x1800

#define IFU_REGS 15

const char *ifu_reg_names[IFU_REGS] = {
  "CDC Status",
  "CDC Command",
  "ADPCM/CD Control",
  "BRAM Lock",
  "CD Reset",
  "Convert PCM Data",
  "PCM Data",
  "BRAM Unlock",
  "ADPCM Addr (LSB)",
  "ADPCM Addr (MSB)",
  "ADPCM RAM Data",
  "ADPCM DMA Control",
  "ADPCM Status",
  "ADPCM Addr Control",
  "Audio Fade Timer"
};

const char *str_adpcm         = "ADPCM";
const char *str_backup_ram    = "Backup RAM";
const char *str_ifu_registers = "IFU Registers";
const char *str_work_ram      = "IFU Work RAM";
const char *str_spaces        = "                                ";

/*
 * IFU Work RAM is split into 64K "segments" to allow individual testing.
 */
#define IFU_WRAM_SEGMENTS 4
#define IFU_WRAM_SEGMENT_BANKS 8
const char ifu_wram_segments[IFU_WRAM_SEGMENTS] = {
  0x80, // Strange order because the standard 64K is actually higher in physical address space.
  0x68, // Remaining segments cover the additional 192K RAM for Super CD System, Duo, etc.
  0x70,
  0x78
};

#define RAM_TEST_VALUES 4
const char ram_test_values[RAM_TEST_VALUES] = {
  0x00,
  0x55,
  0xAA,
  0xFF
};

static int  bram_size = 0;
static int  bram_free = 0;
static int  ifu_full_test = 0;
static int  ifu_full_test_pass = 0;
static int  ifu_full_offset = 0;
static char ifu_full_wrote = 0;
static char ifu_full_read = 0;
static char ifu_full_temp = 0;

/*
 * Assembly function to set the bank for page 3, the only one we can freely change in huc.
 * Setting this allows us to access any physical bank via page 3 ($6000-$7FFF).
 */
void set_page(char bank);
#asm
_set_page:
  txa        ; argument (bank) is passed in X, transfer it to A
  tam #3     ; set bank for page 3 to value now in A
  rts        ; return
#endasm
#define PAGE_START 0x6000

void ADPCMTest()
{
  int offset = 0;
  int i = 0;
  char val_read = 0;

  vsync();

  RedrawBG();
  disp_sync_on();

  set_font_pal(FONT_GREEN);
  put_string(str_adpcm, 18, 6);

  set_font_pal(FONT_WHITE);
  put_string("Testing...", 16, 10);

  put_string("$0000", 18, 14);

  for( offset = 0 ; offset < 256 ; offset++ ) {
    for( i = 0 ; i < RAM_TEST_VALUES ; i++ ) {
      //ad_write(offset, 0, i, 1);
    }
  }

  while( joytrg(0) == 0 );
}

// This could probably be rewritten to use RAMTestRegion.
// (Locking/unlocking would need to be handled explicitly.)
int BackupRAMFullTest()
{
  int i;

  if( bram_size <= 0 ) {
    // Backup RAM not detected, but assume 2K and allow to test.
    bram_size = 2048;
  }

  set_font_pal(FONT_GREEN);
  put_string("$      ", 24, 16);

  // Skip header to avoid subsequent odd size/free reports.
  // (Setting to zero is a good way to simulate a failure.)
  for( ifu_full_offset = 0x10 ; ifu_full_offset < bram_size ; ifu_full_offset++ ) {
    for( i = 0 ; i < RAM_TEST_VALUES ; i++ ) {
      ifu_full_temp = bm_rawread(ifu_full_offset);

      ifu_full_wrote = ram_test_values[i];
      bm_rawwrite(ifu_full_offset, ifu_full_wrote);
      ifu_full_read = bm_rawread(ifu_full_offset);

      // Restore "original" contents (assuming correctly read...)
      bm_rawwrite(ifu_full_offset, ifu_full_temp);

      if (ifu_full_read != ifu_full_wrote) {
        return 0;
      }

      // Update progress periodically. Every 99 bytes just gives less boring
      // feedback than some round number like 0x100, for example.
      if ( ifu_full_offset % 99 == 0x10 ) {
         vsync();
         put_hex(ifu_full_offset, 4, 25, 16);
      }
    }
  }

  return 1;
}

void BackupRAMTestRefresh() {
  SetFontColors(FONT_WHITE, RGB(3, 3, 3), RGB(7, 7, 7), 0);
  SetFontColors(FONT_RED,   RGB(3, 3, 3), RGB(7, 0, 0), 0);
  SetFontColors(FONT_GREEN, RGB(3, 3, 3), RGB(0, 7, 0), 0);
  SetFontColors(FONT_GREY,  RGB(3, 3, 3), RGB(5, 5, 5), 0);

  set_font_pal(FONT_GREEN);
  put_string(str_backup_ram, 15, 7);

  set_font_pal(FONT_WHITE);
  put_string("Detected:", 11, 10);

  if ( bm_check() ) {
    bram_size = bm_size();
    bram_free = bm_free();

    set_font_pal(FONT_GREEN);
    put_string("YES", 24, 10);

    set_font_pal(FONT_WHITE);
    put_string("Total:", 14, 11);
    put_number(bram_size, 8, 20, 11);

    put_string("Free:", 15, 12);
    put_number(bram_free, 8, 20, 12);

    put_string("Full test:", 10, 16);

    set_font_pal(FONT_RED);
    put_string("Full test may destroy contents!", 4, 14);
  }
  else {
    set_font_pal(FONT_RED);
    put_string("NO", 24, 10);
  }

  if( ifu_full_test ) {
    if ( ifu_full_test_pass ) {
      set_font_pal(FONT_GREEN);
      put_string("PASS", 24, 16);
    }
    else {    
      set_font_pal(FONT_RED);
      put_string("FAIL", 24, 16);

      set_font_pal(FONT_GREY);
      put_string("At offset: $xxxx", 12, 18);
      put_string("Wrote: $xx  Read: $xx", 9, 19);
      put_string("Original value: $xx", 10, 20);
      put_hex(ifu_full_offset, 4, 24, 18);
      put_hex(ifu_full_wrote,  2, 17, 19);
      put_hex(ifu_full_read,   2, 28, 19);
      put_hex(ifu_full_temp,   2, 27, 20);

      if( ifu_full_read == ifu_full_temp || ifu_full_read == 0xff ) {
        set_font_pal(FONT_RED);
        put_string("Unlock error?", 13, 22);
      }
    }
  }      
  else {
    set_font_pal(FONT_WHITE);
    put_string("Hit RUN", 24, 16);
  }  
}

void BackupRAMTest()
{
  int  i = 0;

  bram_size = -1;
  bram_free = 0;
  ifu_full_test = 0;
  ifu_full_test_pass = 0;
  ifu_full_offset = 0;
  ifu_full_wrote = 0;
  ifu_full_read = 0;
  ifu_full_temp = 0;

  redraw = 1;

  while(!end)
  {
    vsync();

    if(redraw)
    {

      RedrawBG();
      refresh = 1;
      redraw = 0;
      disp_sync_on();
    }
    
    if(refresh)
    {
      refresh = 0;
      BackupRAMTestRefresh();
    }

    controller = joytrg(0);

    if ( controller & JOY_RUN ) {
      ifu_full_test = 1;
      ifu_full_test_pass = BackupRAMFullTest();

      redraw = 1;
    }
    else if ( controller & JOY_II ) {
      end = 1;
    }
  }
}


void IFURegisterTest()
{
  int i = 0;
  char y = 0;
  char *addr = 0;
  char write_nibble = 0;
  char write_val = 0;

  redraw = 1;
  sel = 0;
  addr = IFU_REG_BASE + sel;
  write_val = *addr;

  while(!end)
  {
    vsync();

    if(redraw)
    {
      RedrawBG();
      refresh = 1;
      redraw = 0;
      disp_sync_on();
    }
    if(refresh)
    {
      refresh = 0;
      SetFontColors(FONT_WHITE, RGB(3, 3, 3), RGB(7, 7, 7), 0);
      SetFontColors(FONT_RED,   RGB(3, 3, 3), RGB(7, 0, 0), 0);
      SetFontColors(FONT_GREEN, RGB(3, 3, 3), RGB(0, 7, 0), 0);
      SetFontColors(FONT_GREY,  RGB(3, 3, 3), RGB(5, 5, 5), 0);

      set_font_pal(FONT_GREEN);
      put_string(str_ifu_registers, 13, 6);

      for (i = 0 ; i < IFU_REGS ; i++ ) {
        y = i+7;

        if( i == sel ) {
          set_font_pal(FONT_RED);
          put_string(">   <", 31, y);
          set_font_pal(FONT_GREY);
          put_string("$", 32, y);

          if( write_nibble == 0 ) {
            set_font_pal(FONT_GREY);
          }
          else {
            set_font_pal(FONT_WHITE);
          }
          put_hex((write_val & 0xf0) >> 4, 1, 33, y);

          if( write_nibble == 1 ) {
            set_font_pal(FONT_GREY);
          }
          else {
            set_font_pal(FONT_WHITE);
          }
          put_hex(write_val & 0x0f, 1, 34, y);

          set_font_pal(FONT_WHITE);
        }
        else {
          set_font_pal(FONT_GREY);
          put_string(" $   ", 31, y);
          addr = IFU_REG_BASE + i;
          put_hex(peek(addr), 2, 33, y);
        }

        put_string("$", 5, y);
        put_hex(IFU_REG_BASE + i, 4, 6, y);
        put_string(ifu_reg_names[i], 11, y);
      }
    }

    set_font_pal(FONT_WHITE);
    put_string("UP/DOWN:Select  L/R:Edit value", 5, 23);
    put_string("SEL:Nibble I:Write RUN:Refresh", 5, 24);

    controller = joytrg(0);
    if( controller & JOY_RUN ) {
      redraw = 1;
    }
    else if( controller & JOY_UP ) {
      sel--;
      if ( sel <0 ) sel = IFU_REGS-1;
      addr = IFU_REG_BASE + sel;
      write_val = peek(addr);
      refresh = 1;
    }
    else if( controller & JOY_DOWN ) {
      sel++;
      if ( sel >= IFU_REGS ) sel = 0;
      addr = IFU_REG_BASE + sel;
      write_val = peek(addr);
      refresh = 1;
    }
    else if( controller & JOY_LEFT ) {
      if( write_nibble == 0 ) {
        write_val--;
      }
      else {
        write_val -= 0x10;
      }
      refresh = 1;
    }
    else if( controller & JOY_RIGHT ) {
      if( write_nibble == 0 ) {
        write_val++;
      }
      else {
        write_val += 0x10;
      }
      refresh = 1;
    }
    else if( controller & JOY_SEL ) {
      write_nibble++;
      write_nibble %= 2;
      refresh = 1;
    }
    else if( controller & JOY_I ) {
      addr = IFU_REG_BASE + sel;
      poke(addr, write_val);
      redraw = 1;
    }
    else if( controller & JOY_II ) {
      sel = 0;
      end = 1;
    }
  }
}

void RefreshIFUTests()
{
  set_font_pal(12);
  put_string("IFU/CD Tests", 14, 6);

  row = 14;

  drawmenutext(0, str_ifu_registers);
  drawmenutext(1, str_work_ram);
  drawmenutext(2, str_backup_ram);
  drawmenutext(3, str_adpcm);
}

// Theoretically non-desctructive Generic memory test.
// Note that offset and length are not validated!
int RAMTestRegion(char bank, int offset, int length) {
  int i, pos = 0;
  char val,tmp = 0;

  set_page(bank);
  for( i = 0 ; i < RAM_TEST_VALUES ; i++ ) {
    for( ifu_full_offset = offset ; ifu_full_offset < offset + length ; ifu_full_offset++ ) {
      pos = PAGE_START + ifu_full_offset;
      ifu_full_temp = peek(pos);
      poke(pos, i);
      ifu_full_wrote = i;
      ifu_full_read = peek(pos);
      poke(pos, ifu_full_temp);

      if( ifu_full_read != ifu_full_wrote ) {
        return 0;
      }
    }
  }

  return 1;
}

void IFUWorkRAMTest()
{
  int i = 0;
  char y = 0;
  char detected = 0;
  char test_sub_bank = 0;
  char test_sub_bank_pass = 0;

  sel = 0;
  redraw = 1;


  while(!end)
  {
    vsync();

    if(redraw)
    {
      RedrawBG();
      refresh = 1;
      redraw = 0;
      disp_sync_on();

      SetFontColors(FONT_WHITE, RGB(3, 3, 3), RGB(7, 7, 7), 0);
      SetFontColors(FONT_RED,   RGB(3, 3, 3), RGB(7, 0, 0), 0);
      SetFontColors(FONT_GREEN, RGB(3, 3, 3), RGB(0, 7, 0), 0);
      SetFontColors(FONT_GREY,  RGB(3, 3, 3), RGB(5, 5, 5), 0);

      for( i = 0 ; i < IFU_WRAM_SEGMENTS ; i++ ) {
        y = 9 + i;
        // Quick check/detection: write and read back one byte from start of bank.
        detected = 0;
        set_page(ifu_wram_segments[i]);
        poke(PAGE_START, 0x55);
        if( peek(PAGE_START) == 0x55 ) detected = 1;

        if ( detected ) {
          set_font_pal(FONT_GREEN);
          put_string("Detected", 27, y);
        }
        else {
          set_font_pal(FONT_RED);
          put_string("Not Found", 27, y);
        }
      }
    }

    if(refresh)
    {
      refresh = 0;

      set_font_pal(FONT_GREEN);
      put_string(str_work_ram, 14, 7);

      set_font_pal(FONT_WHITE);
      put_string("Standard 64K:", 4, 9);
      put_string("Extra 192K:", 4, 10);

      for( i = 0 ; i < IFU_WRAM_SEGMENTS ; i++ ) {
        y = 9 + i;

        if( ifu_full_test && i == sel ) {
          if( test_sub_bank == 0xff ) {
            // Test has only been triggered, did not actually start yet.
            set_font_pal(FONT_WHITE);
            put_string("Testing..", 27, y);

            // Blank out any previous failure report.
            put_string(str_spaces, 4, 18);
            put_string(str_spaces, 4, 19);
            put_string(str_spaces, 4, 20);

            test_sub_bank = 0;
          }
          else {
            // Full test is running, update counter/result.
            put_string("         ", 27, y);

            if( test_sub_bank_pass ) {
              set_font_pal(FONT_GREEN);

              if( test_sub_bank == IFU_WRAM_SEGMENT_BANKS-1 ) {
                put_string("PASS", 27, y);
                ifu_full_test = 0;
              }
              else {
                put_string("$", 27, y);
                put_hex(ifu_wram_segments[i] + test_sub_bank, 2, 28, y);

                test_sub_bank++;
              }
            }
            else {
              // Test failed, report results.
              set_font_pal(FONT_RED);
              put_string("FAIL", 27, y);

              set_font_pal(FONT_GREY);
              put_string("Bank: $xx  Offset: $xxxx", 8, 18);
              put_string("Wrote: $xx  Read: $xx", 9, 19);
              put_string("Original value: $xx", 10, 20);
              put_hex(ifu_wram_segments[i] + test_sub_bank,  2, 15, 18);
              put_hex(ifu_full_offset, 4, 28, 18);
              put_hex(ifu_full_wrote,  2, 17, 19);
              put_hex(ifu_full_read,   2, 28, 19);
              put_hex(ifu_full_temp,   2, 27, 20);

              ifu_full_test = 0;
            }
          }
        }
        else {
          // No test running, or segment being tested is not selected.
          if( i == sel ) {
            set_font_pal(FONT_WHITE);
          }
          else {
            set_font_pal(FONT_GREY);
          }
          put_string("$  -$", 18, y);
          put_hex(ifu_wram_segments[i], 2, 19, y);
          put_hex(ifu_wram_segments[i] + IFU_WRAM_SEGMENT_BANKS-1, 2, 23, y);
        }
      }

      set_font_pal(FONT_WHITE);
      put_string("UP/DOWN:Select  RUN:Test Banks", 5, 23);
    }

    if( ifu_full_test ) {
      test_sub_bank_pass = RAMTestRegion(ifu_wram_segments[sel] + test_sub_bank, 0, 0x2000);
      refresh = 1;
    }
    else {
      controller = joytrg(0);

      if ( controller & JOY_RUN ) {
        ifu_full_test = 1;
        test_sub_bank = 0xff;
        test_sub_bank_pass = 0;
        refresh = 1;
      }
      else if( controller & JOY_UP ) {
        sel--;
        if ( sel <0 ) sel = IFU_WRAM_SEGMENTS-1;
        refresh = 1;
      }
      else if( controller & JOY_DOWN ) {
        sel++;
        if ( sel >= IFU_WRAM_SEGMENTS ) sel = 0;
        refresh = 1;
      }
      else if ( controller & JOY_II ) {
        sel = 1;
        end = 1;
      }
    }
  }
}

void IFUTests()
{
  redraw = 1;
  refresh = 1;

  sel = 0;
  end = 0;
  controller = 0;

  SetFontColors(FONT_WHITE, RGB(3, 3, 3), RGB(7, 7, 7), 0);
  SetFontColors(FONT_RED,   RGB(3, 3, 3), RGB(7, 0, 0), 0);
  SetFontColors(FONT_GREEN, RGB(3, 3, 3), RGB(0, 7, 0), 0);
  SetFontColors(FONT_GREY,  RGB(3, 3, 3), RGB(5, 5, 5), 0);

  disp_off();

  while(!end)
  {
    vsync();

    if(redraw)
    {
      RedrawMain();
      refresh = 1;
      redraw = 0;
      disp_sync_on();
    }

    if(refresh)
    {
      refresh = 0;
      RefreshIFUTests();
    }

    controller = joytrg(0);

    if (controller & JOY_II)
      end = 1;

    if (controller & JOY_DOWN)
    {
      sel++;
      if(sel > 4)
        sel = 0;
      refresh = 1;
    }

    if (controller & JOY_UP)
    {
      sel--;
      if(sel < 0)
        sel = 4;
      refresh = 1;
    }

    if (controller & JOY_RUN)
    {
      showHelp(GENERAL_HW_HELP);
      redraw = 1;
    }

    if (controller & JOY_I)
    {
      disp_off();
      ResetVideo();
      switch(sel)
      {
        case 0:
          IFURegisterTest();
          break;
        case 1:
          IFUWorkRAMTest();
          break;
        case 2:
          BackupRAMTest();
          break;
        case 3:
          ADPCMTest();
          break;
        case 4:
          end = 1;
          break;
      }
      if(sel != 4)
        end = 0;

      redraw = 1;
      disp_off();
    }
  }

  set_page(0); // restore default value

  end = 0;
  sel = 2;
}
