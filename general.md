# Introduction

Here are all tips and tricks and usefull information which were useful or me and that could be hard to rememeber.

# About disk architecture

## The MS-DOS or MBR partitionning

- The first sector of each disk is called the MBR.
- Up to know, sectors are still 512 bytes. It could change in the future.(i think the initiative would be at disk firmware level)
- The first sector is the LBA0.

*NB : In 2020, we can now forget the Cylinder / Head / Sector for physical adressing and use the LBA system which is more simple)*

- Thre are different standard for the MBR but the physical address of the partition table is always the same.
- Partition table can describe more than 4 partitions.

*NB : In Linux workd to bypass this limitation, we used to use logical partitions...But in 2020 we can forget about that as GPT as replaced MBR. With GPT there is still limitation...but the number of partiations that can be created is huge.*

- It's in the partition table that is indicated which partiation is bootable. Only one partition can be bootable.
- The MBR will also record a bootstrap code (Grub, SysLinux...)

*NB : It's possible to modify precisely only this boutstrap code with the dd command counting the number of bytes till the beginning of partition table.*

## Booting with an MBR disk

- Bootstrap code is in the MBR.

- With Grub, additionnal bootstrap code is recorded after the MBR and before the block 63. This is enough to get Grub fully installed on a disk. 

- For historical reasons the first partitin can't start earlier than block 64.

* NB : This additionnal code in the "dead zone" is enough to make Grub understanding some commone filesystems (FAT and Ext4) *

- But Grub will try to reach and read a grub.cfg file. This is a txt file that will indicate him where to boot, which choice (kernel version, initrd, kernel parameters to propose). If Grub can't reach it, it will directly propose the command line interface

* NB : This grub.cfg file is located /boot/grub on ubuntu. As editing it is quite hard there is a special linux command for it. This command not only will affect the /boot/grub/grub.cfg file but will also modify the MBR and the dead zone. That's why using this command is much much safer. *

- It seems it can happen that there is also additionnal bootstrap code in the VBR but i don't think Grub use it.

* NB :  VBR for Volume Boot Record is the first sector of each primary partition. I think this is where is recorded the label of the partition. *

## The GPT - UEFI - ESP partitioning and booting

- This partitionning can be undertood only by a computer which has a real UEFI chipset

* NB : We can consider that the BIOS or UEFI is like an EEPROM that is flasheable. BIOS EEPROM was very tiny (1970 - 1980) *

- The GPT is also at the beginning of the disk...But the first sector is an MBR describing one big partition.
- UEFI computers can read and boot MBR and GPT disks but BIOS computers can't boot on GPT disks.
- The GPT is recorded two times : at the beginning of the disk and at the end (for safety reasons i suppose)
- the EEPROM for UEFI is big enough to store the code to understand FAT partition. 
- It makes booting much more simple : The code of the UEFI -> The GPT table -> The ESP partition which is using FAT filesystem
- The ESP partition must be well declared  ("flagged")as ESP partition in the GPT table.

- For now, we still often use a bootloader (Grub for example). So the ESP partition is used to load GRUB. But it would be possible to put in this ESP partition the linux kernel and initrd and to directly launch linux without bootloader.


## About installing and saving linux configuration

- To install an \*.iso image of linux, a simple dd (to sdx not to sdx1 or sdx2!!) command is enough. The iso image is the heritage of CDROM. So it puts this CDROM directly on the USB key and it can boot on it.

- They best way is always to use these "live and install" distributions.

- Doing a separate partition for home is not a good idea. Firefox extensions, Vim extensions, gpg keys, many configuration files of the applications will record configuratin files in the home partition...And when you reinstall linux, many of these configuration files could be just useless and bring the mess.

- Doing a separate boot partition could be usefull if there is dual boot. But for simple boot it's usless and brings complexity.

- Save the whole disk with Clonezilla, it will save the MBR (probably the dead zone also) and a partition of 250 Go will not create an image of 250 Go. It will do it cleverly and so if partiation is 5% use it will compress it very well. For recovery the computer will come **Exactly** back to the last backup. 

- To launch linux in command line from grub i do that : 
~~~
grub> linux /boot/vmlinuz root=/dev/sdb1
grub> initrd /initrd.img
grub> boot
~~~

*NB : It's very important to launch the right root which is incating the root partition / otherwise boot wil never work. Which sdxY to launch seems not predictable.*

## About VIM Plugins

- I use the package manager included in VIM8+ and git system to save plugins.

- What is mandatory for plugin hosting is a folder /home/username/.vim/pack/

- At this level it's possible to create forlders to sort plugins : basic, python, coloring, markdown.

- In each group will be a folder start and a folder opt.

- In each of these folders will be a folder containg the content of the git repo (just do git clone in the start or opt folder)

- In VIM, with this command :packadd {name} it's possible to activate the plugins located in opt folder

- Even if a plugin is well in the start folder, you have to edit the vimrc file and to add it "autocmd VimEnter * NERDTree"

- For NERDTree :

Edit the vimrc in thus way (auto-execute + place cursor in the new window) 
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

t: Open the selected file in a new tab
i: Open the selected file in a horizontal split window
s: Open the selected file in a vertical split window
I: Toggle hidden files
m: Show the NERD Tree menu

- For navigation between tabs and windows : 

To navigate between windows 
Ctrl+W and then the arrow keys.

To navigate between tabs :
:tabn         go to next tab
:tabp         go to previous tab
:tabfirst     go to first tab
:tablast      go to last tab





