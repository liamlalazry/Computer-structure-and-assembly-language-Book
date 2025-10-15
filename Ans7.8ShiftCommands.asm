IDEAL
MODEL small
STACK 100h

DATASEG

CODESEG
;Q a
start:
;assuming the writer meant us to beggin with 1
 mov ax, @data 
 mov ds, ax
 xor ax,ax
 mov al,1
 shl al,1
 or al,1
 shl al,2
 
 ;Q b 
 ;noticed writer asked to just mov al,120
 mov al,00000001
 add al,14 
 shl al,3
 shr al,3
 
 ;Q c
 mov al,10
 shl al,4
 mov bl,al
 mov al,10
 shl al,2
 add al,bl
 
 
exit:
	mov ax, 4c00h
	int 21h
END start


