Q a 

IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
	cmp ax,0
	jg decrease
    jmp exit
decrease:
	dec ax

exit:
	mov ax, 4c00h
	int 21h
END start

Q b
IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
	cmp ax,bx
	jne posting
	jmp exit
  
posting:
  mov ax,bx
	
exit:
	mov ax, 4c00h
	int 21h
END start

Q c
IDEAL
MODEL small
STACK 100h
DATASEG
 var1 dw 7
 var2 dw 3
CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
    mov ax,[var1]
	cmp ax,[var2]
	ja change
    xor ax,ax
	jmp exit
change:
  mov ax,1
exit:
	mov ax, 4c00h
	int 21h
END start

Q d
IDEAL
MODEL small
STACK 100h
DATASEG
 var1 dw 7
 var2 dw 3
CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
    mov ax,[var1]
	cmp ax,[var2]
    jne  substracting
adding:
    add ax,[var2]
	jmp exit
substracting:
    sub ax,[var2]

exit:
	mov ax, 4c00h
	int 21h
END start

Q e part b can also be solved by using unsigned...
IDEAL
MODEL small
STACK 100h
DATASEG
TimesToPrintX db 3

CODESEG

start:
	mov ax, @data
	mov ds, ax
	xor ax, ax
	xor cx,cx
	cmp [TimesToPrintX],0
	jle exit
compare:
	cmp [TimesToPrintX],cl
	jne printer
	jmp exit
printer:
	mov dl, 'x'
	mov ah, 2h
	int 21h
	inc cl
	jmp compare
exit:
	mov ax, 4c00h
	int 21h
END start
