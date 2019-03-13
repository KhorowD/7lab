			model	small, c
			.CODE
			public 	AllocMemory


IntOut	proc			;Процедура вывода целого числа
		push 	cx
		push 	ax
		push 	bx
		push 	dx
		push 	si
        	xor	cx,cx		;Обнуляем счетчик CX
		mov	bx,10   	;в BX помещаем делитель
		cmp	ax,0		;проверяем знак числа
		jge	z		;если неотрицательное - на z
		neg	ax		;меняем знак числа
		push	ax		;Сохраняем число перед вызовом
					;функции, использующей ax
		mov	ah,2		;функцией 02 выводим знак '-'
		mov	dl,'-'  
		int	21h
		pop	ax		;Востанавливаем число в регистр AX
z:		inc	cx		;считаем количество получающихся цифр
		
		xor	dx,dx		;преобразуем делимое к 32 разрядам
		
		div	bx		;получаем очередную цифру
		push	dx		;Сохраняем ее в стеке
		or	ax,ax		;проверяем есть ли еще цифры
		jnz	z		;если да - на метку m	
		                	;при выходе из цикла в стеке лежат цифры
					;в CX - их количество
z1:		pop	dx		;извлекаем цифру из стека
		add	dx,'0'		;преобразуем в код символа
		mov	ah,2		;функцией 02 выводим на экран
		int	21h	
		loop	z1		;повторяем CX раз
		mov	dl,10
		int	21h
		mov	dl,13
		int	21h
		pop 	si
		pop 	dx
		pop 	bx
		pop 	ax
		pop 	cx
		ret			;возвращаемся из процедуры
IntOut	endp

AllocMemory	proc	near n:word, matrix:word
			
AllocMemory	endp
		end 
		