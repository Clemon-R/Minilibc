	global	memset:function
	section	.text
memset:
	mov	rax, -1
	add	rdx, -1
	cmp	rax, rdx
	jl	setter
	mov	rax, rdi
	ret

setter:
	add	rax, 1
	mov	[rdi + rax], rsi
	cmp	rax, rdx
	jl	setter
	ret
