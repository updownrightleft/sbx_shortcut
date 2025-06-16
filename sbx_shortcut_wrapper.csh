#!/bin/csh

#
#   Wrapper shell script to invoke sbx_shortcut.csh
#

# Elaborate error handling on $1 & $2.

# CASE1: Parsing Senarios based on number of arguments. eg 0,2,>3
source ~/sbx_shortcut.csh
if ( $#argv == 2  ) then    #CASE1 SENARIO1: default variables used with modification.
    setenv d_gen $1
    setenv d_ver $2
    setenv d_sel "sbx_"$d_gen"_"$d_ver
    source ~/sbx_shortcut.csh
else if ( $#argv == 0  ) then   #CASE1 SENARIO2: default variables are used without modification.
    source ~/sbx_shortcut.csh
else
    echo "invalide usage expected none or exactly 2 arguments."
    exit 1
    endif
endif    