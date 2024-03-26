assume cs:code
aa segment
    dw 1,2,3,4,5,6,7,8,9,0ah,0bh,0ch,0dh,0eh,0fh,0ffh
aa ends

bb segment 
    dw 0,0,0,0,0,0,0,0
bb ends

code segment
start: 
    
    mov ax,aa
    mov ds,ax
    mov ax,bb
    mov ss,ax
    mov sp,10h
    mov cx,8
    mov bx,0
s:
    mov ax,ds:[bx]
    add bx,2
    push ax
    loop s

	mov ax,4c00h
	int 21h
code ends
end start