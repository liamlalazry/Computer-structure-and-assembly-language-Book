;Q a
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
    mov al,65d
    mov dl,al 
    mov ah, 2
    int 21h
exit: 
    mov ax, 4c00h
    int 21h
END start
;Q b
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
    mov al,97d
    mov dl,al 
    mov ah, 2
    int 21h
exit: 
    mov ax, 4c00h
    int 21h
END start
;Q c
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
    mov dl,'H'
    mov ah, 2
    int 21h
    mov dl,'E'
    mov ah, 2
    int 21h
    mov dl,'L'
    mov ah, 2
    int 21h
    mov dl,'L'
    mov ah, 2
    int 21h
    mov dl,'O'
    mov ah, 2
    int 21h
exit: 
    mov ax, 4c00h
    int 21h
END start
;Q d
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
