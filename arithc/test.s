	.text
	.globl	main
main:
print_int:
	movq %rdi, %rsi
	leaq .Sprint_int, %rdi
	movq $0, %rax
	call printf
	ret
	.data
.Sprint_int:
	.string "%d\n"
