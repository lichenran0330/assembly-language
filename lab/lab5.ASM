;<5>
assume cs:code

aa segment
	db 1,2,3,4,5,6,7,8
aa ends

bb segment
	db 1,2,3,4,5,6,7,8
bb ends


cc segment 
	db 0,0,0,0,0,0,0,0
cc ends

code segment
start: 
	mov ax,aa
	mov bx,bb
	mov ds,bx
	mov cx,cc
	mov ss,cx
	mov sp,10h
	mov bx,0eh
	mov es,ax
	mov cx,8
s:
	mov dx,0
	add dx,es:[bx]
	add dx,ds:[bx]
	sub bx,2
	push dx
	loop s

	mov ax,4c00h
	int 21h
code ends
end start