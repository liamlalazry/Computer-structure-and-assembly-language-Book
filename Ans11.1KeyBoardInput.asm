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
