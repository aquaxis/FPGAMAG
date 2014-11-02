#!/bin/sh

cp ../ZYBO/Zybo.sdk/FSBL/Debug/FSBL.elf .
cp ../ZYBO/Zybo.runs/impl/Zybo_wrapper.bit .

bootgen -image bootimage.bif -o i BOOT.BIN -w on
#bootgen -image bootimage.bif -o i BOOT.BIN -w on -split bin
