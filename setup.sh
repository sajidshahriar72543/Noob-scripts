#!/bin/bash

#initializing things

echo Hello User!!
echo "Tell me your directory name."
cd ~
read dirname
mkdir $dirname
echo "Done making directory."
cd $dirname
echo "Done changing directory."
echo "Now time to init the repo."
echo "Tell me your repo link."
read repoinit
echo "What branch you want to use?"
read branch
repo init --depth=1 -u $repoinit -b $branch
echo "Done initializing repo."
echo "Now time to sync the repo."
echo "Tell me the number of jobs to sync."
read jobs
repo sync -c -j$jobs --force-sync --no-clone-bundle --no-tags -v
echo "Done syncing repo."
echo "Now time to build the device."
echo "Tell me the brand and device code_name."
echo "brand name:"
read brand
echo "device code_name:"
read device

#cloning other stuffs
echo "Now time to clone other stuffs."
echo "Tell me the link to the kernel with the directory."
echo "Kernel repo link:"
read kernelrepo
echo "What branch?"
read kernelbranch
echo "What directory?"
read kerneltarget
git clone -b $kernelbranch $kernelrepo $kerneltarget
echo "Done cloning kernel."
echo "Tell me the link to the vendor with the directory."
echo "Vendor repo link:"
read vendorrepo
echo "What branch?"
read vendorbranch
echo "What directory?"
read vendortarget
git clone -b $vendorbranch $vendorrepo $vendortarget
echo "Done cloning vendor."
echo "Tell me the link to the device tree and the directory."
echo DT repo link:
read dtrepo
echo "What branch?"
read dtbranch
echo "What directory?"
read dttarget
git clone -b $dtbranch $dtrepo $dttarget
echo "Donecloning device tree."
echo "Tell me the link to the COMMON device tree and the directory."
echo "COMMON repo link:"
read commonrepo
echo "What branch?"
read commonbranch
echo "What directory?"
read commontarget
git clone -b $commonbranch $commonrepo $commontarget
echo "Done cloning device tree common."

# echo "Done cloning other stuffs. Now please do bringup and build. Automated building is wip."

read -p "Enter the rom name device adopted already : " word
read -p "Enter the rom name you going to compile : " replace

echo "Enter the makefile name"
echo "For eg lineage_bacon.mk"
read mkfile

read -p "You entered: $mkfile is correct y/n  " yn

read -p "Should we proceed? y/n " yn
case $yn in
    [Yy]* ) perl -pi -e "s/$word/$replace/" $word*.mk
            perl -pi -e "s/$word/$replace/"  AndroidProducts.mk
            mv $word*.mk $mkfile;;
    [Nn]* ) exit;;
esac

# Special thanks to https://github.com/beingmishra

echo "Now run Compile.sh after doing other necessary changes :)"

