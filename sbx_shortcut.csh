#!/bin/csh

#
#   Shell script to create enviorment variable as path shortcuts
#

# Make select flexible
# check selected sandbox path
# create small --help

# set init variables
if ( ! $?script_sbx_short ) then
    setenv script_sbx_short 0
endif
# set init variables

# source defaults variables 
if ($script_sbx_short == 0) then
    source ~/sbx_def_short.csh
    setenv script_sbx_short 1
endif
# source defaults variables 

# set sbx paths
if ($script_sbx_short == 1) then
    setenv sbx_select $d_sel
    # if ( $?1 ) then
    #     setenv sbx_select $1
    # endif

    setenv sbx_home $d_home
    # if ( $?3 ) then
    #     setenv sbx_home $3
    # endif
    # constants
    setenv vendor       RENESAS
    setenv project      RCar
    setenv generation $d_gen
    # if ( $#argv >= 2 ) then
    #     setenv generation $2
    # else if ( $?d_gen ) then
    #     setenv generation $d_gen
    endif
    setenv family       $project'_'$generation
    setenv V            1.0

    # path level 1
    setenv sbx      $sbx_home/$sbx_select
    setenv src      $sbx/src
    setenv inst     $sbx/install

    # path level 2
    setenv unify            $src/unify
    setenv testing          $src/testing
    setenv ip_automotive    $src/IP_automotive

    # path level 3
    setenv snps_owned    $ip_automotive/SNPS_owned

    # path level 4
    setenv platforms     $snps_owned/Platforms
    setenv peripherals   $snps_owned/Peripherals

    # path level 5
    setenv platform_vendor     $platforms/$vendor
    setenv automotive          $peripherals/Automotive

    # path level 6
    setenv rcar             $automotive/$project

    setenv vendor_project   $platform_vendor/$family/$V     
    setenv vendor_doc       $platform_vendor/$family'_doc'/$V   
    setenv vendor_test      $platform_vendor/$family'_qa'/$V      

    setenv vdk       $vendor_project/$project'_'$generation'_system'
    setenv utils     $rcar/Utils

    setenv software       $vdk/software
    setenv vpconfig       $vdk/vpconfigs
    setenv helperscript   $utils/helperScripts

    setenv rbil   $helperscript/RBIL

    # files alias
    setenv vdksys   $vdk/$project'_'$generation'_system.vdksys'

    # path alias
    # setenv sbx      $sbx_select
    setenv auto     $automotive
    setenv $generation     $platform_vendor
    setenv vpc      $vpconfig
    setenv qa   $vendor_test 

    echo selected-sandbox: "\033[1m$sbx_select\033[0m"
    echo selected-generation: "\033[1m$generation\033[0m"
# set sbx paths