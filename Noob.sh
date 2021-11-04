#!/bin/bash

#initializing things

echo Hello User!!
echo Tell me your directory name.
cd ~
read dirname
mkdir $dirname
echo Done making directory.
cd $dirname
echo Done changing directory.
echo Now time to init the repo.
echo Tell me your repo link.
read repoinit
echo What branch you want to use?
read branch
repo init --depth=1 -u $repoinit -b $branch
echo Done initializing repo.
echo Now time to sync the repo.
echo Tell me the number of jobs to sync.
read jobs
repo sync -c -j$jobs --force-sync --no-clone-bundle --no-tags -v
echo Done syncing repo.
echo Now time to build the device.
echo Tell me the device name and brand.
read brand
read device

#cloning other stuffs
echo Now time to clone other stuffs.
echo Tell me the link to the kernel with the directory. DEMO LINK: git clone -b lineage-18.1 https://github.com/LineageOS/android_kernel_xiaomi_sdm845 kernel/xiaomi/sdm845
read kernel
git clone $kernel
echo Done cloning kernel.
echo Tell me the link to the vendor with the directory. DEMO LINK: git clone -b lineage-18.1 https://github.com/LineageOS/vendor_xiaomi vendor/xiaomi
read vendor
git clone $vendor
echo Done cloning vendor.
echo Tell me the link to the device tree and the directory. DEMO LINK: git clone -b lineage-18.1 https://github.com/LineageOS/android_device_xiaomi_beryllium device/xiaomi/beryllium
read device_tree
git clone $device_tree
echo Done cloning device tree.
echo Tell me the link to the COMMON device tree and the directory. DEMO LINK: git clone -b lineage-18.1 https://github.com/LineageOS/android_device_xiaomi_sdm845-common device/xiaomi/sdm845-common
read device_tree_common
git clone $device_tree_common
echo Done cloning device tree common.

# Building the rom

echo Now time to build the ROM.
echo Tell me the Rom name.
read rom
echo What is your device codename?
read codename
. build/envsetup.sh
lunch $rom_$codename-userdebug
mka bacon

