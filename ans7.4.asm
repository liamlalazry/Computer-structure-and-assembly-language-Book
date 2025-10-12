7.4a + b + c
IDEAL
MODEL small
STACK 100h
DATASEG
var1 db 7
var2 db 2
res db ?
rem db ?
vars db -6
vars2 db -2
var3 dw 8
var4 dw 2

ENDS

CODESEG

start :
mov ax, @data
mov ds, ax
mov al,var1
mov ah,0
div var2
mov res,al
mov rem,ah
mov al,vars
mov ah,0
idiv vars2
mov res,al
mov rem,ah
mov dx,0
mov ax,var3
div var4
mov rem,dx
mov res,ax



quit :
mov ax, 4c00h
int 21h
END start
