;Q a 
IDEAL
MODEL small
Stack 100h
DATASEG
returnAddress dw 0
CODESEG
proc PrintX
    pop [returnAddress]
    pop cx
    mov bx,cx
printer:
    mov dl, 'X'
    mov ah, 2h
    int 21h
    loop printer
    push bx
    push [returnAddress] 
    
    ret
endp PrintX

start :
    mov ax, @data
    mov ds, ax
    mov ax,3
    push ax
    call PrintX
    pop ax

exit: 
    mov ax, 4c00h
    int 21h
END start
