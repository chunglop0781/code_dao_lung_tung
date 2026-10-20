.model small
.stack 100h
.data
ms1 db 'nhap day ki tu: $'
ms1 db 10, 13, 'day ky tu vua nhap: $'
ms2 db 10, 13, 'day chu hoa: $'
ms3 db 10, 13, 'khong co chu hoa'
ms4 db 10, 13, 'day chu thuong: $'
ms5 db 10, 13, 'khong co chu thuong'
ms6 db 10, 13, 'day so: $'
ms7 db 10, 13, 'khong co so'
s   db 20 dup (?)
s1  db 20 dup (?)
s2  db 20 dup (?)
s3  db 20 dup (?)

.code
    main proc
    
    mov ax, @data
    mov dx, ax
    
    mov ah, 9
    lea dx, ms1
    int 21h
    
    mov ah, 9
    lea dx, ms4
    int 21h
    
    mov ah, 9
    lea dx, ms6
    int 21h
    
    mov ah, 4ch
    int 21h

    main endp
end main

