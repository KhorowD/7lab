			model	small, c
			.CODE
			public 	AllocMemory
AllocMemory	proc	near 
			arg 	n:word, matrix:word
			uses	ax,bx,dl,si
			
			mov		ax,n
			mov		bx,8
			div		bx
			cmp		dl,0
			jz		good
			
			inc		ax
			
good:		

			mul		ax
			jo		over
			xchg	ax,bx
			mov		ah,48h
			int		21h
			jnc		correct
			
			
over:		mov		ax,1
			ret		
			
correct:	mov		si,	mtx
			mov		[si], ax
			xor		ax,ax
			
			ret
			
			
AllocMemory	endp
			end 
		