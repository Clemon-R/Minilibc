	global	strstr:function
	section	.text
strstr:
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
	mov	r10, -1
	jmp	find
	ret

find:
	inc	r10
	push	rbx
	add	rbx, r10
	mov	dl, [rdi + rbx]
	mov	cl, [rsi + r10]
	pop	rbx
	cmp	cl, 0
	je	found
	cmp	cl, dl
	je	find
	jne	search
	ret

found:
	mov	rax, rdi
	add	rax, rbx
	ret

notfound:
	xor	rax, rax
	ret
