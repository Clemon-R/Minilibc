	global	strlen:function
	section	.text
strlen:
	mov	rax, -1
	jmp	count
	ret

count:
	add	rax, 1
	cmp	BYTE [rdi + rax], 0
	jg	count
	ret
