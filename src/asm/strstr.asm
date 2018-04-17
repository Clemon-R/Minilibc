	global	strstr:function
	section	.text
strstr:
	mov	r8, rdi
	mov	rax, rdi
	cmp	byte [rsi], 0
	je	found
	cmp	r8, 0
	jne	search
	ret

search:
	cmp	byte [r8], 0
	je	notfound
	xor	r9, r9
	mov	dl, byte [rsi + r9]
	mov	cl, byte [r8 + r9]
	cmp	dl, cl
	je	check
	jne	next
	ret

next:
	inc	r8
	jmp	search
	ret

check:
	inc	r9
	mov	dl, byte [rsi + r9]
	mov	cl, byte [r8 + r9]
	cmp	dl, 0
	je	found
	cmp	cl, dl
	je	check
	jne	next
	ret

found:
	mov	rax, r8
	ret

notfound:
	xor	rax, rax
	ret
