			model	small	c
			.DATA
			CRLF		db	0dh,0ah,'$'
			msg			db	"good",0dh,0ah."$"
			str			db	255,0,255 dup(?)
			msg_over    db	0dh,0ah,'Overflow!$'
			;msg_err1	db	0dh,0ah,'Entered array size not correct! ( 0 < n < 21)$'
			msg_err2	db	0dh,0ah,'Input is not correct, only numbers!$'
			negflag		dw	?

			.CODE
			public	FillMatrix
			
IntIn	proc						;Процедура ввода целого числа
			mov	ah,0ah				;Функцией 0аh вводим строку символов и размещаем в
									;области str
			lea	dx,str
			int	21h
		
			xor	ax,ax				;обнуляем ax, в котором будем формировать число
			lea	si,str+2			;Устанавливаем si на первый символ введенной строки
			mov	negflag,ax			;обнуляем флаг отрицательности числа
									;Предпологаем, что оно юудет не отрицательным
			cmp	byte ptr [si],'-'	;Первый символ - это не минус?
			jne	m2					;Если нет - на m2
			not	negflag				;Отмечаем что число отриццательное(negflag != 0)
			inc	si					;Продвигаем si к первой цифре
			jmp	m					;Прыгаем на разбор строки цифр
m2:			cmp	byte ptr [si],'+'	;Первый символ - это плюс?
			jne	m					;Если нет - на m
			inc	si					;Сдвигаем si к первой цифре
m:			cmp	byte ptr [si], cr	;Если это cr - строка закончилась, выходим
			je	ex1
			cmp	byte ptr [si], '0'	;Если код символа меньше кода '0'- это
									; не цифра
			jb	err					;Прыгаем на метку err
			cmp	byte ptr [si], '9'	;Если код символа больше кода '9'это
									;не цифра
			ja	err
			mov	bx,10				;Домножаем полученное число на основание
									;системы счисления
			mul	bx
			jo	m3
			sub	byte ptr [si], '0'	;Вычитаем код символа '0'
			add	al,[si]				;Добавляем цифру к числу
			jo	m3
			adc	ah,0
			inc	si					;продвигаемся к следующему символу
			jmp	m					;организуем цикл
					
err:		lea	dx,msg_err2       	;функцией 09 выводим сообщение об ошибке
			mov	ah,9
			int	21h
							;Повторяем ввод
		
		
m3:     	push	ax
			mov		ah, 9
			lea		dx, CRLF
			int		21h
			pop		ax
			lea	dx,msg_over
			mov	ah,9
			int	21h
		
			mov	ah,4ch
			int	21h
        	           
ex1:		cmp	negflag,0			;число положительное?
			je	ex2					;Если да - переходим на ex2
			neg	ax					;Меняем знак числа


ex2:        cmp	ax,32768
			jae	m3

		
ex:		ret	
IntIn	endp

		
FillMatrix	proc	near n:word, matrix:word
			
			mov		cx,n
			xor		bx,bx
			mov 	ax,cx		;На сколько смещаться во внешнем цикле
			sal		ax,2
			add		ax,2
			push 	ax
			mov		ah, 9
			lea		dx, CRLF
			int		21h
			pop		ax
fill1:		push	ax
			mov		ah, 9
			lea		dx, CRLF
			int		21h
			pop		ax
			push	cx
			mov		cx,n
			xor		si,si
fill:		push 	ax
			mov		ah, 9
			lea		dx, CRLF
			int		21h
			push	si
			push	cx
			push	bx
			call	IntIn
			pop		bx
			pop		cx
			pop		si
			mov		matrix[bx+si],ax
			pop		ax
			add		si,2
			loop	fill
			add		bx,ax
			pop		cx
			loop	fill1

FillMatrix	endp
			end