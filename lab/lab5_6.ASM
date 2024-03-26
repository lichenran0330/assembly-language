assume cs:code
aa segment
    dw 1,2,3,4,5,6,7,8,9,0ah,0bh,0ch,0dh,0eh,0fh,0ffh
aa ends

bb segment 
    dw 0,0,0,0,0,0,0,0
bb ends

code segment
start: 
    
	mov ax,4c00h
	int 21h
code ends
end start