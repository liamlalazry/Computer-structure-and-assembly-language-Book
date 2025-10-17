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
;Q b


IDEAL
MODEL small
Stack 100h
DATASEG
 returnAddress dw 0
CODESEG

proc PrintAbc
    pop [returnaddress]
    pop bx;3
    pop dx;5
    push bx 
    push dx
    cmp dx,bx
    jb Bprinter
    je Cprinter
    mov dl, 'A'
    mov ah, 2h
    int 21h
    push [returnAddress]
    ret
Bprinter:
    mov dl, 'B'
    mov ah, 2h
    int 21h
    push [returnAddress]
    ret
Cprinter:
    mov dl, 'C'
    mov ah, 2h
    int 21h
    push [returnAddress]
    ret
endp PrintAbc

start :
    mov ax, @data
    mov ds, ax
    xor ax,ax
    mov bx,5
    mov dx,3
    push ax
    push bx
    push dx
    call PrintAbc        
    pop bx
    pop dx
    pop ax
exit: 
    mov ax, 4c00h
    int 21h
END start
;Q c
;not needed here to restore register values

IDEAL
MODEL small
Stack 100h
DATASEG
returnAddress dw 0
min dw 0
max dw 0

CODESEG
proc MinMax
    pop ax;return address
    pop bx;1
    mov cx,3
    mov [max],bx
    mov [min],bx
calc:
    pop dx
    cmp dx, [max]
    jg highestMax
    cmp dx, [min]
    jl lowestMin
returner:
    loop calc
    push ax
    mov bx, [min]
    mov cx, [max]
    ret

highestMax:
    mov [max], dx
    jmp returner

lowestMin:
    mov [min], dx
    jmp returner
endp MinMax

start :
    mov ax, @data
    mov ds, ax
    push 4
    push 3
    push 2
    push 1
    call MinMax
exit: 
    mov ax, 4c00h
    int 21h
END start



