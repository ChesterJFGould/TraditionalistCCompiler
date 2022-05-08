global start
extern _main

section .text

start:
	; init stack
	mov rax, 9 ; mmap
	mov rdi, 0 ; page aligned
	mov rsi, 8388608 ; 8 MiB
	mov rdx, 3 ; rw
	mov r10, 34 ; map type = memory
	mov r8, -1 ; not a fd
	mov r9, 0 ; offset
	syscall ; stack now in rsp
	call _main
	; exit
	mov rdi, rax ; use return value as exit value
	mov rax, 60 ; specify exit system call 
	syscall
