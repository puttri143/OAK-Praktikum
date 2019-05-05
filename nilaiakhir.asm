Buatlah fungsi nilai_akhir() untuk menghitung nilai akhir dari komponen nilai berikut:

UTS (30%)
UAS (30%)
UTSP (10%)
UASP (10%)
projek (10%)
kuis (5%)
tugas (5%)
Parameter fungsi di-passing melalui stack. Keluaran fungsi disimpan pada register eax. Keluaran berupa integer hasil pembulatan dari nilai akhir.

Berikut contoh pemanggilan fungsi nilai_akhir(uts, uas, utsp, uasp, proj, kuis, tugas) tersebut:

; nilai_akhir = (uts*30 + uas*30 + utsp*10 + uasp*10 + proj*10 + kuis*5 + tugas*5) / 100

push dword [tugas]
push dword [kuis]
push dword [proj]
push dword [uasp]
push dword [utsp]
push dword [uas]
push dword [uts]
call nilai_akhir
Contoh Masukan
70 60 100 75 80 88 80
Contoh Keluaran
73

global main
extern scanf, fflush, printf
    
segment .data
    scan db '%d %d %d %d %d %d %d',0
    print db '%d',10,0
    tigapuluh dd 30
    sepuluh dd 10
    lima dd 5
    seratus dd 100
        
segment .bss
    uts resd 4
    uas resd 4
    utsp resd 4
    uasp resd 4
    proj resd 4
    kuis resd 4
    tugas resd 4
        
segment .text
  
nilai:
 
    push ebp
    mov ebp,esp
     
    mov eax,[ebp+8]
    mul dword [tigapuluh]
    mov ebx,eax
     
    mov eax,[ebp+12]
    mul dword [tigapuluh]
    add ebx,eax
     
    mov eax,[ebp+16]
    mul dword [sepuluh]
    add ebx,eax
     
    mov eax,[ebp+20]
    mul dword [sepuluh]
    add ebx,eax
     
    mov eax,[ebp+24]
    mul dword [sepuluh]
    add ebx,eax
     
    mov eax,[ebp+28]
    mul dword [lima]
    add ebx,eax
     
    mov eax,[ebp+32]
    mul dword [lima]
    add ebx,eax
     
    mov eax,ebx
     
    mov edx,0
    mov ebx,dword [seratus]
    div ebx
      
    pop ebp
    ret
    
main:
    push tugas
    push kuis
    push proj
    push uasp
    push utsp
    push uas
    push uts
    push scan
    call scanf
    add esp,32
      
    push dword [tugas]
    push dword [kuis]
    push dword [proj]
    push dword [uasp]
    push dword [utsp]
    push dword [uas]
    push dword [uts]
    call nilai
    add esp,32
      
    CMP edx,50
    JB  cetak
    INC eax
  
 cetak:    
    push eax
    push print
    call printf
    add esp,8
      
    push 0
    call fflush
    add esp,4
        
exit:
    mov eax,1
    mov ebx,0
    int 80H
