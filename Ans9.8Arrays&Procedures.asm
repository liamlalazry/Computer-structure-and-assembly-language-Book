
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
IDEAL
MODEL small
Stack 100h
DATASEG
Arr dw 4,3,1,5,2
CODESEG
FirstElementAddress equ [bp + 6]
NumOfElements equ [bp + 4]
SmallIndex equ [bp + 4]

proc SortArray
    push bp
    mov bp, sp
    mov cx, NumOfElements     
sortLoop:
    cmp cx, 1                 
    jle doneSorting
    push FirstElementAddress  
    push cx                   
    call FindMin              
    push si                   
    call Swap                 
    add [word ptr bp + 6], 2  
    dec cx                    
    jmp sortLoop
doneSorting:
    pop bp
    ret 4                    
endp SortArray
proc FindMin
    push bp
    mov bp, sp
    mov cx, NumOfElements    
    mov bx, 0ffffh           
    mov di, FirstElementAddress
    mov si, di                
action:    
    mov ax, [di]     
    cmp ax, bx 
    jae continue          
    mov bx, ax        
    mov si, di    
continue:
    add di, 2             
    loop action
    pop bp
    ret 4          
endp FindMin

proc Swap
    push bp
    mov bp, sp
    mov di, SmallIndex        
    mov si, FirstElementAddress  
    mov ax, [di]            
    mov bx, [si]             
    mov [si], ax        
    mov [di], bx             
    pop bp
    ret 2                  
endp Swap
start:
    mov ax, @data
    mov ds, ax
    push offs
