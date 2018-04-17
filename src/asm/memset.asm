	global	memset:function
	section	.text
memset:
	mov	r8, rdi
	mov	r9, rdx
	mov	ecx, esi
	cmp	rdi, 0
	je	end
	cmp	rdx, 0
	jg	setter
	jmp	end
	ret

end:
	mov	rax, rdi
	ret

setter:
	mov	[r8], cl
	inc	r8
	dec	r9
	cmp	r9, 0
	jg	setter
	je	end
	ret
