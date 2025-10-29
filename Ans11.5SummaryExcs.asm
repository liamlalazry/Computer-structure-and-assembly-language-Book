IDEAL
MODEL small
STACK 100h
DATASEG
MyName db 'Liam',10,13,'$'
MyLastName db 'Lalazry','$'
CODESEG
start:
    mov ax, @data
    mov ds, ax
    lea dx,[MyName]
    mov ah, 9h
    int 21h
    lea dx,[MyLastName]
     mov ah, 9h
    int 21h
exit:
    mov ax, 4C00h
    int 21h
END start
