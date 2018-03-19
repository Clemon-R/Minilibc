	global	memset:function
	section	.text
memset:
	mov	rax, -1
	add	rdx, -1
	cmp	rdi, 0
	je	notfound
	cmp	rdx, 0
	jg	setter
	mov	rax, rdi
	ret

notfound:
	mov	rax, rdi
	ret

setter:
	inc	rax
	mov	[rdi + rax], rsi
	cmp	rax, rdx
	jl	setter
	jmp	notfound
	ret
