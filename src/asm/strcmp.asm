	global	strcmp:function
	section	.text
strcmp:
	mov	r8, rdi
	mov	r9, rsi
	xor	rax, rax
	cmp	rdi, rsi
	jne	check
	ret

found:
	movzx	rcx, cl
	movzx	rdx, dl
	sub	rcx, rdx
	mov	rax, rcx
	ret

find:
	ret

check:
	mov	cl, [r8]
	mov	dl, [r9]
	cmp	cl, dl
	jne	found
	cmp	dl, 0
	je	find
	inc	r8
	inc	r9
	jmp	check
	ret