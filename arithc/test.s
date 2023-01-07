	.text
	.globl	main
main:
	popq %rax
	movq $-1, %rbx
	imulq %rbx, %rax
	pushq %rax
	popq %rdi
	popq %rax
	movq $0, %rdx
	idivq %rdi
	pushq %rdx
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jg .L1
	pushq %rbx
	jmp .L2
.L1:
	pushq %rax
.L2:
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jg .L3
	pushq %rax
	jmp .L4
.L3:
	pushq %rbx
.L4:
	popq %rbx
	popq %rax
	cmpq %rbx, %rax
	je .L5
	movq $0, %rax
	jmp .L6
.L5:
	movq $1, %rax
.L6:
	pushq %rax
	popq %rbx
	popq %rax
	cmpq %rbx, %rax
	je .L7
	movq $1, %rax
	jmp .L8
.L7:
	movq $0, %rax
.L8:
	pushq %rax
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
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jl .L11
	movq $0, %rax
	jmp .L12
.L11:
	movq $1, %rax
.L12:
	pushq %rax
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jge .L13
	movq $0, %rax
	jmp .L14
.L13:
	movq $1, %rax
.L14:
	pushq %rax
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jle .L15
	movq $0, %rax
	jmp .L16
.L15:
	movq $1, %rax
.L16:
	pushq %rax
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
