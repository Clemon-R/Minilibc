	global	rindex:function
	section	.text
rindex:
	xor	rax, rax
	xor	rdx, rdx
	jmp	find
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
