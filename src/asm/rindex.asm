	global	rindex:function
	section	.text
rindex:
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
	cmp	rbx, 0
	je	notfound
	inc	rdx
	jmp	search
	ret

notfound:
	xor	rax, rax
	ret

find:
	mov	rax, rdi
	add	rax, rdx
	inc	rdx
	cmp	rbx, 0
	jnz	search
	ret
