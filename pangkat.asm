Contoh Masukan
3 3
4 4
6 2
0
Contoh Keluaran
27
256
36

global main
extern scanf, fflush, printf
       
section .data
    msg db "%d", 0
    print db "%d", 10, 0
       
section .bss
    a resd 1
    b resd 1
      
section .text
    global main
           
    main:
 
        coba:
            push a
            push msg
            call scanf
            add esp, 8
             
            mov eax, [a]
            cmp eax, 0
            je exit
             
             
            mov eax, [a]
            mov ebx, [a]
            push b
            push msg
            call scanf
            add esp, 8
            mov ecx, [b]
             
        kuadrat: 
            cmp ecx, 0
            JA isi
            JBE cetak
          
        isi:
            mul ebx
            dec ecx
            JMP kuadrat
             
        cetak:       
            push eax
            push print
            call printf
            add esp, 8
            jmp coba
         
    exit:           
    push 0
    call fflush
    add esp, 4
    mov eax, 1
    mov ebx, 0
    int 0x80
