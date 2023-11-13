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
          //  IFU Registers
          break;
        case 1:
          // CD System RAM
          break;
        case 2:
          // Backup RAM
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

