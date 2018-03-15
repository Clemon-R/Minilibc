	global	my_memmove:function
	section	.text
my_memmove:
	xor	rcx, rcx
	mov	rax, -1
	add	rdx, -1
	cmp	rax, rdx
	jl	setter
	ret

setter:
	inc	rax
	cmp	rax, rdx
	jl	setter
	dec	rax
	mov	rcx, [rsi + rax]
	mov	[rdi + rax], rcx
	mov	rax, rdi
	ret
