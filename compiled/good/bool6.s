	.text
	.globl	main
main:
	pushq $1
	pushq $0
	popq %rbx
	popq %rax
	cmpq %rbx, %rax
	je .L1
	movq $0, %rax
	jmp .L2
.L1:
	movq $1, %rax
.L2:
	pushq %rax
	popq %rdi
	call print_bool
	pushq $1
	pushq $0
	popq %rbx
	popq %rax
	cmpq %rbx, %rax
	je .L3
	movq $1, %rax
	jmp .L4
.L3:
	movq $0, %rax
.L4:
	pushq %rax
	popq %rdi
	call print_bool
	pushq $1
	pushq $0
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jl .L5
	movq $0, %rax
	jmp .L6
.L5:
	movq $1, %rax
.L6:
	pushq %rax
	popq %rdi
	call print_bool
	pushq $1
	pushq $0
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jle .L7
	movq $0, %rax
	jmp .L8
.L7:
	movq $1, %rax
.L8:
	pushq %rax
	popq %rdi
	call print_bool
	pushq $1
	pushq $0
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jg .L9
	movq $0, %rax
	jmp .L10
.L9:
	movq $1, %rax
.L10:
	pushq %rax
	popq %rdi
	call print_bool
	pushq $1
	pushq $0
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jge .L11
	movq $0, %rax
	jmp .L12
.L11:
	movq $1, %rax
.L12:
	pushq %rax
	popq %rdi
	call print_bool
	movq $0, %rax
	ret
print_int:
	movq %rdi, %rsi
	leaq .Sprint_int, %rdi
	movq $0, %rax
	call printf
	ret
print_bool:
	cmpq $0, %rdi
	je .Lfalse
	movq $true, %rdi
	jmp .Lprint
.Lfalse:
	movq $false, %rdi
.Lprint:
	movq $0, %rax
	call printf
	ret
print_str:
	movq %rdi, %rsi
	leaq .Sprint_str, %rdi
	movq $0, %rax
	call printf
	ret
	.data
.Sprint_int:
	.string "%d\n"
.Sprint_str:
	.string "%s"
true:
	.string "true\n"
false:
	.string "false\n"
