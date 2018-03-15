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
	mov	rcx, [rsi + rax]
	mov	[rdi + rax], rcx
	cmp	rax, rdx
	jl	setter
	mov	rax, rdi
	ret
