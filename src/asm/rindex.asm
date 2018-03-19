	global	rindex:function
	section	.text
rindex:
	xor	rax, rax
	xor	rdx, rdx
	cmp	rdi, 0
	jnz	find
	ret

search:
	mov	bl, [rdi + rdx]
	movzx	rbx, bl
	cmp	rsi, rbx
	je	find
	cmp	rbc, 0
	je	notfound
	inc	rdx
	ret

notfound:
	xor	rax, rax
	ret

find:
	mov	rax, rdi
	add	rax, rdx
	inc	rdx
	jmp	search
	ret
