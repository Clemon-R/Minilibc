	global	strlen:function
	section	.text
strlen:
	mov	rax, -1
	cmp	rdi, 0
	jnz	count
	je	notfound
	ret

notfound:
	xor	rax, rax
	ret

count:
	add	rax, 1
	cmp	BYTE [rdi + rax], 0
	jg	count
	ret
