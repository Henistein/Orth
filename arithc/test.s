	.text
	.globl	main
main:
	pushq $0
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
	.data
.Sprint_int:
	.string "%d\n"
true:
	.string "true\n"
false:
	.string "false\n"
