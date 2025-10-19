
;Q a
IDEAL
MODEL small
Stack 100h
DATASEG
Arr db 2,2,3,4,5
sum db ?
num_elements equ 5
firstNumAddress equ [bp + 4]
numOfElements equ [bp + 6]
CODESEG

proc ArrSum
    push bp
    mov bp,sp
    mov cx,numOfElements
    mov si,firstNumAddress
    mov di,si
  

 adding:
    xor bx,bx
    add bl,[di]
    add al,bl
    inc di
    loop adding 
    pop bp
    ret
endp ArrSum
start:
    mov ax, @data
    mov ds, ax
    xor ax,ax
    push num_elements
    push offset Arr
    call ArrSum
    mov [sum],al
exit: 
    mov ax, 4c00h
    int 21h
END start


;Q b
