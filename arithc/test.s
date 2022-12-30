	.text
	.globl	main
main:
	pushq $1
	popq %rdi
	call print_int
	pushq $str_1
	pushq $str_2
	popq %rdi
	call print_str
	popq %rdi
	call print_str
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
str_1:
	.string "eu sou o hikas\n"
str_2:
	.string "ola"
.Sprint_int:
	.string "%d\n"
.Sprint_str:
	.string "%s"
true:
	.string "true\n"
false:
	.string "false\n"
