			model	small, c
			.CODE
			public 	AllocMemory


IntOut	proc			;��������� ������ ������ �����
		push 	cx
		push 	ax
		push 	bx
		push 	dx
		push 	si
        	xor	cx,cx		;�������� ������� CX
		mov	bx,10   	;� BX �������� ��������
		cmp	ax,0		;��������� ���� �����
		jge	z		;���� ��������������� - �� z
		neg	ax		;������ ���� �����
		push	ax		;��������� ����� ����� �������
					;�������, ������������ ax
		mov	ah,2		;�������� 02 ������� ���� '-'
		mov	dl,'-'  
		int	21h
		pop	ax		;�������������� ����� � ������� AX
z:		inc	cx		;������� ���������� ������������ ����
		
		xor	dx,dx		;����������� ������� � 32 ��������
		
		div	bx		;�������� ��������� �����
		push	dx		;��������� �� � �����
		or	ax,ax		;��������� ���� �� ��� �����
		jnz	z		;���� �� - �� ����� m	
		                	;��� ������ �� ����� � ����� ����� �����
					;� CX - �� ����������
z1:		pop	dx		;��������� ����� �� �����
		add	dx,'0'		;����������� � ��� �������
		mov	ah,2		;�������� 02 ������� �� �����
		int	21h	
		loop	z1		;��������� CX ���
		mov	dl,10
		int	21h
		mov	dl,13
		int	21h
		pop 	si
		pop 	dx
		pop 	bx
		pop 	ax
		pop 	cx
		ret			;������������ �� ���������
IntOut	endp

AllocMemory	proc	near n:word, matrix:word
			
AllocMemory	endp
		end 
		