Contoh Masukan
3
26.5 27.1 27.7
Contoh Keluaran
27.1

extern printf
extern fflush
extern scanf
        
section .data
    fmt db "%f", 0
    fmt2 db "%d", 0
    fmts db "%s", 10, 0
    fmtd db "%d", 10, 0
    fmtf db "%.1f", 10, 0
    sum dq 0.0       
            
section .bss
    n resd 1
    bil resd 1
    result resd 1
       
section .text
    global main
            
main:
    push n
    push fmt2
    call scanf
     
    mov edi, [n]
    fld qword[sum]  ;load sum awalnya 0.0
     
.loop:
    push bil       ;input bilangannya
    push fmt
    call scanf
    add esp, 8
     
    fadd dword[bil]   ;menjumlahkan st0+bil
     
    sub edi, 1         ;decc edi nya
    cmp edi, 0          ;bandingin udah 0 belum 
    jne .loop
 
 
    fidiv dword[n]      ;bagi st0 dengan n
    fst qword[result]   ;hasil result=st0, atau st0 di copy ke variable st0
     
    push dword[result+4]
    push dword[result]
    push fmtf
    call printf
 
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80
