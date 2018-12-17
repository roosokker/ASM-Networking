include irvine32.inc
.data

;DATA FOR ENCRYPTION
;--------------- input DATA --------------- 
       ;write your data here
;--------------- End of input DATA --------------- 

;--------------- Esubstitute DATA --------------- 
       ;write your data here
;--------------- End of Esubstitute DATA ---------------

;--------------- Eshiftrows DATA ---------------
       ;write your data here
;--------------- End of Eshiftrows DATA ---------------

;--------------- Eaddmatrix DATA ---------------
       ;write your data here
;--------------- End of Eaddmatrix DATA ---------------


;DATA FOR DECRYPTION

;--------------- Daddmatrix DATA --------------- 
       ;write your data here
;--------------- End of Daddmatrix DATA ---------------

;--------------- Dshiftrows DATA --------------- 
       ;write your data here
;--------------- End of Dshiftrows DATA ---------------

;--------------- Dsubstitute DATA --------------- 
       ;write your data here
;--------------- End of Dsubstitute DATA --------------- 


;DATA FOR ENCRYPTED S-BOX

 SBOX_R0 Byte 63h,7Ch,77h,7Bh,0F2h,6Bh,6Fh,0C5h,30h,01h,67h,2Bh,0FEh,0D7h,0ABh,76h
 SBOX_R1 Byte 0CAh,82h,0C9h,7Dh,0FAh,59h,47h,0F0h,0ADh,0D4h,0A2h,0AFh,9Ch,0A4h,72h,0C0h
 SBOX_R2 Byte 0B7h,0FDh,93h,26h,36h,3Fh,0F7h,0CCh,34h,0A5h,0E5h,0F1h,71h,0D8h,31h,15h
 SBOX_R3 Byte     04h,0C7h,23h,0C3h,18h,96h,05h,9Ah,07h,12h,80h,0E2h,0EBh,27h,0B2h,75h
 SBOX_R4 Byte     09h,83h,2Ch,1Ah,1Bh,6Eh,5Ah,0A0h,52h,3Bh,0D6h,0B3h,29h,0E3h,2Fh,84h
 SBOX_R5 Byte     53h,0D1h,00h,0EDh,20h,0FCh,0B1h,5Bh,6Ah,0CBh,0BEh,39h,4Ah,4Ch,58h,0CFh
 SBOX_R6 Byte 0D0h,0EFh,0AAh,0FBh,43h,4Dh,33h,85h,45h,0F9h,02h,7Fh,50h,3Ch,9Fh,0A8h
 SBOX_R7  Byte 51h,0A3h,40h,8Fh,92h,9Dh,38h,0F5h,0BCh,0B6h,0DAh,21h,10h,0FFh,0F3h,0D2h
 SBOX_R8  Byte  0CDh,0Ch,13h,0ECh,5Fh,97h,44h,17h,0C4h,0A7h,7Eh,3Dh,64h,5Dh,19h,73h
 SBOX_R9  Byte 60h,81h,4Fh,0DCh,22h,2Ah,90h,88h,46h,0EEh,0B8h,14h,0DEh,5Eh,0Bh,0DBh
 SBOX_R10  Byte 0E0h,32h,3Ah,0Ah,49h,06h,24h,5Ch,0C2h,0D3h,0ACh,62h,91h,95h,0E4h,79h
 SBOX_R11  Byte 0E7h,0C8h,37h,6Dh,8Dh,0D5h,4Eh,0A9h,6Ch,56h,0F4h,0EAh,65h,7Ah,0AEh,08h
 SBOX_R12  Byte 0BAh,78h,25h,2Eh,1Ch,0A6h,0B4h,0C6h,0E8h,0DDh,74h,1Fh,4Bh,0BDh,8Bh,8Ah
 SBOX_R13  Byte 70h,3Eh,0B5h,66h,48h,03h,0F6h,0Eh,61h,35h,57h,0B9h,86h,0C1h,1Dh,9Eh
 SBOX_R14  Byte 0E1h,0F8h,98h,11h,69h,0D9h,8Eh,94h,9Bh,1Eh,87h,0E9h,0CEh,55h,28h,0DFh
 SBOX_R15  Byte  8Ch,0A1h,89h,0Dh,0BFh,0E6h,42h,68h,41h,99h,2Dh,0Fh,0B0h,54h,0BBh,16


 ;DATA FOR DECRYPTED S-BOX

 Inv_SBOX_R0 Byte 52h, 09h, 6ah, 0d5h, 30h, 36h, 0a5h, 38h, 0bfh, 40h, 0a3h, 9eh, 81h, 0f3h, 0d7h, 0fbh
 Inv_SBOX_R1 Byte      7ch, 0e3h, 39h, 82h, 9bh, 2fh, 0ffh, 87h, 34h, 8eh, 43h, 44h, 0c4h, 0deh, 0e9h, 0cbh
 Inv_SBOX_R2 Byte      54h, 7bh, 94h, 32h, 0a6h, 0c2h, 23h, 3dh, 0eeh, 4ch, 95h, 0bh, 42h, 0fah, 0c3h, 4eh
 Inv_SBOX_R3 Byte          08h, 2eh, 0a1h, 66h, 28h, 0d9h, 24h, 0b2h, 76h, 5bh, 0a2h, 49h, 6dh, 8bh, 0d1h, 25h
 Inv_SBOX_R4 Byte     72h, 0f8h, 0f6h, 64h, 86h, 68h, 98h, 16h, 0d4h, 0a4h, 5ch, 0cch, 5dh, 65h, 0b6h, 92h
 Inv_SBOX_R5 Byte    6ch, 70h, 48h, 50h, 0fdh, 0edh, 0b9h, 0dah, 5eh, 15h, 46h, 57h, 0a7h, 8dh, 9dh, 84h
 Inv_SBOX_R6 Byte 90h, 0d8h, 0abh, 00h, 8ch, 0bch, 0d3h, 0ah, 0f7h, 0e4h, 58h, 05h, 0b8h, 0b3h, 45h, 06h
 Inv_SBOX_R7  Byte  0d0h, 2ch, 1eh, 8fh, 0cah, 3fh, 0fh, 02h, 0c1h, 0afh, 0bdh, 03h, 01h, 13h, 8ah, 6bh
 Inv_SBOX_R8  Byte  3ah, 91h, 11h, 41h, 4fh, 67h, 0dch, 0eah, 97h, 0f2h, 0cfh, 0ceh, 0f0h, 0b4h, 0e6h, 73h
 Inv_SBOX_R9  Byte 96h, 0ach, 74h, 22h, 0e7h, 0adh, 35h, 85h, 0e2h, 0f9h, 37h, 0e8h, 1ch, 75h, 0dfh, 6eh
 Inv_SBOX_R10  Byte 47h, 0f1h, 1ah, 71h, 1dh, 29h, 0c5h, 89h, 6fh, 0b7h, 62h, 0eh, 0aah, 18h, 0beh, 1bh
 Inv_SBOX_R11  Byte 0fch, 56h, 3eh, 4bh, 0c6h, 0d2h, 79h, 20h, 9ah, 0dbh, 0c0h, 0feh, 78h, 0cdh, 5ah, 0f4h
 Inv_SBOX_R12  Byte 1fh, 0ddh, 0a8h, 33h, 88h, 07h, 0c7h, 31h, 0b1h, 12h, 10h, 59h, 27h, 80h, 0ech, 5fh
 Inv_SBOX_R13  Byte 60h, 51h, 7fh, 0a9h, 19h, 0b5h, 4ah, 0dh, 2dh, 0e5h, 7ah, 9fh, 93h, 0c9h, 9ch, 0efh
 Inv_SBOX_R14  Byte 0a0h, 0e0h, 3bh, 4dh, 0aeh, 2ah, 0f5h, 0b0h, 0c8h, 0ebh, 0bbh, 3ch, 83h, 53h, 99h, 61h
 Inv_SBOX_R15  Byte  17h, 2bh, 04h, 7eh, 0bah, 77h, 0d6h, 26h, 0e1h, 69h, 14h, 63h, 55h, 21h, 0ch, 7dh


.code

;PROCEDURES FOR ENCRYPION

;procedure to input the text and the key then XORing them together and the result is in another matrix
input PRC

ret
input ENDP


;procedure to substitute the resulted matrix from s-Box
Esubstitute PROC
  ;mov sbox , ASMDLL.sBox

ret
Esubstitute ENDP

;procedure to rotaterows left of the resulted substituted matrix
Eshiftrows PROC

ret
Eshiftrows ENDP

;XORing the resulted shiftedrows matrix with the constant Encrypted matrix
Eaddmatrix PROC

ret
Eaddmatrix ENDP

;procedure to loop 10 rounds and will call all of the above functions in it
Lop PROC

ret
Lop ENDP

;PROCEDURES FOR DECRYPTION

;procedure to XOR the resulted encrypted text with the constant Decrypted matrix
Daddmatrix PROC

ret
Daddmatrix ENDP

;procedure to take the resulted XOR-ed matrix and rotate them right
Dshiftrows PROC

ret
Dshiftrows ENDP

;procedure to substitute the resulted rotated matrix with the Decrypted S-Box
Dsubstitute PROC
  ;mov sbox , ASMDLL.sBox

ret
Dsubstitute ENDP

;procedure to loop 10 rounds of decryption and calling all of the above procedures in it
Lope PROC

Lope ENDP


Encrypt proc text:PTR byte, key: PTR byte, len:Dword

ret
Encrypt Endp

Decrypt proc text:PTR byte, key: PTR byte, len:Dword

ret
Decrypt Endp

; DllMain is required for any DLL
DllMain PROC hInstance:DWORD, fdwReason:DWORD, lpReserved:DWORD
mov eax, 1 ; Return true to caller.
ret
DllMain ENDP
END DllMain