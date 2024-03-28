assume cs:codesg

data segment
	db 'welcom to masm!'
data ends
codesg segment
start:
    mov ax,data
	mov ds,ax
	mov ax,0b800h
	mov es,ax

	mov di,0
	mov si,0
	mov cx,16
s1:
	mov al,ds:[di]
	mov es:[si+700],al
	inc si
	mov al,00000010B
	mov es:[si+700],al
	inc si
	inc di
	loop s1

	mov si,0
	mov di,0
	mov cx,16
s2:
	mov al,ds:[di]
	mov es:[si+860],al
	inc si
	mov al,00100100B
	mov es:[si+860],al
	inc si
	inc di
	loop s2

	mov si,0
	mov di,0
	mov cx,16
s3:
	mov al,ds:[di]
	mov es:[si+1020],al
	inc si
	mov al,01110001B
	mov es:[si+1020],al
	inc si
	inc di
	loop s3


	mov ax,4c00h
	int 21h
codesg ends
end start