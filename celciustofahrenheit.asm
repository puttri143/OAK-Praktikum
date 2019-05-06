;celcius to fahrenheit
 
global main
extern scanf,fflush, printf
 
section .data
    scn db "%f",0
    prnt db "%.2f", 10,0
    kali dd 1.8
    tambah dd 32.0
     
section .bss
    sf resd 1
    hasil resd 1
 
section .text
    main :
        push sf
        push scn
        call scanf
        add esp, 8
         
        fld dword[sf]
        fld dword[kali]
        fmulp
        fstp qword[hasil]
         
        fld qword[hasil]
        fld dword[tambah]
        faddp
        fstp qword[hasil]
         
        push dword[hasil+4]
        push dword[hasil]
        push prnt
        call printf
         
        push 0
        call fflush
        add esp, 4
         
        exit:
            mov eax,1
            mov ebx,0
            int 0x80
         
