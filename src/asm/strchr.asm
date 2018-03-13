	global	my_strchr:function
	section	.text
my_strchr:
	mov	rax, -1
	jmp	search
	ret

search:
	add	rax, 1
	mov	bl, [rdi + rax]
	movzx	rcx, bl
	cmp	rcx, 0
	jnz	found
	cmp	rcx, 0
	je	notfound
	ret

notfound:
	xor	rax, rax
	ret

found:
	cmp	rcx, rsi
	jne	search
	add	rax, rdi
	ret
