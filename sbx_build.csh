#!/bin/csh

#
#   Shell script to create and build RCar sandbox
#

# Elaborate error handling on $1 & $2.

# CASE1: Start with a clean environment. (State 1)
if (! $?script_sbx_short ) then
    source ~/sbx_shortcut_wrapper.csh $1 $2
else   # CASE2: Start with a State 2, default variables are already set.
    if ( $#argv == 2  ) then    #CASE2 SENARIO1: default variables used with modification.
        source ~/sbx_shortcut_wrapper.csh $1 $2
    else if ( $#argv == 0  ) then   #CASE2 SENARIO2: default variables are used without modification.
        source ~/sbx_shortcut_wrapper.csh 
        echo "hit"
    else
        echo "invalide usage expected none or exactly 2 arguments."
        exit 1
    endif    
endif

mkdir -p $sbx
cd $sbx
cp ~/$generation"_sandboxdef" $sbx/sandboxdef
# ls ~/$generation"_sandboxdef"
which sx2
sx2 -j 6 -w "in01vproto12_""sbx_"$sbx_select ./sandboxdef && python $rbil/rbil_main.py --action SBOX_BUILD_RELEASE && touch $sbx/sbx_update.log && date >> $sbx/sbx_update.log