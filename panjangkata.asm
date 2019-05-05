Contoh Masukan
ilkom
Contoh Keluaran
5

extern scanf
extern printf
extern fflush
  
section .data
    scan db "%s", 0
    print db "%d", 10, 0
      
section .bss
    string1 resd 21
      
section .text
    global main
      
main:
        push string1
        push scan
        call scanf
        add esp, 8
          
        mov ecx, 20
        mov edi, string1
        mov al, ""
        repne scasb
          
        mov eax, 19
        sub eax, ecx
          
        push eax
        push print
        call printf
        add esp, 8
          
      exit:
        push 0
        call fflush
        add esp, 4
        mov eax, 1
        mov ebx, 0
        int 0x80
