	.text
	.globl	main
main:
	pushq $1
	popq %rdi
	pushq %rdi
	pushq %rdi
#If: 1
	popq %rbx
	cmpq $0, %rbx
	je else_1
	popq %rdi
	pushq %rdi
	pushq %rdi
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
	jmp ifelse_continua_1
else_1:
	popq %rdi
	pushq %rdi
	pushq %rdi
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
	jmp ifelse_continua_1
ifelse_continua_1:
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
