a 
xor return 1 only when the numbers are diffrent from each other when using xor on the same number all digits identical so it cant be differ and the4 result would be always 0 
also if we look at the mathamatical expression of xor add + mod 2 if we add the same number to himself we always get a result the divided in 2 without rest as we just added the same number.

b
still didnt learned assembly loops so witihout loops
IDEAL
MODEL small
STACK 100h
DATASEG
 msg db 'I LIKE ASSEMBLY$'
 k db 01010101b
CODESEG
start:
 mov ax, @data 
 mov ds, ax
 ;I
 mov si, offset msg
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 
 ;space
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;L
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;I
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;K
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;E
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;space
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;A
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;S
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;S 
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;E
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;M
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;B
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;L 
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;Y
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;$
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
  ;DECRYPT
  ;I
 mov si, offset msg
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 
 ;space
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;L
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;I
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;K
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;E
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;space
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;A
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;S
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;S 
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;E
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;M
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;B
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;L 
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;Y
 
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 ;$
 mov al,[si]
 xor al,[k]
 mov [si],al
 inc si
 
 
exit:
	mov ax, 4c00h
	int 21h
END start

with loops:


IDEAL
MODEL small
STACK 100h
DATASEG
    msg db 'I LIKE ASSEMBLY$'
    k db 01010101b
CODESEG
start:
    mov ax, @data
    mov ds, ax

    mov si, offset msg   
    mov cx, 16           

encode_loop:
    mov al, [si]
    xor al, [k]
    mov [si], al
    inc si
    loop encode_loop

    mov si, offset msg
    mov cx, 16

decode_loop:
    mov al, [si]
    xor al, [k]
    mov [si], al
    inc si
    loop decode_loop

exit:
    mov ax, 4c00h
    int 21h
END start


