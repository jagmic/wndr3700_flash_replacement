# wndr3700_flash_replacement
Have you ever thinked about a little bit improve your old WNDR3700 from Netgear ? 
It is the way how to do that using a new one nor flash. But first we have to make some backup date from your old flash memory. What we can gain ? WNDR3700 is very good device and with combination with openwrt you can configure as you like. But new one compilation of openwrt uses much more space therefore if you think about numerous modules your flash space will be not enaugh. Let's start.
1. What do you need :
Flash for replacemnt. Probably your router consist flash Macronix MX25L6405DMI-12G
![IMG20230711195415](https://github.com/jagmic/wndr3700_flash_replacement/assets/127594403/23188cb8-88ac-42ad-aefa-a22cfdd16cc8)
so you can chose similar but larger for example it could be MX25L256(blahblah), MX25L128(blahblahblah) etc. Organisation of memory must be the same like old one. If you have some troubles please check datasheet on website.
3.  Soldering iron, tin with some topnic and if it is your first time a lot patient
4. Programmator - I used CH341A chip and additionaly some SW for that. 
![IMG20230907220114](https://github.com/jagmic/wndr3700_flash_replacement/assets/127594403/96a3cb31-d826-4c90-8e78-ab40c1d3f152)
In OS Linux you can do this flashrom, but if you feel not comfortable without GUI please use something like CH341A programmer, Neo programmer etc... 
![Ch341a-New-Update](https://github.com/jagmic/wndr3700_flash_replacement/assets/127594403/917b75cc-2b0b-46f2-9fc0-847a103fa943)
there is a lot of software on websites and all are user friendly so even if you dont know anything about electronic it will be peace of cake for you I hope.
5. You can't forget make some copy all significant partitions especially art.bin. It's important because without this your wifi module will not work. Luci shares possibility copy all created by kernel partitions in mtd format via website so making this is easy . If you like konsole you can use command:
ssh root@IP_address "dd if=/dev/mtd6" | of=art.bin
6. When all this steps was made by you can start proper hardware replacement : 
a) Use screw for open router cover - photo nr 1
b) Wait for proper tempearature you soldering iron and using topnic warm up all pins your nand flash and lift it up - photo nr 2
c) When all are ready put it inside programmer and read all memory from flash. Save it and give it name
d) After this steps put new one flash to your programmer and write all data from previous step
e) Your last one task is soldering new one flash back to router and close cover.
7. OK. Your router now has new one flash with a lot of memory, but still will be use old kernel memory organisation and after restart you couldn't seing much more space on your /overlay. So now we have to prepare a new image to router and recompile with some changes in dts file - script bash. 
Important even if you recompile new image for your new nor flash you can still be able install all packeges from official openwrt repository as you like before replacement. But for do that you have to use offical and stable version from openwrt repository for example 22.03.5. Check manual how to prepare you OS for cross compilation https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem and how to do it quickly https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem .
8. Recompile your firmware - check steps and depencieses as was mentionted before. It could take some time so be patient. Magic version should mach for official version, otherwise you want be able install packages from official repo.
9. If everything work run your router and restore art partition. Use command dd if=art.bin ssh root@IP_address | of=/dev/mtd6
