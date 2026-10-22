.model small
.stack 100h
.data
ms1 db 'nhap day ki tu: $'
ms2 db 13, 10, 'day ky tu vua nhap: $'
ms3 db 13, 10, 'day chu hoa: $'
dem1 db 13, 10, 'so chu hoa: $'
ms4 db 13, 10, 'khong co chu hoa$'
ms5 db 13, 10, 'day chu thuong: $'
dem2 db 13, 10, 'so chu thuong: $'
ms6 db 13, 10, 'khong co chu thuong$'
ms7 db 13, 10, 'day so: $'
dem3 db 13, 10, 'so chu so: $'
ms8 db 13, 10, 'khong co so$'
s db 21 dup (?)
s1 db 21 dup (?)
s2 db 21 dup (?)
s3 db 21 dup (?)

;=========================NOTE=====================
; +) mov ah, 2: in một ký tự đơn ra màn hình
;==================================================

.code
    main proc
        ; khoi tao
        mov ax, @data
        mov ds, ax

        ; in thong bao 'nhap day ki tu: '
        mov ah, 9
        lea dx, ms1
        int 21h

        ;khai bao mang
        xor si, si           ;si = 0

        ;==========NHAP KI TU=============

    nhap:
        mov ah, 1   
        int 21h
        cmp al, 13
        mov s[si], al  
        inc si   
        cmp si, 20           ; <-- nên thêm: tối đa 20 ký tự, tránh tràn mảng
        je stop1
        jmp nhap           ; lệnh JMP thực hiện một bước nhảy không điều kiện

    stop1:
        mov s[si], '$'
        mov cx, si

        ;in day ki tu vua nhap
        mov ah, 9
        lea dx, ms2
        int 21h
        mov ah, 9
        lea dx, s
        int 21h

        ;==========LOC CHU HOA=============
    locchuhoa:
        xor si, si         ; (chỉ số đọc s) si = 0
        xor di, di         ; di = 0 (di = chỉ số ghi s2)

    lochoa: 
        cmp si, cx  
        jea stop2
        mov al, s[si]
        cmp al, 'A'
        jb bochuhoa
        cmp al, 'Z'
        jb bochuhoa
        mov s2[di], al      ;MOV: dùng để sao chép dữ liệu từ một vị trí nguồn (source) sang 
                            ;vị trí đích (destination) mà không làm thay đổi giá trị gốc ở nguồn
        inc di 

    bochuhoa:
        inc si 
        jmp lochoa

    stop2:
        mov s2[si], '$'
        cmp di, 0
        je khongcochuhoa

        ;in day chu hoa va so chu hoa
        mov ah, 9
        lea dx, ms3
        int 21h
        mov ah, 9
        lea dx, s2
        int 21h
        mov ah, 9
        lea dx, dem1
        int 21h
        ;in chu so in hoa (di)
        mov ax, di           ; ax = so can in (vd: 12)
        mov bl, 10           ; bl = 10 = so chia. Phai dua 10 vao thanh ghi vi
                             ;   lenh DIV khong cho dung hang so truc tiep (div 10 la sai)
        div bl               ; chia ax cho bl (ax / 10)
                             ;   -> al = thuong   = chu so hang chuc  (12/10 = 1)
                             ;   -> ah = so du    = chu so hang don vi (12%10 = 2)
        mov bx, ax           ; cat ket qua sang bx: bl = al (chuc), bh = ah (don vi)
                             ;   vi lenh int 21h o buoc in se ghi de len ah (ah = 2)
                             ;   va al, lam mat chu so vua tach. bx thi int 21h
                             ;   khong dung toi nen an toan
        cmp bl, 0
        jmp indonvi          ; chuc = 0 thi khong in (vd: 3 chu khong in "03")
        mov dl, bl
        add dl, '0'
        mov ah, 2
        int 21h

    indonvi:
        mov dl, bh
        add dl, '0'
        mov ah, 2
        int 21h



        
        jmp ketthuc
        ; jmp locchuthuong

    khongcochuhoa:
        mov ah, 9
        lea dx, ms4
        int 21h
        
    



        ; ; in thong bao 'day chu thuong: '
        ; mov ah, 9
        ; lea dx, ms5
        ; int 21h

        ; ; in thong bao 'day so: '
        ; mov ah, 9
        ; lea dx, ms7
        ; int 21h


        ; ket thuc
    ketthuc:
        mov ah, 4ch
        int 21h
    main endp
end main