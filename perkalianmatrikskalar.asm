global main
extern scanf, printf, fflush
 
segment .data
    array      dd 7, 11, 10, 6
               dd 5, 8, 9, 12
               dd 11, 13, 12, 15
    scn        db '%d',0
    printbiasa db '%d ',0
    printakhir db '%d',10,0
     
segment .bss
    n resd 1
 
segment .text
    main:
        push n
        push scn
        call scanf
        add esp,8
 
        mov edi,0
 
    cek:
        CMP edi,44
        JA exit
 
    kali:
        mov eax,[array+edi]
        mul dword[n]
     
        CMP edi,12
        JE newline
        CMP edi,28
        JE newline
        CMP edi,44
        JE newline
 
        push eax
        push printbiasa
        call printf
        add esp,8
 
        push 0
        call fflush
        add esp,4
 
        add edi,4
        JMP cek
     
    newline:
        push eax
        push printakhir
        call printf
        add esp,8
 
        push 0
        call fflush
        add esp,4
     
        add edi,4
        JMP cek
     
    exit:
        mov eax,1
        mov ebx,0
        int 80H
