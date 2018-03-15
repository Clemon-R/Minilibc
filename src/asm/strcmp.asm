	global	strcmp:function
	section	.text
strcmp:
	mov	rcx, -1
	xor	rax, rax
	jmp	check
	ret

check:
	inc	rcx
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
