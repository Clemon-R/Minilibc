	global	memmove:function
	section	.text

memmove:
	mov	r8, rdi
	mov	r9, rsi
	mov	r10, rdx
	cmp	r8, 0
	jne	setter	
	jmp	end
	ret

end:
	mov	rax, rdi
	ret

setter:
	mov	cl, [r9]
	mov	[r8], cl
	inc	r8
	inc	r9
	dec	r10
	cmp	r10, 0
	je	end
	jmp	setter
	ret
