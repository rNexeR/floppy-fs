nasm bootloader.asm -f bin -o bootloader.bin
nasm kernel.asm -f bin -o kernel.bin
dd if=bootloader.bin of=boot.img bs=512 count=1
dd if=kernel.bin of=boot.img bs=512 count=1 seek=1
qemu-system-x86_64 -fda boot.img 