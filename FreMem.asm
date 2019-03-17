			model	small,c
			.CODE
			public	FreeMemory
FreeMemory 	proc	near matrix:word
			push	es
			mov	ah, 49h
			mov	es,word ptr matrix
			int 	21h
			pop		es
			ret
FreeMemory 	endp
			end
	