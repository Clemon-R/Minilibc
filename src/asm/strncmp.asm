	global	strncmp:function
	section	.text
strncmp:
	mov	r10, -1
	xor	rax, rax
	jmp	check
	ret

check:
	inc	r10
	mov	bl, [rdi + r10]
	mov	cl, [rsi + r10]
	cmp	bl, 0
	jnz	check_next
	ret

check_next:
	cmp	cl, 0
	jnz	cmp
	ret

cmp:
	cmp	bl, cl
	je	possiblecheck
	jg	bigger
	jl	lower
	ret

possiblecheck:
	dec	rdx
	cmp	rdx, 0
	jg	check
	ret

bigger:
	mov	rax, 1
	ret

lower:
	mov	rax, -1
	ret
