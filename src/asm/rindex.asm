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
	inc	rdx
	ret

find:
	mov	rax, rdi
	add	rax, rdx
	inc	rdx
	jmp	search
	ret
