	global	memcpy:function
	section	.text
memcpy:
	mov	rax, -1
	add	rdx, -1
	cmp	rax, rdx
	jl	setter
	mov	rax, rdi
	ret

setter:
	add	rax, 1
	mov	rcx, [rsi + rax]
	mov	[rdi + rax], rcx
	cmp	rax, rdx
	jl	setter
	ret
