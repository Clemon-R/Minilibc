	global	strcspn:function
	section	.text
strcspn:
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
	mov	cl, [rsi + r10]
	cmp	cl, 0
	je	found
	cmp	cl, dl
	je	search
	jne	find
	ret

found:
	inc	rax
	jmp	search
	ret

notfound:
	ret
