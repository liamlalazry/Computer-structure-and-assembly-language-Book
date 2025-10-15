;Q a Fibonacchi


IDEAL
MODEL small
STACK 100h
DATASEG
fibo db 10 dup (0)
CODESEG

start:
	mov ax, @data
	mov ds, ax
	xor ax, ax
	mov cx,8
	mov si,offset fibo
	inc si
	mov bx,1
	mov [si],bx
    
adding:
   inc si
   mov dx,bx 
   add bx,ax
   mov ax,dx
   mov [si],bl
   loop adding
exit:
	mov ax, 4c00h
	int 21h
END start

;Q b +c

IDEAL
MODEL small
STACK 100h
DATASEG
arr db 5 dup (0)
CODESEG

start:
	mov ax, @data
	mov ds, ax
	xor ax, ax
	mov cx,5
	mov bx,offset arr
inputing:
	mov ah,1h
	int 21h
	mov [bx],al
	inc bx
	loop inputing

exit:
	mov ax, 4c00h
	int 21h
END start

;Q d

IDEAL
MODEL small
STACK 100h
DATASEG
var1 dw 4h
var2 dw 5h

CODESEG

start:
	mov ax, @data
	mov ds, ax
	xor ax, ax
	mov cx,var2
multi:
	add ax,var1
	loop multi
exit:
	mov ax, 4c00h
	int 21h
END start

Q e
