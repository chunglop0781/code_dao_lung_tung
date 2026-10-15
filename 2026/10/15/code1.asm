.model small
.stack 100h
.data                            
    ms1 db  'nhap so thap phan: $'
    ms2 db  10, 13, 'so nhi phan: $'
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        
        mov ah, 9
        lea dx, ms1
        int 21h
        
        
        mov ah, 1
        int 21h
        sub al, 48
        
        mov bl, al  ; luu trong bl
        
        mov ah, 9
        lea dx, ms2
        int 21h
        
        
        mov ax, 0
        mov cx, 0
        
        mov al, bl
        mov bl, 2
        
chiatiep:
        mov ah, 0
        div bl
        cmp al, 0
        je  kt
        push ax
        inc cl
        jmp chiatiep
        
kt:
        push ax
        inc cl
        
intiep:             
        mov ah, 2
        pop dx
        mov dl, dh
        add dl, 48
        int 21h
        loop intiep
        
        
        mov ah, 4ch
        int 21h
        main endp
        end main