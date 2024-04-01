assume cs:codesg

data segment
	db 'welcom to masm!',0
data ends
codesg segment
start:
    mov dh,8
    mov dl,3
    mov cl,2
    mov ax,data
    mov ds,ax
    mov si,0
    call show_str
    mov ax,4c00h
    int 21h
show_str:
        mov ax,0b800h
        mov es,ax
        mov al,dh
        mul dl
        mov bx,ax
        mov si,0
        mov di,0
        mov cx,0
    f:
        mov al,ds:[di]
        mov es:[bx+si],al
        inc di
        inc si
        mov al,00000010B
        mov es:[bx+si],al
        inc si
        mov cl,ds:[di]
        jcxz ok
        loop f
        ok:
        ret

	
codesg ends
end start