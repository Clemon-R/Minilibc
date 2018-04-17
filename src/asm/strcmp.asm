	global	strcmp:function
	section	.text
strcmp:
	mov	r8, rdi
	mov	r9, rsi
	xor	rax, rax
	cmp	rdi, rsi
	jne	check
	ret

greater:
	mov	rax, 1
	ret

lower:
	mov	rax, -1
	ret

notsame:
	cmp	cl, dl
	jg	greater
	jl	lower
	ret

find:
	ret

check:
	mov	cl, [r8]
	mov	dl, [r9]
	cmp	cl, dl
	jne	notsame
	cmp	dl, 0
	je	find
	inc	r8
	inc	r9
	jmp	check
	ret