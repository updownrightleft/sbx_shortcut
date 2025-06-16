#
# Replace search value '$1' with new value '$2' in SConscript
# sed 's/'$1'/'$2'/g' $vdk/SConscript $vdk/module.bom
# V\[0-9\]\.\{\[0-9\]\,3}
# sbx_release_version=$(grep -o "V[0-9]*\.[0-9]+[a-Z]*" $vdk/../SConscript)
sbx_release_version=$(grep "vdk_release_version = .*" $vdk/../SConscript | grep -o "\".*\"" | sed 's/\"//g')
echo Current sbx release version: $sbx_release_version
chmod +w $vdk/../SConscript $vdk/../module.bom
sed -i 's/'$sbx_release_version'/'$1'/g' $vdk/../SConscript $vdk/../module.bom
sbx_release_version=$(grep "vdk_release_version = .*" $vdk/SConscript | grep -o "\".*\"" | sed 's/\"//g')
echo Updated sbx release version: $sbx_release_version
