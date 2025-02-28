set -e
cross=arm-none-eabi-

${cross}as asem.s -o obj
${cross}objcopy -O binary obj exe

chmod u+x exe
