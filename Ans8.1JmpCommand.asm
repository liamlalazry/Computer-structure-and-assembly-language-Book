IDEAL
MODEL small
STACK 100h
DATASEG
address dw 000Eh
CODESEG

start:
 mov ax, @data
 mov ds, ax
 xor ax, ax
 jmp [address]
 add ax, 5 
 add ax, 4
exit:
	mov ax, 4c00h
	int 21h
END start


