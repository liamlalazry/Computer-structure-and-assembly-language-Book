;Q a
IDEAL
MODEL small
Stack 100h
DATASEG
CODESEG
proc inputKeyBoard
    mov ah, 8
    int 21h
    mov bl,al
    mov ah, 8
    int 21h
    mov dl,al
    cmp bl,dl
    jb BisBigger
    mov dl,bl
    mov ah, 2
    int 21h
    ret
BisBigger:
    mov ah, 2
    int 21h
    ret 
endp inputKeyBoard
start:
    mov ax, @data
    mov ds, ax
    call inputKeyBoard
exit: 
    mov ax, 4c00h
    int 21h
END start
;Q b
IDEAL
MODEL small
Stack 100h
DATASEG
CODESEG
proc inputKeyBoard
    mov ah, 1
    int 21h
    cmp al,47
    ja AnotherCheck
    ret
AnotherCheck:
    cmp al,58
    jb printer  
    ret


printer:
    mov dl, 'V' 
    mov ah, 2
    int 21h

endp inputKeyBoard
start:
    mov ax, @data
    mov ds, ax
    call inputKeyBoard
exit: 
    mov ax, 4c00h
    int 21h
END start
;Q c
IDEAL
MODEL small
Stack 100h
DATASEG
CODESEG
proc inputKeyBoardChecker
    mov cx,10
input:
    mov ah, 1
    int 21h
Checker:
    cmp al,47
    ja AnotherCheck
    ret
AnotherCheck:
     cmp al,58
     jb adding
     ret
adding: 
    sub al,30h
    add dl,al
    loop input
    mov ah, 2
    int 21h
    ret
endp inputKeyBoardChecker
start:
    mov ax, @data
    mov ds, ax
    xor dl,dl
    call inputKeyBoardChecker
exit: 
    mov ax, 4c00h
    int 21h
END start
;Q d
IDEAL
MODEL small
Stack 100h
DATASEG
var1 db ?
var2 db ?
CODESEG  
start:
    mov ax, @data
    mov ds, ax
    xor ax,ax
    xor dx,dx
    mov cx,4
    mov bx,10
calc:
    mul bx
    mov [var1],al
    mov [var2],ah
    mov ah, 1
    int 21h
    sub al,30h
    mov dl,al
    mov al,[var1]
    mov ah,[var2]
    add ax,dx
    loop calc
exit: 
    mov ax, 4c00h
    int 21h
END start
