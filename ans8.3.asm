Q a the writer not refering ax = 0 and still meantion signed number so i anser as a sign version when ax =0 decresing one...

IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
	cmp ax,0
	jl decrease
  
decrease:
	dec ax

exit:
	mov ax, 4c00h
	int 21h
END start

Q b
IDEAL
MODEL small
STACK 100h
DATASEG

CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
	cmp ax,bx
	je posting
  
posting:
  mov ax,bx
	
exit:
	mov ax, 4c00h
	int 21h
END start

Q c
IDEAL
MODEL small
STACK 100h
DATASEG
 var1 db 7
 var2 db 3
CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
  mov ax,[var1]
	cmp ax,[var2]
	jbe change
  ja zero:
change:
  mov ax,1
zero:
  xor ax,ax

exit:
	mov ax, 4c00h
	int 21h
END start

Q d
IDEAL
MODEL small
STACK 100h
DATASEG
 var1 db 7
 var2 db 3
CODESEG

start:

	mov ax, @data
	mov ds, ax
	xor ax, ax
    mov ax,[var1]
	cmp ax,[var2]
	jne adding:
    je  substracting:
adding:
    add ax,[var2]
substracting:
    sub ax,[var2]

exit:
	mov ax, 4c00h
	int 21h
END start

Q e
IDEAL
MODEL small
STACK 100h
DATASEG
TimesToPrintX db 3

CODESEG

start:
;Q a
	mov ax, @data
	mov ds, ax
	xor ax, ax
	xor cx,cx
	cmp [TimesToPrintX],cx
	jne 
printer:
	mov dl, 'x'
	mov ah, 2h
	int 21h
	inc cx
exit:
	mov ax, 4c00h
	int 21h
END start


