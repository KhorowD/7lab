			model	small, c
			.CODE
			public 	SetVal
SetVal		proc	near n:word, i:word, j:word, matrix:word, el:word
			uses	ax,bx,es,si
			
			mov		es,word ptr matrix
			mov		ax,i
			mov		bx,n
			mul		bx
			add		ax,j
			shl		ax,1
			mov		si,ax
			mov		ax,word ptr el
			mov		es:[si],ax
			
			ret
			
			
SetVal		endp
			end 