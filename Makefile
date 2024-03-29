ASM = nasm
BOOTLOADER_FILE = bootloader.S

build: $(BOOTLOADER_FILE)
	$(ASM) -f bin $(BOOTLOADER_FILE) -o bootloader.o
	dd if=bootloader.o of=bootloader.img
	qemu-system-i386 -s bootloader.img -serial stdio

debug: $(BOOTLOADER_FILE)
	$(ASM) -f bin $(BOOTLOADER_FILE) -o bootloader.o
	dd if=bootloader.o of=bootloader.img
	qemu-system-i386 -s -S bootloader.img -serial stdio

clean:
	rm -f *.o
	rm -f *.img
