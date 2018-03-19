	global	strpbrk:function
	section	.text
strpbrk:
	xor	rax, rax
	mov	rbx, -1
	cmp	rsi, 0
	jnz	search
	ret

search:
	cmp	rdi, 0
	je	notfound
	inc	rbx
	mov	dl, [rdi + rbx]
	cmp	dl, 0
	je	notfound
	xor	rcx, rcx
	mov	r10, -1
	jmp	find
	ret

find:
	inc	r10
	mov	cl, [rsi + r10]
	cmp	cl, 0
	je	search
	cmp	cl, dl
	je	found
	jne	find
	ret

found:
	mov	rax, rdi
	add	rax, rbx
	ret

notfound:
	xor	rax, rax
	ret
