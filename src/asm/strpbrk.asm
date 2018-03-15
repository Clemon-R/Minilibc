	global	strpbrk:function
	section	.text
strpbrk:
	xor	rax, rax
	mov	rbx, -1
	jmp	search
	ret

search:
	inc	rbx
	mov	dl, [rdi + rbx]
	cmp	dl, 0
	je	notfound
	xor	rcx, rcx
	xor	r10, r10
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
