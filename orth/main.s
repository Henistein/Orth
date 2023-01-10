	.text
	.globl	main
main:
	pushq $400000
	popq %rax
	movq %rax, N
	call main1
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
main1:
	pushq $0
	pushq $1
#While: 1
	popq %rdi
	popq %rsi
	pushq %rsi
	pushq %rdi
	pushq %rsi
	movq N, %rax
	pushq %rax
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jl .L1
	movq $0, %rax
	jmp .L2
.L1:
	movq $1, %rax
.L2:
	pushq %rax
	popq %rbx
	cmpq $0, %rbx
	je while_continua_1
while_1:
	popq %rdi
	pushq %rdi
	pushq %rdi
	popq %rdi
	call print_int
	popq %rdi
	popq %rsi
	pushq %rsi
	pushq %rdi
	pushq %rsi
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	popq %rsi
	pushq %rsi
	pushq %rdi
	pushq %rsi
	movq N, %rax
	pushq %rax
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	jl .L3
	movq $0, %rax
	jmp .L4
.L3:
	movq $1, %rax
.L4:
	pushq %rax
	popq %rbx
	cmpq $0, %rbx
	jne while_1
while_continua_1:
	popq %rdi
	popq %rdi
	ret
	.data
N:
	.quad 1
.Sprint_int:
	.string "%d\n"
.Sprint_str:
	.string "%s"
true:
	.string "true\n"
false:
	.string "false\n"
