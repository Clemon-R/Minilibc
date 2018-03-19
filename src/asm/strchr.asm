	global	strchr:function
	section	.text
strchr:
	xor	rax, rax
	xor	rdx, rdx
	cmp	rdi, 0
	jnz	search
	ret

search:
	mov	bl, [rdi + rdx]
	movzx	rbx, bl
	cmp	rsi, rbx
	je	find
	inc	rdx
	cmp	rbx, 0
	jnz	search
	ret

notfound:
	xor	rax, rax
	ret

find:
	mov	rax, rdi
	add	rax, rdx
	inc	rdx
	ret
