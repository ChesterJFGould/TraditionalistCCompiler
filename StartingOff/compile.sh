#! /bin/sh

if [ "$#" -lt 2 ]; then
	echo "usage: $0 <input file> <output file>"
	exit 1
fi

asmtmp=$(mktemp)
objtmp=$(mktemp)
crt0tmp=$(mktemp)

cleanup () {
	rm -f "$asmtmp" "$objtmp" "$crt0tmp"
}

if ! ./cgcc < "$1" > "$asmtmp"; then
	echo "Compilation failed" 1>&2
	cleanup
	exit 1
fi

nasm -f elf64 -o "$objtmp" "$asmtmp"
nasm -f elf64 -o "$crt0tmp" "runtime/crt0.s"

ld -e start -o "$2" "$objtmp" "$crt0tmp"

# cleanup
