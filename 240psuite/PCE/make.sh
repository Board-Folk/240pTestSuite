#!/bin/sh

export HUC_HOME=~/dev/huc
export PATH=$PATH:$HUC_HOME/bin
export PCE_INCLUDE=$HUC_HOME/include/huc

huc -s -t -O2 -fno-recursive -msmall 240pSuite.c font.c video.c patterns.c tests.c help.c tools.c float.c
pceas -s -raw 240pSuite.s
