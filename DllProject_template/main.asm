include irvine32.inc
.data

;DATA FOR ENCRYPTION
;--------------- inputs DATA ----------

   key dword 16 dup (?)
   text dword 16 dup (?)
   textXkey dword 16 dup(?)

;------------ end of inputs DATA -------


;------------ Esubstitute DATA ---------------
         ;write data here
;----------- end of Esubstitute DATA ---------


;----------- Eshiftrows DATA ------------------
         ;write data here
;----------- end of Eshiftrows DATA -----------


;----------- Eaddmatrix DATA ------------------
         ;write data here
;----------- end of Eaddmatrix DATA ------------



;DATA FOR DECRYPTION
;------------ Dsubstitute DATA ---------------
         ;write data here
;----------- end of Dsubstitute DATA ---------


;----------- Dshiftrows DATA ------------------
         ;write data here
;----------- end of Dshiftrows DATA -----------


;----------- Daddmatrix DATA ------------------
         ;write data here
;----------- end of Daddmatrix DATA ------------


.code

;procedures for encryption
inputs PROC
   mov esi , offset text
   mov ecx , lengthof text
   textinputs:
             call readdec
			 mov [esi] , eax
			 add esi , 4
   Loop textinputs

   mov edi , offset key
   mov ecx , lengthof key
   keyinputs:
            call readdec
			mov [edi] , eax
			add edi , 4
   Loop keyinputs

   mov esi , offset text
   mov edi , offset key
   mov ebx , offset textXkey
   mov ecx , lengthof text
   XORinputs:
               mov ebx , [esi]
			   xor ebx , [edi]
			   mov ebx , ebx
			   add esi , 4
			   add edi , 4
			   add ebx , 4
   Loop XORinputs

ret
inputs ENDP

;procedure to substitute the resulted matrix from s-Box
Esubstitute PROC
  ;mov sbox , ASMDLL.sBox

ret
Esubstitute ENDP

;procedure to shiftrows left of the resulted substituted matrix
Eshiftrows PROC

ret
Eshiftrows ENDP

;XORing the resulted shiftedrows matrix with the constant Encr matrix
Eaddmatrix PROC

ret
Eaddmatrix ENDP

;procedure to loop 10 rounds and will call all the above function in it
Lop PROC

ret
Lop ENDP

;procedures for decryption

;procedure to XOR the resulted encrypted text with the constant Decr matrix
Daddmatrix PROC

ret
Daddmatrix ENDP

;procedure to take the resulted XORing matrix and shift them right
Dshiftrows PROC

ret
Dshiftrows ENDP

;procedure to substitute the resulted shifted matrix with the Decrypted s-Box
Dsubstitute PROC
  ;mov sbox , ASMDLL.sBox

ret
Dsubstitute ENDP

;procedure to loop 10 rounds of decryption and calling all of the above procedures in it
Lope PROC

Lope ENDP



; DllMain is required for any DLL
DllMain PROC hInstance:DWORD, fdwReason:DWORD, lpReserved:DWORD
mov eax, 1 ; Return true to caller.
ret
DllMain ENDP
END DllMain