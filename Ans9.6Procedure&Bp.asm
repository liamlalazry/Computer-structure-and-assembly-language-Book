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

;Q b

IDEAL
MODEL small
Stack 100h
DATASEG
var dw 1
var2 dw 2
max dw 0
CODESEG
maxAddress equ [bp + 8]
varAddr equ [bp + 6]
var2Addr equ [bp + 4]
proc HighestMax
    push bp
    mov bp,sp
    mov ax,varAddr
    mov bx,var2Addr
    cmp ax,bx
    jl var2Bigger
var1Bigger:
    mov di,maxAddress
    mov [di],ax
    jmp ending

var2Bigger:
    mov di,maxAddress
    mov [di],bx
ending:
    pop bp
    ret 
endp HighestMax

start:
    mov ax, @data
    mov ds, ax
    push offset max
    push [var]
    push [var2]     
    call HighestMax
    mov ax,[max]
exit: 
    mov ax, 4c00h
    int 21h
END start

