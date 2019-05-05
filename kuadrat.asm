Contoh Masukan
3
4
6
0
Contoh Keluaran
9
16
36


global main
extern scanf, printf, fflush
 
section .data
    fmt_out     db      '%d', 10, 0
    fmt_in      db      '%d', 0
 
section .bss
    a resd 4
     
section .text
    global main
 
    pow:
                push    ebp                     ; save old ebp
                mov     ebp, esp                ; this new ebp (as reference to parameter and local variable)
                 
                mov     eax, [ebp+8]            ; eax = a
                mul     dword [ebp+8]           ; eax = eax * a
                 
                push    eax                     ; printf("%d\n", eax)
                push    fmt_out
                call    printf
                add     esp, 8
                 
                mov     esp, ebp                ; deallocate local variables
                pop     ebp                     ; restore old ebp
                ret
 
    main:
                push    a
                push    fmt_in                 
                call    scanf
                add     esp, 8
                 
                mov     esi, [a]    ;check apakah 0 ?
                cmp     esi, 0
                je      exit
                 
                 
                 
                push    dword[a]
                call    pow                   
                add     esp, 4
                 
                jmp main
exit:
                push 0
                call fflush
                mov eax, 1
                mov ebx, 0
                int 0x80
