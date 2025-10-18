;Q a
IDEAL
MODEL small
Stack 100h
DATASEG
Arr db 2,2,3,4,5
sum db ?
CODESEG
num_elements equ 5
firstNumAddress equ [bp + 4]
numOfElements equ [bp + 6]
proc ArrSum
    push bp
    mov bp,sp
    mov cx,numOfElements
    mov si,firstNumAddress
    mov di,[si]
    xor bx,bx

 adding:
    add bx,[di]
    inc di
    loop adding 
    pop bp
    ret
endp ArrSum
start:
    mov ax, @data
    mov ds, ax
    push num_elements
    push offset Arr
    call ArrSum
    mov [sum],bl
exit: 
    mov ax, 4c00h
    int 21h
END start
