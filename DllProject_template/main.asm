include irvine32.inc
.data

;DATA FOR ENCRYPTION
;--------------- inputs DATA ----------

   key dword 16 dup (?)
   text dword 16 dup (?)
   textXkey dword 16 dup(?)

;------------ end of inputs DATA -------


;------------ Encrypt DATA -------------

;------------End of Encrypt DATA--------



;DATA FOR DECRYPTION

;-------------Decrypt DATA----------------

;------------End of Decrypt DATA----------

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
   mov edx , offset textXkey
   mov ecx , lengthof text
   XORinputs:
               mov ebx , [esi]
			   xor ebx , [edi]
			   mov [edx] , ebx
			   add esi , 4
			   add edi , 4
			   add edx , 4
   Loop XORinputs

ret
inputs ENDP


KeysGeneration PROC

ret
KeysGeneration PROC


Encrypt PROC

ret
Encrypt ENDP

Decrypt PROC

ret
Decrypt PROC

; DllMain is required for any DLL
DllMain PROC hInstance:DWORD, fdwReason:DWORD, lpReserved:DWORD
mov eax, 1 ; Return true to caller.
ret
DllMain ENDP
END DllMain