	global	strcmp:function
	section	.text
strcmp:
	mov	rcx, -1
	xor	rax, rax
	cmp	rdi, rsi
	jne	check
	ret

check:
	inc	rcx
	cmp	rsi, 0
	je	bigger
	cmp	rdi, 0
	je	lower
	mov	bl, [rdi + rcx]
	mov	dl, [rsi + rcx]
	cmp	bl, 0
	jnz	check_next
	ret

check_next:
	cmp	dl, 0
	jnz	cmp
	ret

cmp:
	cmp	bl, dl
	je	check
	jg	bigger
	jl	lower
	ret

bigger:
	mov	rax, 1
	ret

lower:
	mov	rax, -1
	ret
