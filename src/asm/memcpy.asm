	global	memcpy:function
	section	.text
memcpy:
	xor	rcx, rcx
	mov	rax, -1
	add	rdx, -1
	cmp	rdx, -1
	jg	setter
	mov	rax, rdi
	ret

setter:
	add	rax, 1
	mov	cl, [rsi + rax]
	movzx	rcx, cl
	mov	[rdi + rax], cl
	cmp	rax, rdx
	jl	setter
	mov	rax, rdi
	ret
