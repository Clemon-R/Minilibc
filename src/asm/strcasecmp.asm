	global	strcasecmp:function
	section	.text
strcasecmp:
	mov	rcx, -1
	jmp	check
	ret

check:
	xor	rax, rax
	inc	rcx
	mov	bl, [rdi + rcx]
	mov	dl, [rsi + rcx]
	cmp	bl, 0
	jnz	check_next
	ret

check_next:
	cmp	dl, 0
	jnz	cmp
	ret

cmp:
	push	rdi
	push	rax
	movzx	rdi, bl
	call	isletter
	mov	rbx, rax
	movzx	rdi, dl
	call	isletter
	call	isletter
	mov	rdx, rax
	pop	rax
	pop	rdi
	jmp	normalcmp
	ret
	
normalcmp:
	cmp	rbx, rdx
	je	check
	jg	bigger
	jl	lower
	ret

isletter:
	mov	rax, rdi
	cmp	rdi, 97
	jge	uppercase
	ret

uppercase:
	cmp	rdi, 122
	jle	downcase
	ret

downcase:
	sub	rax, 32
	ret

bigger:
	mov	rax, 1
	ret

lower:
	mov	rax, -1
	ret
