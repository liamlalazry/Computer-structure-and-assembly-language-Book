;Q a + b
IDEAL
MODEL small
STACK 100h
DATASEG
	msg db 'enter a digit', 10, 13, '$'
    Errmsg db 'Wrong input','$'
CODESEG
start:
    mov ax, @data
    mov ds, ax
	mov dx, offset msg
	mov ah, 9h
	int 21h
	mov ah, 1
	int 21h
    mov bl,al
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h 
    cmp bl,47d
    ja secondCheck
errPrinter:
    mov dx, offset Errmsg
    mov ah, 9h
	int 21h
    jmp exit
secondCheck:
    cmp bl,58d
    jl exit
    jmp errPrinter
exit:
    mov ax, 4C00h
    int 21h
END start
;Q a + b
IDEAL
MODEL small
STACK 100h
DATASEG
 msg db 'The only true defeat is when u decided not to try again!!!',10,13,'$'
 myName db 'Liam','$'
CODESEG
start:
    mov ax, @data
    mov ds, ax
    lea dx,[msg] 
    mov ah, 9h
    int 21h
    lea dx,[MyName]
    mov ah, 9h
    int 21h
exit:
    mov ax, 4C00h
    int 21h
END start
