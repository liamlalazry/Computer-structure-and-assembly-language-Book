Q a
IDEAL
MODEL small
STACK 20h
DATASEG

CODESEG

start :
mov ax, @data
mov ds, ax
xor ax,ax
quit :
mov ax, 4c00h
int 21h
END start

IDEAL
MODEL small
STACK 10h
DATASEG

CODESEG

start :
mov ax, @data
mov ds, ax
xor ax,ax
quit :
mov ax, 4c00h
int 21h
END start

Q b
IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start :
mov ax, @data
mov ds, ax
xor ax,ax
mov ax,1234h
push ax

quit :
mov ax, 4c00h
int 21h
END start
;sp points 00fe

Q c
IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start :
mov ax, @data
mov ds, ax
xor ax,ax
mov ax,1234h
push ax
pop ax
;sp returned to be 100h and 1234h didnt erased from memory
quit :
mov ax, 4c00h
int 21h
END start

Q d
IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start :
mov ax, @data
mov ds, ax
xor ax,ax
mov ax,1234h
push ax
pop ax
push 5678h
quit :
mov ax, 4c00h
int 21h
END start
;yes now the value of 1234 erased from fe

Q e
IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start :
mov ax, @data
mov ds, ax
xor ax,ax
mov ax,1234h
push ax
pop bx

quit :
mov ax, 4c00h
int 21h
END start
