IDEAL
MODEL small
STACK 100h
DATASEG
CODESEG
start:
    mov ax, @data
    mov ds, ax
    mov ah, 1
    int 21h
    mov bl,al
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl,bl
    mov cx,10
print:
    mov ah, 2
    int 21h 
    loop print
exit:
    mov ax, 4C00h
    int 21h
END start
