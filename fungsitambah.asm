Berikut contoh pemanggilan fungsi tambah tersebut:

; eax = a + b
push dword [a]
push dword [b]
call tambah
Contoh Masukan
3 4
Contoh Keluaran
7

global main
extern scanf, fflush, printf
 
section .data
    scn db '%d %d',10,0
    prnt db '%d',10,0
     
section .bss
    a resd 1
    b resd 1
     
section .text
    main:
        push a
        push b
        push scn
        call scanf
        add esp, 12
         
        mov eax,[a]
        add eax,[b]     
         
         
        push eax
        push prnt
        call printf
        add esp, 8
     
    exit:
        push 0
        call fflush
        add esp, 4
         
        mov eax,1
        mov ebx,0
        int 0x80
