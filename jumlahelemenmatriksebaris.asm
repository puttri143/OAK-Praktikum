global main
extern scanf, fflush, printf
 
section .data
    scn  db "%d", 0
    M    dd 7,11,10,6
         dd 5,8,9,2
         dd 1,3,12,4
    n    dd 4
    prnt db "%d", 10, 0
         
section .bss
    br resd 1
 
section .text
    main :
        push br
        push scn
        call scanf
        add esp, 8
         
        mov eax, [br]
        mul dword [n]
        mov edi, eax
        mov ebx, [M+edi*4]
        mov ecx, 3
         
    jumlah:
        add edi, 1
        mov eax, [M+edi*4]
        add ebx,eax
        loop jumlah
         
        push ebx
        push prnt
        call printf
        add esp, 8
         
        ;exit
        push 0
        call fflush
        add esp, 4
        mov eax, 1
        mov ebx, 0
        int 0x80
         
