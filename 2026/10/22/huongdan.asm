.model small
.stack 100h
.data
    ms1 db  'nhap so thu nhat: $'          ;thong bao nhap so thu nhat

    ;mov ah, 2 => "nhap so thu nhat: "

    ;mov ah, 1

    ms2 db  10, 13, 'nhap so thu hai: $'   ;10, 13: xuong dong + ve dau dong

    ;10: xuong dong
    ;13: lui dau dong

    ms3 db  10, 13, 'tong hai so: $'       ;thong bao hien thi ket qua

    ;mov ah, 2 => "tong hai so: "

    ;mov ah, 9

.code
main proc
    ;khoi tao doan du lieu
    mov ax, @data
    mov ds, ax

    ;in thong bao nhap so thu nhat
    mov ah, 9           ;ham 9: hien thi chuoi ket thuc bang $
    lea dx, ms1
    int 21h

    ;nhap so thu nhat
    mov ah, 1           ;ham 1: doc 1 ky tu tu ban phim, luu vao al
    int 21h
    sub al, 48
    mov bl, al              ;bl = so thu nhat

    ;in thong bao nhap so thu hai
    mov ah, 9           ;ham 9: hien thi chuoi ket thuc bang $
    lea dx, ms2
    int 21h

    ;nhap so thu hai
    mov ah, 1           ;ham 1: doc 1 ky tu tu ban phim, luu vao al
    int 21h
    sub al, 48

    ;tinh tong
    add al, bl
    mov bl, al

    ;in thong bao
    mov ah, 9           ;ham 9: hien thi chuoi ket thuc bang $
    lea dx, ms3
    int 21h

    ;in 1 chu so
    mov dl, bl
    add dl, 48
    mov ah, 2
    int 21h


    ;ket thuc chuong trinh
    mov ah, 4ch         ;ham 4ch: thoat ve he dieu hanh
    int 21h

main endp                   ;them: dong proc
end main
