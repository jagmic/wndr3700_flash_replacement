#!/bin/bash
echo "This script will help you rebuild specifis dts file for your compilation.Please enter new size memory in MB"
read memory
if (( $memory == 32 ))
then
echo "32"
sed -i 's/0x780000/0x1f80000/g;s/7f0000/1ff0000/' $(find ~ -name "ar7161_netgear_wndr3700.dts")
elif (( $memory == 64 ))
then "64"
sed -i 's/0x780000/0x3f80000/g;s/7f0000/3ff0000/' $(find ~ -name "ar7161_netgear_wndr3700.dts")
elif (( $memory == 16 ))
then
echo "16"
sed -i 's/0x780000/0xf80000/g;s/7f0000/ff0000/' $(find ~ -name "ar7161_netgear_wndr3700.dts")
elif (( $memory !=16 )) && (( $memory !=32 )) && (( $memory !=64 ))
then
echo "Warning - your choice not match for any pattern"
fi
