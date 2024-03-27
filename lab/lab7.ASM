assume cs:codesg

data segment
    ;年份
    db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'
    db '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'
    db '1993', '1994', '1995'
    ;收入
    dd 16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
    dd 345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000
    ;员工
    dw 3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226
    dw 11542, 14430, 15257, 17800
data ends

table segment
    db 21 dup ('year sumn ne ?? ')
table ends

codesg segment
start:
    mov ax,data
    mov ds,ax

    mov ax,table
    mov es,ax

    mov si,0
    mov cx,21
    mov di,0
year:
    ; mov es:[si+0],ds:[di+0]
    mov ax,ds:[di]
    mov es:[si],ax
    ; mov es:[si+2],ds:[di+2]
    mov ax,ds:[di+2]
    mov es:[si+2],ax
    add si,10h
    add di,4
    loop year
    
    mov si,5
    mov cx,21 
    mov di,0
sumn:
    ; mov es:[si+84],ds:[di+0]
    mov ax,ds:[di+84]
    mov es:[si],ax
    ; mov es:[si+86],ds:[di+2]
    mov ax,ds:[di+86]
    mov es:[si+2],ax

    add si,10h
    add di,4
    loop sumn

    mov si,0ah
    mov cx,21
    mov di,0
nee:
;
    ; mov es:[si+164],ds:[di+0]
    mov ax,ds:[di+168]
    mov es:[si],ax
    add si,10h
    add di,2
    loop nee

    mov ax,1000
    mov ss,ax
    mov bx,5
    mov cx,21
abc:

    push cx
    mov dx,es:[bx+2]
    mov ax,es:[bx+0]
    mov cx,es:[bx+5]
    div word ptr cx
    pop cx
    mov es:[bx+8],ax
    add bx,10h
    loop abc

	mov ax,4c00h
	int 21h
codesg ends
end start