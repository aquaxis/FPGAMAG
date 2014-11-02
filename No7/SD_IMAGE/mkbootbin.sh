#!/bin/sh

cp ../Zybo/Zybo.sdk/SDK/SDK_Export/FSBL/Debug/FSBL.elf .
cp ../Zybo/Zybo.runs/impl/Zybo_wrapper.bit .

bootgen -image bootimage.bif -o i BOOT.BIN -w on
#bootgen -image bootimage.bif -o i BOOT.BIN -w on -split bin
