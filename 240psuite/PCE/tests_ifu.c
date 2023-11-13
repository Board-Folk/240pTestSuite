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

#ifdef SYSCARD1 

#include "huc.h"
#include "res.h"
#include "font.h"
#include "video.h"
#include "tests.h"
#include "help.h"
#include "tools.h"
#include "float.h"

extern int xres_flags;
extern unsigned char Enabled240p;
extern unsigned char UseDefault;
extern unsigned char EnabledSoft;
extern unsigned char Enabled_C_BW;
#endif

#define FONT_WHITE 14
#define FONT_RED   15
#define FONT_GREEN 13
#define FONT_GREY  12

#define IFU_REG_MSB 0x18

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

#define RAM_TEST_VALUES 4
const char ram_test_values[RAM_TEST_VALUES] = {
  0x00,
  0x55,
  0xAA,
  0xFF
};

static int  bram_size = 0;
static int  bram_free = 0;
static int  full_test = 0;
static int  full_test_pass = 0;
static int  full_offset = 0;
static char full_wrote = 0;
static char full_read = 0;
static char full_temp = 0;

int BackupRAMFullTest()
{
  int i;

  if( bram_size <= 0 ) {
    // Backup RAM not detected, but assume 2K and allow to test.
    bram_size = 2048;
  }

  set_font_pal(FONT_GREEN);
  put_string("$0010", 17, 16);

  // Skip header to avoid subsequent odd size/free reports.
  for( full_offset = 0x10 ; full_offset < bram_size ; full_offset++ ) {
    for( i = 0 ; i < RAM_TEST_VALUES ; i++ ) {
      full_temp = bm_rawread(full_offset);

      full_wrote = ram_test_values[i];
      bm_rawwrite(full_offset, full_wrote);
      full_read = bm_rawread(full_offset);

      // Restore "original" contents (assuming correctly read...)
      bm_rawwrite(full_offset, full_temp);

      if (full_read != full_wrote) {
        return 0;
      }

      if ( full_offset % 99 == 0 ) {
         vsync();
         put_hex(full_offset, 4, 18, 16);
      }
    }
  }

  return 1;
}

void BackupRAMTest()
{
  int  i = 0;

  bram_size = -1;
  bram_free = 0;
  full_test = 0;
  full_test_pass = 0;
  full_offset = 0;
  full_wrote = 0;
  full_read = 0;
  full_temp = 0;

  redraw = 1;

  bm_format();

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
      SetFontColors(FONT_WHITE, RGB(3, 3, 3), RGB(7, 7, 7), 0);
      SetFontColors(FONT_RED,   RGB(3, 3, 3), RGB(7, 0, 0), 0);
      SetFontColors(FONT_GREEN, RGB(3, 3, 3), RGB(0, 7, 0), 0);
      SetFontColors(FONT_GREY,  RGB(3, 3, 3), RGB(5, 5, 5), 0);

      set_font_pal(FONT_GREEN);
      put_string("IFU Backup RAM", 13, 7);

      set_font_pal(FONT_WHITE);
      put_string("Detected:", 12, 10);

      if ( bm_check() ) {
        bram_size = bm_size();
        bram_free = bm_free();

        set_font_pal(FONT_GREEN);
        put_string("YES", 25, 10);

        set_font_pal(FONT_WHITE);
        put_string("Total Bytes:", 9, 11);
        put_number(bram_size, 8, 21, 11);

        put_string("Bytes Free:", 10, 12);
        put_number(bram_free, 8, 21, 12);
      }
      else {
        set_font_pal(FONT_RED);
        put_string("NO", 25, 10);
      }

      if( full_test ) {
        set_font_pal(FONT_WHITE);
        put_string("Full BRAM test:", 6, 14);
        put_string("Press RUN to test again", 8, 22);

        if ( full_test_pass ) {
          set_font_pal(FONT_GREEN);
          put_string("PASSED", 25, 14);
        }
        else {
          set_font_pal(FONT_RED);
          put_string("FAILED", 25, 14);

          set_font_pal(FONT_GREY);
          put_string("At offset: $xxxx", 12, 16);
          put_string("Wrote: $xx  Read: $xx", 9, 17);
          put_string("Original value: $xx", 10, 18);
          put_hex(full_offset, 4, 24, 16);
          put_hex(full_wrote,  2, 17, 17);
          put_hex(full_read,   2, 28, 17);
          put_hex(full_temp,   2, 27, 18);

          if( full_read == full_temp ) {
            set_font_pal(FONT_RED);
            put_string("BRAM unlock error?", 11, 19)
          }
        }
      }
      else {
        set_font_pal(FONT_WHITE);
        put_string("Press RUN for full test", 8, 14);
        set_font_pal(FONT_RED);
        put_string("Contents may be destroyed!", 6, 16);
      }

      set_font_pal(FONT_WHITE);
      put_string("Press II to exit", 11, 24);
    }

    controller = joytrg(0);

    if ( controller & JOY_RUN ) {
      set_font_pal(FONT_WHITE);
      put_string(" Running full BRAM test...", 6, 14);
      put_string("                          ", 6, 16);

      full_test = 1;
      full_test_pass = BackupRAMFullTest();

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
  char row = 0;
  char *addr;
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
      SetFontColors(FONT_WHITE, RGB(3, 3, 3), RGB(7, 7, 7), 0);
      SetFontColors(FONT_RED,   RGB(3, 3, 3), RGB(7, 0, 0), 0);
      SetFontColors(FONT_GREEN, RGB(3, 3, 3), RGB(0, 7, 0), 0);
      SetFontColors(FONT_GREY,  RGB(3, 3, 3), RGB(5, 5, 5), 0);

      set_font_pal(FONT_GREEN);
      put_string("IFU Registers", 13, 6);

      set_font_pal(FONT_WHITE);
      for (i = 0 ; i < IFU_REGS ; i++ ) {
        row = i+8;
        put_string("$", 4, row);
        put_hex(IFU_REG_MSB, 2, 5, row);
        put_hex(i, 2, 7, row);
        put_string(ifu_reg_names[i], 10, row);

        addr = (IFU_REG_MSB << 8) | (i & 0xff);
        put_hex(*addr, 2, 34, row);
      }
    }

    if( joytrg(0) != 0 ) {
      end = 1;
    }

  }
}

void RefreshIFUTests()
{
  set_font_pal(12);
  put_string("IFU/CD Tests", 14, 6);

  row = 14;

  drawmenutext(0, "IFU Registers");
  drawmenutext(1, "CD System RAM");
  drawmenutext(2, "Backup RAM");
  drawmenutext(3, "ADPCM");

  row = 22;
  DrawMenuBottom(4, 0);
}

void IFUTests()
{
  redraw = 1;
  refresh = 1;

  sel = 0;
  end = 0;
  controller = 0;

  disp_off();
  while(!end)
  {
    vsync();

#ifdef SYSCARD1
    if(!HelpItem)
    {
#endif
    if(redraw)
    {
      RedrawMain();

      refresh = 1;
      redraw = 0;
      disp_sync_on();
    }

    if(refresh)
    {
      RefreshIFUTests();
      refresh = 0;
    }

    controller = joytrg(0);

    if (controller & JOY_II)
      end = 1;

    if (controller & JOY_SEL)
    {
#ifdef SYSCARD1
      x_g = OPTIONS_AUD_HELP;
#endif
      Options();
      redraw = 1;
    }
    if (controller & JOY_DOWN)
    {
      sel++;
      if(sel > 6)
        sel = 0;
      refresh = 1;
    }

    if (controller & JOY_UP)
    {
      sel--;
      if(sel < 0)
        sel = 6;
      refresh = 1;
    }

    if (controller & JOY_RUN)
    {
      showHelp(GENERAL_HW_HELP);
      redraw = 1;
    }
#ifdef SYSCARD1
    }
    else
    {
      if(HelpItem)
      {
        sel = HelpItem - HARDWAREHELP;
        if(HelpItem != GENERAL_HW_HELP)
          controller = JOY_I;
        HelpItem = 0;
      }
    }
#endif

    if (controller & JOY_I)
    {
      disp_off();
      ResetVideo();
#ifdef SYSCARD1
      prev_select = sel;
#endif
      switch(sel)
      {
        case 0:
          IFURegisterTest();
          break;
        case 1:
          // CD System RAM
          break;
        case 2:
          BackupRAMTest();
          break;
        case 3:
          // ADPCM
          break;
        case 4:
#ifdef SYSCARD1
          x_g = OPTIONS_HW_HELP;
#endif
          Options();
          break;
        case 5:
          showHelp(GENERAL_HW_HELP);
          break;
        case 6:
          end = 1;
          break;
      }
      if(sel != 6)
        end = 0;

      redraw = 1;
      disp_off();
    }
  }
  end = 0;
#ifdef SYSCARD1
  xres_flags_g = xres_flags;
  Enabled240p_g = Enabled240p;
  UseDefault_g = UseDefault;
  EnabledSoft_g = EnabledSoft;
  Enabled_C_BW_g = Enabled_C_BW;

  prev_select = 2;
  ResetVideo();
#else
  sel = 2;
#endif
}

