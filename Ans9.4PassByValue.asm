
IDEAL
MODEL small
Stack 100h
DATASEG
returnAddress dw 0

CODESEG
proc PrintX
    pop [returnAddress]
    pop cx
    ;mov [holdax],cx
    ;mov bx,cx
    push cx
printer:
    mov dl, 'X'
    mov ah, 2h
    int 21h
    loop printer
    ;push bx 
    ;push [holdax]
    push [returnAddress]
    ret
endp PrintX

start :
    mov ax, @data
    mov ds, ax
    mov ax,3
    cmp ax,0
    jle exit
    push ax
    call PrintX
    pop ax
    mov cx,ax 


exit: 
    mov ax, 4c00h
    int 21h
END start
