	global	strncmp:function
	section	.text
strncmp:
	mov	r10, -1
	dec	rdx
	xor	rax, rax
	cmp	rdi, rsi
	jne	check
	ret

check:
	inc	r10
	mov	bl, [rdi + r10]
	mov	cl, [rsi + r10]
	cmp	bl, 0
	jnz	check_next
	mov	rax, -1
	ret

check_next:
	cmp	cl, 0
	jnz	cmp
	mov	rax, 1
	ret

cmp:
	cmp	rdx, r10
	je	end
	cmp	bl, cl
	je	possiblecheck
	jg	bigger
	jl	lower
	ret

end:
	ret

possiblecheck:
	dec	rdx
	cmp	rdx, 0
	jg	check
	ret

bigger:
	mov	rax, 1
	ret

lower:
	mov	rax, -1
	ret
