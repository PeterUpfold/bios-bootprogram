# Debugging in QEMU

Reference: https://www.qemu.org/docs/master/system/gdb.html

Add `-s` and `-S` to the `Makefile` qemu target:
    $ qemu-system-x86_64 -s -S bootloader.img -serial stdio

Launch `gdb`

    $ gdb
    (gdb) target remote localhost:1234

## Challenges

There are no symbols at this time, but we can perhaps exploit the fact that all instructions are loaded at known addresses to set breakpoints.

The bootloader is loaded into memory at 0x7C00. To break at our first instruction:

    b *0x7c00

