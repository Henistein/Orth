.text
.globl  main

main:
    pushq $42
    pushq $30

    popq %rdi
    call print_int

    popq %rdi
    call print_int

    movq $0, %rax
    ret

print_int:
    movq %rdi, %rsi
    leaq .Sprint_int, %rdi
    movq $0, %rax
    call printf
    ret

.data
.Sprint_int:
    .string "%d\n"

