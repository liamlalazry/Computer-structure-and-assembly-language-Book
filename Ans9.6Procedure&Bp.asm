;Q a

IDEAL
MODEL small
Stack 100h
DATASEG
var dw 1
var2 dw 2
CODESEG
first equ [bp + 6];1
second equ [bp + 4];2
proc Switcher
    push bp
    mov bp,sp

    mov si,first;1
    mov ax,[si];1
    mov bx,second;2
    mov di,[bx];2
    mov [si],di
    mov [bx],ax
    pop bp
    ret 4

endp Switcher

start:
    mov ax, @data
    mov ds, ax 
    push offset var
    push offset var2
    call Switcher
exit: 
    mov ax, 4c00h
    int 21h
END start

