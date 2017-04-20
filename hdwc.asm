	global      _start                     ;must be declared for linker (ld)

	section     .text
_start:                                    ;tell linker entry point
    ;write(1, message, 13)
    mov     rax, 1                         ; system call 1 is write
    mov     rdi, 1                         ; file handle 1 is stdout
    mov     rsi, message                   ; address of string to output
    mov     rdx, 20                        ; number of bytes
    syscall                                ; invoke operating system to do the write

    ; exit(0)
    mov     eax, 60                        ; system call 60 is exit
    xor     rdi, rdi                       ; exit code 0
    syscall                                ; invoke operating system to exit
message:
    db      "Hello Docker World!", 10      ; note the newline at the end

