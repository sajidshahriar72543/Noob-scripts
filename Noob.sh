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
echo Tell me the brand and device code_name.
echo brand name:
read brand
echo device code_name:
read device

#cloning other stuffs
echo Now time to clone other stuffs.
echo Tell me the link to the kernel with the directory.
echo Kernel repo link:
read kernelrepo
echo What branch?
read kernelbranch
echo What directory?
read kerneltarget
git clone -b $kernelbranch $kernelrepo $kerneltarget
echo Done cloning kernel.
echo Tell me the link to the vendor with the directory.
echo Vendor repo link:
read vendorrepo
echo What branch?
read vendorbranch
echo What directory?
read vendortarget
git clone -b $vendorbranch $vendorrepo $vendortarget
echo Done cloning vendor.
echo Tell me the link to the device tree and the directory.
echo DT repo link:
read dtrepo
echo What branch?
read dtbranch
echo What directory?
read dttarget
git clone -b $dtbranch $dtrepo $dttarget
echo Done cloning device tree.
echo Tell me the link to the COMMON device tree and the directory.
echo COMMON repo link:
read commonrepo
echo What branch?
read commonbranch
echo What directory?
read commontarget
git clone -b $commonbranch $commonrepo $commontarget
echo Done cloning device tree common.

echo Done cloning other stuffs. Now please do bringup and build. Automated building is wip.

# Building the rom

# echo Now time to build the ROM.
# echo Tell me the Rom name.
# read rom
# echo What is your device codename?
# read codename
# . build/envsetup.sh
# lunch $rom_$codename-userdebug
# echo You want clean build or dirty build?
# echo press 1 for clean build and 2 for dirty build.
# if [ $1 = 1 ]
# then
# make installclean
# mka bacon
# else
# mka bacon
# fi

