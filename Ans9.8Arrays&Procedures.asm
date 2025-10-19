
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

;Q b
IDEAL
MODEL small
Stack 100h
DATASEG
Arr dw 4,3,1,5,2
var dw ?
CODESEG
FirstElementAddress equ [bp + 6]
NumOfElements equ [bp + 4]
SmallIndex equ [bp - 2]

proc SortArray
    push bp
    mov bp,sp 
    call FindMin
    push si
    call Swap
    inc FirstElementAddress
    pop bp
    ret
endp SortArray

proc FindMin
    mov cx,NumOfElements
    mov bx,0ffffh
    mov di,FirstElementAddress
action:    
    mov ax,[di]
    cmp ax,bx
    jg continue
replacer:
    mov bx,ax
    mov si,di
    
continue:
    inc di
    loop action
    ret 
endp FindMin
proc Swap
    xor bx,bx
    mov di,SmallIndex
    mov bx,[di]
    mov di,FirstElementAddress
    mov var,[di]
    xor ax,ax
    mov di,var
    mov [SmallIndex],di
    mov di,[FirstElementAddress]
    mov [di],bx

    ;smallIndex
    ;FirstElementAddress    
    

    
    ret
endp Swap
start:
    mov ax, @data
    mov ds, ax
    xor ax,ax
    xor di,di
    push offset Arr
    push 5
    call SortArray
exit: 
    mov ax, 4c00h
    int 21h
END start
