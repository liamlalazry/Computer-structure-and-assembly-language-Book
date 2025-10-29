IDEAL
MODEL small
STACK 100h
DATASEG
message db 13 dup (?)
CODESEG
start:
    mov ax, @data
    mov ds, ax
    mov dx, offset message
    mov bx, dx
    mov [byte ptr bx], 11
    mov ah, 0Ah
    int 21h
    mov cl, [bx + 1]
    inc bx 
    inc bx
SizeIncreaser:
    sub [byte ptr bx],32d
    inc bx
    loop SizeIncreaser
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    mov dx,offset message
    inc dx
    inc dx
    mov bx,dx
    mov [byte ptr bx + 10],'$'
    mov ah, 9h
    int 21h
exit:
mov ax, 4C00h
int 21h
END start
