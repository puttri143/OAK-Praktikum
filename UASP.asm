baca sampai akhir.. dan lihat kejutannya :v 

yak bismillahirrahmanirrahim wow

Assalamualaikum warahmatullahi wabarakatuh

kembali lagi di iseng orkom jilid 2 yeee wkwkwkwk

mungkin kalo mau review materi uts bisa bit.ly/isengorkom atau langsung klik link ini

Jika ada kesalahan silahkan ditambahkan atau dikurangkan
karena sesungguhnya..

yak kita mulai..


Procedure
“Gunakan prosedur sehingga program anda menjadi modular.”

Biasanya disoal soal awal OAK praktikum yang sesi uas ada kata kata beginian..
ini disoal 13,14,15
Jadi kita harus membuat semacam fungsi yang dipanggil(call) di main dan akan di kembalikan (return) ke main.. 
Mirip jmp tapi ini bisa balik lagi :v (masa?)
Gaboleh langsung proses dimainnya..

misal disoal kuadrat,
inputannya -> proses 	    -> 	hasil
3		 3*3		9
4		 4*4		16
0		[ program berhenti ]

biasa kode asm nya akan seperti ini.. 

main:	
	push ilkomerz
	push fmtScan
	call scanf
	add esp, 8

	mov eax, [ilkomerz]
	mul eax

	push eax
	push fmtPrint
	call printf
	add esp, 8





nah, karena disuruhnya pake prosedur biar programnya jadi modular
maka programnya kita ubah menjadi gini..


;atas format biasa extern, section section ~
main:	
	push ilkomerz
	push fmtScan
	call scanf
	add esp, 8

	mov eax, [ilkomerz]
	call kuadrat		;panggil fungsi kuadrat

	push eax
	push fmtPrint
	call printf
	add esp, 8

kuadrat:		
	mul eax	; eax = eax*eax
	ret		; balik lagi ke main
	
exit:
	;~~




Procedure (stack)
“Buatlah Fungsi”

soal 16,17 bikin praktikan terkejut, lihat selengkapnya
nah ini agak sedikit beda dengan sebelumnya..
ini lebih mirip pas kita pakai scanf, printf
tau penggunaan “stack”(tumpukkan), nah ini pake metode stack
stack itu seperti tumpukkan, dan membaca tumpukkan itu kebalik


Ini contoh prosedur yang sesuai dengan format yg pak auriza pengen fyi,
Tapi lx tetep bisa accepted cara yg mana aja asal outputnya bener :v
 
contoh soal pertambahan 

main:
push b		; masukan b ke stack (tumpukkan 1)
    	push a		; masukan a ke stack (tumpukkan 2)
    	push fmtScan	; masukan fmtScan ke stack (tumpukkan 3)
    	call scanf	; dipanggil fungsi scanf, membaca tumpukan itu dibalik jadi kita bacanya yg terakhir sampe yang pertama -> fmtScan, a, b -> “%d %d” a b
    	add esp, 12
 
    	push dword [a]	; masukan a ke stack (tumpukkan 1)
    	push dword [b]	; masukan b ke stack (tumpukkan 2)
    	call tambah		; panggil fungsi tambah
     
    	push eax
   	push fmtPrint
    	call printf
    	add esp, 8
     
    jmp exit

tambah:			; fungsi tambah
    push ebp			; masukan ebp ke stack (tumpukan 3) 
(di tumpukkan ada a, b, ebp)
    mov ebp, esp		; ebp = esp ,, oiya esp itu penunjuk tumpukkan yang terakhir
    mov eax, [ebp+3*4]	; eax = a ,, tumpukkan yang ke 3 dari terakhir,, 
	ebp -> penujuk, 3 -> 3 tumpukkan dari terakhir, 4 - > setiap tumpukkan bernilai 4
	maka jadinya [ebp+3*4] 
    add eax, [ebp+2*4]		; eax = eax + b ,, -> eax = a + b
	[ebp+2*4] - > tumpukkan yang ke 2 dari terakhir
    pop ebp			; keluarkan tumpukkan ebp 
	(di tumpukkan tinggal ada a, b ) ,, ebpnya udah di keluarin ,, ada 2 doang di tumpukkan
    ret 2*4		; karena ada 2 tumpukkan maka ret 2*4
	-> 2 karena ada 2 tumpukkan ,, 4 karena setiap tumpukkan bernilai 4


String
di soal 18,19,20
seperti di C/C++
format scan nya biasanya %d %d -> %s %s
string beda dengan integer, 
kalo integer mau mindahin nilai variabel ke register ( mov eax, [variabel] ) (pake [ ] )
kalo string mau mindahin nilai variabel ke register ( mov eax, variabel )   (gapake [ ] )
kalo mau bandingin 2 string
Pake..

cmpsb
je sama	;jika sama lompat ke fungsi sama


misal di soal Weekend
extern scanf
extern printf
extern fflush
  
section .data
    	fmtScan db "%s", 0		; karena string pake %s
    	kuliah db "weekday", 10, 0	
    	libur db "weekend", 10, 0
   	sun db "Sun", 0
    	sat db "Sat", 0
      
section .bss
    a resd 1
  
section .text
    global main
      
main:
    cld	
    push a		; input a
    push fmtScan
    call scanf
    add esp, 8

    mov esi, a		; esi = a
    mov edi, sun	; edi = “Sun”
    mov ecx, 4		; ecx = 4, karena selalu terdiri dari 4 karakter (S),(u), (n),(null)
    cmpsb		; compare
    je sama		; jump equal, jika sama maka lompat ke fungsi sama, 
					jika tidak sama maka tetap turun
    mov esi, a		; esi = a
    mov edi, sat	; edi = “Sat”
    cmpsb		; compare
    je sama		; jump equal, jika sama maka lompat ke fungsi sama, 
					jika tidak sama maka tetap turun
    mov eax, kuliah	; eax = “weekday”
    push eax		; print eax
    call printf
    add esp, 4
    jmp exit
 
sama:		; fungsi sama
    mov eax, libur	; eax = “weekend”
    push eax		; print eax
    call printf
    add esp, 4
    jmp exit

exit:      
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80


misal di soal Mencari Huruf..
extern printf
extern fflush
extern scanf
        
section .data
    fmtScan db "%s %s", 0
    fmtPrint db "%d", 10, 0
    tidakAda db "tidak ada", 10, 0
                
section .bsscanf
        
section .data
    fmtScan db "%
    str resd 51
    cari resd 2
           
section .text
    global main
            
main:
    cld
    push cari		; d
    push str		; satuduatigaempatlimaenamtujuhdelapansembilansepulu
    push fmtScan	
    call scanf		; input str dan cari
    add esp, 12
       
    mov ecx, 50	; disoal panjang karakternya selalu 50
    mov edi, str		; edi = string awal
    mov al, [cari]	; al = huruf yang kita cari
    repne scasb	; ini semacam loopingan, ecxnya akan berkurang, loopingannya akan selesai kalo dia ketemu dengan huruf yang sama
	ada lagi namanya.. repe scasb -> loopinganny a akan selesai kalo dia ketemu dengan huruf yang beda     
     

     ; kalo di ngikutin inputan soal.. ecxnya akan jadi 45
    mov eax, 50	; eax = 50
    sub eax, ecx	; eax = eax - ecx -> eax = 50 - 45
    mov ebx, 0		; ebx =0
    cmp ecx, ebx	; compare.. ecx sama ebx
    je gaada		; kalo sama sama 0 maka lompat ke fungsi gaada, kalo bukan 0 maka lanjut ke bawah
      
    push eax		; cetak hasilnya
    push fmtPrint
    call printf
    add esp, 8
    jmp exit
   
gaada:
    push tidakAda	; cetak “tidak ada”
    call printf
    add esp, 4
    jmp exit
       
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80


Misal di soal Panjang kata..
extern printf
extern fflush
extern scanf
   	 
section .data
	fmtscan db "%s", 0
	fmtprint db "%d", 10, 0
	void db "tidak ada", 10, 0
       	 
section .bss
	str1 resd 21
	cari resd 2
      	 
section .text
	global main
       	 
main:
	cld
	push str1
	push fmtscan
	call scanf
	add esp,8
       	 
	mov ecx, 20
	mov edi, str1
	mov al, ""  
	repne scasb
         	 
	mov eax, 20
	sub eax, ecx
	mov ebx, 1
	sub eax,ebx
 	 
	push eax
	push fmtprint
	call printf
	jmp exit
    	 
exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80


 Floating Point, calling from C
soal nomer 21,22,23
seperti di C/C++
format scan nya biasanya %d %d -> %s %s
karena compiler biasa kita pake yasm..
jadi..
Basic Floating-Point Arithmetic Instructions.

					atau
faddp 	->	penambahan				fadd dword[a]	-> ditambah variabel a
fsubp	->	pengurangan				fsub dword[a]	-> dikurang variabel a
fmulp	->	perkalian				fmul dword[a]	-> dikali variabel a
fdivp	->	pembagian				fdiv dword[a]	-> dibagi variabel a
fldpi	-> 	masukin nilai pi ke stack
fld dword[a]	->	masukin nilai variabel a ke stack
fstp qword[b]   -> 	keluarkan nilainya  ke b

misal contoh Keliling Lingkaran..
extern scanf
extern printf
extern fflush
    
section .data
    fmtScan db "%f", 0
    fmtPrint db "%f", 10, 0
            
section .bss
    a resd 1
    
section .text
    global main
        
main:
    push a		; input a
    push fmtScan
    call scanf
    add esp, 8
  
    fld dword[a]   	; masukin nilai variabel a ke stack
    fldpi			; masukan nilai pi
    fmulp		; pi dikali dengan a			
     
    fstp qword[b]  	; pop ke b
     
    push dword[b+4]	; karena popnya qword, dan kita pushnya dword.. maka kita harus push 2x
    push dword[b]	; push dword[b+4] dan push dword[b]
mov eax, 1
    mov ebx, 0
    int 0x80
    push fmtPrint	;  print~		; 
    call printf
    add esp,12
 
exit:
    push 0
    call fflush
    mov eax, 1
    mov ebx, 0
    int 0x80






Input sesuai n

ini ada di soal 23, 24
jadi kita inputnya ganentu berapa banyak.. karena sesuai n

Contoh Masukan 1:
3
3 2 1

Contoh Masukan 2:
2
2 1

nah ga jelaskan kita inputnya berapa banyak wkwkwk

nah kalo si penulis, pake modul jump jump gitu.. 
tapi counternya jangan pake ecx sama edx.. pakai register yang lain aja

misal
contohnya ada soal pertambahan sesuai n
Contoh Masukan:
3
1 2 3

Contoh Keluaran:
6

nah kodingannya gini
extern scanf
extern printf
extern fflush
    
section .data
	fmtScan db "%d", 0
	fmtPrint db "%d", 10, 0
          	 
section .bss
	n resd 1
	a resd 1
    
section .text
	global main
   	 
main:
	push n   		 ; input n
	push fmtScan
	call scanf
	add esp, 8
    
	mov esi, [n]    ; esi buat counter
	mov edi, 0   	 ; tokoh utamanya edi bukan eax
    
input:
    	push a   		 ; input angka lagi
	push fmtScan
	call scanf
	add esp, 8
 
    	mov ebx, [a]    ; ebx = angka inputan
    	add edi, ebx    ; edi = edi + ebx
   	 
    	dec esi   	 ; esi--
   	cmp esi, 0   	 ; compare esi dengan 0
ja input   	 ; jika lebih dari 0, maka masih input
    
   	push edi   	 ; jika tidak lebih dari sama dengan 0, maka print edi(hasil)
	push fmtPrint
	call printf
	add esp, 8
    
exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80











Contoh Soal Rataan Suhu

extern printf
extern fflush
extern scanf
  	 
section .data
	fmtScan db "%f", 0		; format input buat bil 
	fmtN db "%d", 0		; format input n 
	fmtPrint db "%.1f", 10, 0	; format print
	sum dd 0.0  	 		; buat hitungan awalnya
      	 
section .bss
    n resd 1
    bil resd 1
    result resd 1
 	 
section .text
	global main
      	 
main:
    	push n			
	push fmtN
	call scanf
    
	mov edi, [n]		; buat counter looping, jangan pake (loop) (ecx)
    	fld dword[sum]	; awalan hitungan 0.0 
    
looping:
    push bil		; input bilangan sebanyak n
    push fmtScan
    call scanf
    add esp, 8
    
    fadd dword[bil]	; ditambah sama inputan
    
    sub edi, 1		; counternya(edi) -1 
    cmp edi, 0		; compare sampe tidak sama dengan 0
    jne looping

    fidiv dword[n]	; dibagi n, kenapa pake fidiv dan bukan fdiv ? karena n itu integer bukan floating point.. jadinya pake fidiv bukan fdiv
    fst qword[result]
    

    push dword[result+4]	; print hasil
    push dword[result]
    push fmtPrint
    call printf

exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80



dd

rreng








Link Kunci Jawaban OAK PRAKTIKUM

|	|	|
|	|	|
V	V	V

Link Kunjaw










Tambahan  Tambahan (bukan pertambahan(+)) :

cmpsb		; compare antara esi dan edi
je fungsi1	; jika sama ke fungsi fungsi1


repne scasb	; karena pake scasb, scasb itu compare antara al/ax/eax dengan edi
		; dan akan lanjut terus berdasarkan decrement dari ecx.






 sum dq 0.0 -> buat set value dari awal           



DISCLAIMER : 
DOKUMENTASI INI DIBUAT OLEH LELUHUR PENGAMBIL ORKOM SEBELUM BELUMNYA (credits : 53, 52, dst).
MOHON UNTUK TIDAK MEMUNAHKAN INI BEGITU SAJA HUEHUE :V

Jika mau update atau nambahkan konten disini. Silahkan tambahkan comment terus semoga keupdate besoknya

Selamat belajar dan sukses :d.
