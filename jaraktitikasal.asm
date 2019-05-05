Contoh Masukan
3.0 4.0
Contoh Keluaran
5.000000

global main
extern scanf, fflush, printf
 
section .data
    scan db "%f %f",0
    print db "%f",10,0
     
section .bss
    a resd 1
    b resd 1
    hasil resd 1
    hasil1 resd 1
    hasil2 resd 1
 
section .text
    main:
        push a
        push b
        push scan
        call scanf
        add esp, 12
         
        fld dword [a]
        fmul dword [a]
        fstp dword[hasil1]
         
        fld dword [b]
        fmul dword [b]
        fstp dword [hasil2]
         
        fld dword [hasil1]
        fld dword [hasil2]
        faddp
         
        fsqrt
        fstp qword[hasil]       
         
 
        push dword [hasil+4] ; formatnya, print bagian belakang koma
        push dword [hasil] ; lalu print bagian depan koma
        push print
        call printf
        add esp, 12
 
 
exit:
    push 0
    call fflush
    add esp, 4
     
    mov eax,1
    mov ebx,0
    int 0x80
