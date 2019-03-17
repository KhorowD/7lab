			model	small, c
			.CODE
			public 	GetVal
GetVal		proc	near n:word, i:word, j:word, matrix:word
			uses	bx,es,si
			
			mov		es,word ptr matrix
			mov		ax,i
			mov		bx,n
			mul		bx
			add		ax,j
			shl		ax,1
			mov		si,ax
			mov		ax, es:[si]
			
			ret
			
			
GetVal		endp
			end 