7.3 a + b
IDEAL
MODEL small
STACK 100h
DATASEG
 var db 122
 var2 db 134
 var3 db 5
 var4 db -5
 ENDS
 
CODESEG
start:
 mov ax, @data
 mov ds,ax
 mov ax,0
 mov al,[var]
 mul [var2]
 mov bx,ax
 mov ax,0
 mov bx,0
 mov al,[var3]
 imul [var4]
  mov bl,al
 
 
exit :
	mov ax, 4c00h
	int 21h
	ENDS
END start


7.3 c
IDEAL
MODEL small
STACK 100h
DATASEG
 arr1 db -5,5,5,5
 arr2 db 1,-2,3,-4
 sum dw 0
 ENDS
 
CODESEG
start:
 mov ax, @data
 mov ds,ax
 mov ax,0
 mov al,[arr1]
 imul [arr2]
 add [sum],ax
 mov al,[arr1 + 1]
 imul [arr2 + 1]
 add [sum],ax
 mov al,[arr1 + 2]
 imul [arr2 + 2]
 add [sum],ax
 mov al,[arr1 + 3]
 imul [arr2+3]  
 add [sum],ax
 mov ax,[sum]
 
exit :
	mov ax, 4c00h
	int 21h
	ENDS
END start

