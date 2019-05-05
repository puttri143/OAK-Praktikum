Contoh Masukan
5.0
Contoh Keluaran
15.707963

global main
extern scanf, fflush, printf
 
section .data
    scan db '%f',0
    print db '%f',10,0
     
section .bss
    a resd 4
    hasil resd 1
 
section .data
    main:
        push a
        push scan
        call scanf
        add esp, 8
         
        fldpi
        fmul dword [a]
        fstp qword [hasil]
         
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
