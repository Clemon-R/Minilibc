	global	memset:function
	section	.text
memset:
	mov	rbx, -1
	mov	rax, rdi
	add	rdx, -1
	cmp	rdi, 0
	je	notfound
	cmp	rdx, 0
	jg	setter
	ret

notfound:
	ret

setter:
	inc	rbx
	mov	[rdi + rbx], rsi
	cmp	rbx, rdx
	jl	setter
	ret
