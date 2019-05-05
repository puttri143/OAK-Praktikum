Contoh Masukan
satuduatigaempatlimaenamtujuhdelapansembilansepulu
d
Contoh Keluaran
5

extern scanf
extern fflush
extern printf
 
section .data
    scan db "%s %s", 0
    printyes db "%d", 10,0
    printno db "tidak ada", 10,0
 
section .bss
    string resb 51
    char resb 2
 
section .text
    global main
    main :
     
        push char
        push string
        push scan
        call scanf
        add esp, 12
         
        mov ecx, 50
        mov edi, string
        mov al, [char]
        repne scasb
         
        mov eax, 50
        sub eax,ecx
        mov ebx, 0
        cmp ecx, ebx
        je NO
         
        push eax
        push printyes
        call printf
        add esp, 8
        jmp exit
         
    NO :
        push eax
        push printno
        call printf
        add esp, 8
        jmp exit
         
    exit:
        push 0
        call fflush
        add esp, 4
        mov eax, 1
        mov ebx, 0
        int 0x80
