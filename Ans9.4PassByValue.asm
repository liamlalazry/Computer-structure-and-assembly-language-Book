
IDEAL
MODEL small
Stack 100h
DATASEG
returnAddress dw 0

CODESEG
proc PrintX
    pop [returnAddress]
    pop cx
    push cx
printer:
    mov dl, 'X'
    mov ah, 2h
    int 21h
    loop printer
    push [returnAddress]
    ret
endp PrintX

start :
    mov ax, @data
    mov ds, ax
    xor,dx,dx
    mov ax,3
    cmp ax,0
    jle exit
    push dx
    push ax
    call PrintX
    pop dx
    pop ax
    mov cx,ax 


exit: 
    mov ax, 4c00h
    int 21h
END start
