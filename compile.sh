# Building the rom

cd ~
echo "Tell me rom source dir. Make sure the source is in your HOME dir"
read rom_src
cd $rom_src

echo "Tell me the Rom name."
read rom
echo "What is your device codename?"
read codename
. build/envsetup.sh
lunch $rom_$codename-userdebug
echo "You want clean build or dirty build?"
echo "Press 1 for clean build and 2 for dirty build."
if [ $1 = 1 ]
then
make installclean
mka bacon
else
mka bacon
fi