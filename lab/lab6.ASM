assume cs:codesg,ss:stacksg,ds:datasg
stacksg segment
    dw 0,0,0,0,0,0,0,0
stacksg ends

datasg segment 
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
datasg ends

codesg segment
start: 
    mov ax,stacksg
    mov ss,ax
    mov sp,10h
    mov ax,datasg
    mov ds,ax
    
    mov cx,4
    mov bx,0
    s:
        push cx
        mov cx,4
        mov si,3
        s1:
            mov dl,ds:[bx+si]
            and dl,11011111B
            mov ds:[bx+si],dl
            ; 注意这里是dl不是dx因为是8bit不是16bit
            inc si
        loop s1
        
        add bx,10h
        pop cx
    loop s
	mov ax,4c00h
	int 21h
codesg ends
end start