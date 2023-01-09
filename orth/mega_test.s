	.text
	.globl	main
main:
	pushq $0
#If: 1
	popq %rbx
	cmpq $0, %rbx
	je else_1
	pushq $10
	pushq $30
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	jmp ifelse_continua_1
else_1:
	pushq $1
#If: 2
	popq %rbx
	cmpq $0, %rbx
	je else_2
	pushq $100
	jmp ifelse_continua_2
else_2:
	pushq $200
	jmp ifelse_continua_2
ifelse_continua_2:
	jmp ifelse_continua_1
ifelse_continua_1:
	popq %rdi
	call print_int
	call main1
	call main2
	pushq $1
	popq %rdi
	call print_int
	pushq $str_1
	popq %rdi
	call print_str
	pushq $42
	pushq $10
	pushq $20
	popq %rdi
	call print_int
	popq %rdi
	popq %rdi
	pushq $0
#While: 1
	popq %rdi
	pushq %rdi
	pushq %rdi
	pushq $10
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
	je while_continua_1
while_1:
	popq %rdi
	pushq %rdi
	pushq %rdi
	call print
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	pushq %rdi
	pushq %rdi
	pushq $10
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
	jne while_1
while_continua_1:
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
	pushq $10
	popq %rdi
	call print_int
	ret
main2:
	pushq $20
	popq %rdi
	call print_int
	ret
	.data
str_1:
	.string "ola"
.Sprint_int:
	.string "%d\n"
.Sprint_str:
	.string "%s"
true:
	.string "true\n"
false:
	.string "false\n"
