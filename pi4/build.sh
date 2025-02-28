set -e
cross=aarch64-linux-gnu-

${cross}as asem.s -o obj
${cross}objcopy -O binary obj exe

chmod u+x exe
