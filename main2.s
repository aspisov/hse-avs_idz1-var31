	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	read_input
	.type	read_input, @function
read_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi # array
	mov	DWORD PTR -28[rbp], esi # size
	mov	DWORD PTR -4[rbp], 0 # локальная переменная i
	jmp	.L2
.L3: # тело цикла for 
	mov	eax, DWORD PTR -4[rbp] # i
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp] # array
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT # scanf("%d", &array[i])
	add	DWORD PTR -4[rbp], 1 # ++i
.L2: # проверка условия
	mov	eax, DWORD PTR -4[rbp] # i
	cmp	eax, DWORD PTR -28[rbp] # сравнение i и size
	jl	.L3
	nop
	nop
	leave
	ret
	.size	read_input, .-read_input
	.globl	make_new_array
	.type	make_new_array, @function
make_new_array:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi # old_array
	mov	QWORD PTR -32[rbp], rsi # new_array
	mov	DWORD PTR -36[rbp], edx # size
	mov	DWORD PTR -8[rbp], 0 # локальная переменная i
	jmp	.L5
.L6: # тело
	mov	eax, DWORD PTR -8[rbp] # i
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp] # old_array
	lea	rcx, [rdx+rax]
	mov	eax, DWORD PTR -8[rbp] # i
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp] # new_array
	add	rdx, rax
	mov	eax, DWORD PTR [rcx]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -8[rbp], 2 # i += 2
.L5: # условие
	mov	eax, DWORD PTR -8[rbp] # i
	cmp	eax, DWORD PTR -36[rbp] # сравнение i и size
	jl	.L6
	mov	DWORD PTR -4[rbp], 1 # i, но которая равна 1
	jmp	.L7
.L8: # тело
	mov	eax, DWORD PTR -4[rbp] # i
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp] # old_array
	lea	rcx, [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	esi, eax
	mov	eax, DWORD PTR -36[rbp] # size
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	add	esi, eax
	mov	eax, DWORD PTR -36[rbp]
	cdq
	shr	edx, 31
	add	eax, edx
	and	eax, 1
	sub	eax, edx
	add	eax, esi
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp] # new_array
	add	rdx, rax
	mov	eax, DWORD PTR [rcx]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -4[rbp], 2 # i += 2
.L7: # условие
	mov	eax, DWORD PTR -4[rbp] # i
	cmp	eax, DWORD PTR -36[rbp] # сравнение i и size
	jl	.L8
	nop
	nop
	pop	rbp
	ret
	.size	make_new_array, .-make_new_array
	.section	.rodata
.LC1:
	.string	"%d "
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi # array
	mov	DWORD PTR -28[rbp], esi # size
	mov	DWORD PTR -4[rbp], 0 # локальная переменная i
	jmp	.L10
.L11: # тело цикла for
	mov	eax, DWORD PTR -4[rbp] # i
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp] # array
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT # printf("%d ", array[i])
	add	DWORD PTR -4[rbp], 1 # i++
.L10: # проверка  условия
	mov	eax, DWORD PTR -4[rbp] # локальная переменная i
	cmp	eax, DWORD PTR -28[rbp] # сравнение i и size
	jl	.L11
	nop
	nop
	leave
	ret
	.size	print_array, .-print_array
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 88
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	lea	rax, -92[rbp] # n
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT	# scanf("%d", &n)
	mov	eax, DWORD PTR -92[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -112[rbp], rdx # old_array
	mov	QWORD PTR -104[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -128[rbp], rdx # new_array
	mov	QWORD PTR -120[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	edi, 16
	mov	edx, 0
	div	rdi
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L13:
	cmp	rsp, rdx
	je	.L14
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L13
.L14:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L15
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L15:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -92[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rsi, rsp
	sub	rsi, rdx
	mov	rdx, rsi
.L16:
	cmp	rsp, rdx
	je	.L17
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L16
.L17:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L18
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L18:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax
	mov	edx, DWORD PTR -92[rbp] # n
	mov	rax, QWORD PTR -80[rbp] # old_array
	mov	esi, edx
	mov	rdi, rax
	call	read_input # вызов read_input
	mov	edx, DWORD PTR -92[rbp] # n
	mov	rcx, QWORD PTR -64[rbp] # # new_array
	mov	rax, QWORD PTR -80[rbp] # old_array
	mov	rsi, rcx
	mov	rdi, rax
	call	make_new_array # вызов make_new_array
	mov	edx, DWORD PTR -92[rbp] # n
	mov	rax, QWORD PTR -64[rbp] # new_arraya
	mov	esi, edx
	mov	rdi, rax
	call	print_array # вызов print_array
	mov	eax, 0
	mov	rsp, rbx
	mov	rbx, QWORD PTR -56[rbp]
	xor	rbx, QWORD PTR fs:40
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
