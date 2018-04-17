	global	strcspn:function
	section	.text
strcspn:
	xor	rax, rax
	mov	r8, rdi
	jmp	search
	ret

end:
	ret

next:
	inc	r8
	inc	rax
	jmp	search
	ret

check:
	mov	cl, [r8 + r9]
	mov	dl, [rsi + r9]
	cmp	dl, 0
	je	next
	cmp	cl, dl
	je	end
	inc	r9
	jne	check
	ret

search:
	mov	cl, [r8]
	xor	r9, r9
	cmp	cl, 0
	je	end
	jne	check
	ret
