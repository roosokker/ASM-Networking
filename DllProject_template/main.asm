include irvine32.inc
.data
	;------------------------------------------------------------------------------------
	AllKeys byte 176 dup(0)
	holdKeyIndex dword ?

	em byte 2h,1h,1h,3h,3h,2h,1h,1h,1h,3h,2h,1h,1h,1h,3h,2h
	result byte 16 dup(0),0

	;62,cf,0c,99,02,92,0c,18,27,91,f4,30,26,0d,d6,74
	   
	
	keye byte 0d0h, 14h, 0f9h, 0a8h, 0c9h, 0eeh, 25h, 89h, 0e1h, 3fh, 0ch, 0c8h, 0b6h, 63h, 0ch, 0a6h
	;39h, 25h, 84h, 1dh, 02h, 0dch, 09h, 0fbh, 0dch, 11h, 85h, 97h, 19h, 6ah, 0bh, 32h
	texte byte 4bh, 86h, 8dh, 6dh, 2ch, 4ah, 89h, 80h, 33h, 9dh, 0f4h, 0e8h, 37h, 0d2h, 18h, 0d8h
	eme byte 0eh,09h,0dh,0bh,0bh,0eh,09h,0dh,0dh,0bh,0eh,09h,09h,0dh,0bh,0eh
	resulte byte 16 dup(0),0

	;63,f2,7d,d4,c9,63,d4,fa,fe,26,c9,63,30,f2,c9,82

	i dword 0
	j dword 0

	offsetKey dword ?
	offsetText dword ?


	rCon byte 01h,00h, 00h, 00h, 02h,00h, 00h, 00h,04h,00h, 00h, 00h,08,00h, 00h, 00h,10h, 00h, 00h,00h, 20h, 00h, 00h, 00h, 40h, 00h, 00h, 00h, 80h,00h, 00h, 00h, 01bh,00h, 00h, 00h,36h,00h, 00h, 00h
	roundNumber byte 0
	temp byte 4 dup(?)

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
;#######################################################
.code

;----------------------------------------------------------
;Calculates: message XOR key
;Recieves: ESI (offset of text array), EDI (offset of key array)
;Returns: ESI on 'text XOR key' array
;----------------------------------------------------------
addRoundKey proc
   mov ecx , 16
   XORinputs:
               mov bl ,[ESI]
			   xor bl , [EDI]
			   mov [ESI] , bl
			   inc ESI
			   inc EDI
   Loop XORinputs
	RET
addRoundKey ENDP


;----------------------------------------------------------
;Calculates: Substitues from "Sbox" to text array
;Recieves: esi (offset on text array), edi offset SBOX_R0
;Returns: text array after substitution.
;----------------------------------------------------------
substituteBytesEncrypt proc
	mov ecx ,16
	subtitutingFromSbox:
		movzx eax,byte ptr [esi]
		mov bl,[edi+eax]
		mov byte ptr[esi],  bl
		inc esi
	loop subtitutingFromSbox
	RET
substituteBytesEncrypt ENDP
;----------------------------------------------------------
;Calculates: Shifting rows "left" according to row number.
;Recieves: ESI (offset of text array). on first elment in second row.
;Returns:Text array after shifting.
;----------------------------------------------------------
shiftRowsEncrypt PROC
	mov ecx,3
	mov edi ,1
	L4:
		push ecx
		push esi
		mov ecx,edi
		L5:
			push ecx
			push esi
			mov ecx ,3
			mov al,[esi]
			L6:
				mov bl ,[esi+4]
				mov [esi],bl
				add esi,4
			loop L6
			mov [esi],al
			pop esi
			pop ecx
		loop L5
		pop esi 
		add esi,1
		inc edi
		pop ecx
	loop L4
	RET
shiftRowsEncrypt ENDP
;----------------------------------------------------------
;Calculates: Shifting rows "right" according to row number.
;Recieves: ESI (offset of text array). on first elment in second row.
;Returns:Text array after shifting.
;----------------------------------------------------------
shiftRowsDecrypt PROC
	mov esi, offsettext
	inc esi
	mov ecx,3
	mov edi ,1
	L5:
		push ecx
		push esi
		mov ecx,edi
		L6:
			push ecx
			push esi
			mov ecx ,3
			mov al,[esi+12]
			L7:
				mov ebx ,ecx
				shl ebx,2
				mov ah ,[esi+ebx-4]
				mov [esi+ebx],ah
			loop L7
			pop esi
			mov [esi],al
			pop ecx
		loop L6
		pop esi 
		add esi,1
		inc edi
		pop ecx
	loop L5

	RET
shiftRowsDecrypt ENDP
;----------------------------------------------------------
;Calculates: Multiplying the output matrix from shift rows by a fixed matrix using advanced method for multiplication.
;Recieves: EDI (offset of Encryption Matrix), ESI (offset of text).
;Returns: Text after mixing columns.
;----------------------------------------------------------
mixColumnsEncrypt PROC
	mov edx, offset result
	mov ecx, 4
	l1:
		push ecx
		push edi
		push esi
			mov ecx, 4
			l3:
			push ecx
			push edi
			push esi
				mov ecx, 4
				l2:
				mov al, [esi]
				mov bl, [edi]
				cmp bl, 2
				je two
				ja three
				jmp next
		
				two:
				shl al, 1
				jnc next
				xor al, 1bh
				jmp next
		
				three:
				mov bl, al
				shl bl, 1
				jnc threecarry
				xor bl, 1bh
				threecarry:		
				xor al, bl
				
				next:
				xor [edx], al
				mov al, [edx]
				inc esi
				add edi, 4
				loop l2
			pop esi
			pop edi
			pop ecx
			inc edi
			inc edx
			loop l3
		pop esi
		pop edi
		pop ecx
		add esi,4
	loop l1
	
	mov edx, offset result
	mov esi, offsettext
	mov ecx, 16
	copyValuesToTextArray:
		push ecx
			mov cl, [edx]
			mov [esi], cl
			inc edx
			inc esi
		pop ecx
	loop copyValuesToTextArray

	mov edx, offset result
    mov ecx, lengthof result
    mov eax, 0
    ZeroingRes:
        and [edx], eax
        inc edx
    loop ZeroingRes
	RET
mixColumnsEncrypt ENDP


;----------------------------------------------------------
;Calculates: Substitues from "InvSbox" to text array
;Recieves: esi (offset on text array), edi offset Inv_SBOX_R0
;Returns: Text after substitution.
;----------------------------------------------------------
subsituteBytesDecrypt proc
	mov ecx ,16
	subtitutingFromInvSbox:
		movzx eax,byte ptr [esi]
		mov bl,[edi+eax]
		mov byte ptr[esi],  bl
		inc esi
	loop subtitutingFromInvSbox
	RET
subsituteBytesDecrypt ENDP
;----------------------------------------------------------
;Calculates:  Multiplying the output matrix from shift rows by a fixed matrix using advanced method for multiplication.
;Recieves: EDI (offset of fixed mtrix for decryption "eme"), ESI (offset of Encrypted Text), EDX (offset or temporary array "texte")
;Returns: Text array after mixing columns
;----------------------------------------------------------
mixColumnsDecrypt1 PROC
	mov ecx, 4
	l7:
		push ecx
		push edi
		push esi
			mov ecx, 4
			l8:
			push ecx
			push edi
			push esi
				mov ecx, 4
				l9:
					call mixColumnsDecrypt2				
				loop l9
			pop esi
			pop edi
			pop ecx
			inc edi
			inc edx
			loop l8
		pop esi
		pop edi
		pop ecx
		add esi,4
	loop l7

	mov edx, offset resulte
	mov esi, offsettext
	mov ecx, 16
	copyValuesToTexteArray:
		push ecx
			mov cl, [edx]
			mov [esi], cl
			inc edx
			inc esi
		pop ecx
	loop copyValuesToTexteArray

	mov edx, offset resulte
    mov ecx, lengthof resulte
    mov eax, 0
    ZeroingRese:
        and [edx], eax
        inc edx
    loop ZeroingRese
	RET
mixColumnsDecrypt1 ENDP

;----------------------------------------------------------
;Calculates: mixColumnsDecrypt1 Continue.
;Recieves:
;Returns:
;----------------------------------------------------------
mixColumnsDecrypt2 PROC
				mov al, [esi]
				mov bl, [edi]
				cmp bl, 9h
				je nine
				cmp bl, 0bh
				je beeh
				cmp bl, 0dh
				je deeh
				cmp bl, 0eh
				je eeeh
				
				nine:
				mov bl, al
				push ecx
				mov ecx, 3
				l11:
					shl bl, 1
					jnc lastt
					xor bl, 1bh
					lastt:
				loop l11
				xor al, bl
				pop ecx
				jmp next
		
				beeh:
				mov bl, al
				push ecx
				mov ecx, 3
				l12:
					shl bl, 1
					jnc lasta
					xor bl, 1bh
					lasta:
					cmp ecx,3
					jne beeho
					xor al, bl
					beeho:
				loop l12
				xor al, bl
				pop ecx
				jmp next

				deeh:
				mov bl, al
				push ecx
				mov ecx, 3
				l13:
					shl bl, 1
					jnc lastb
					xor bl, 1bh
					lastb:
					cmp ecx,2
					jne deeho
					xor al, bl
					deeho:
				loop l13
				xor al, bl
				pop ecx
				jmp next

				eeeh:
				mov bl, al
				push ecx
				mov ecx, 3
				l14:
					shl bl, 1
					jnc lastc
					xor bl, 1bh
					lastc:

					cmp ecx,3
					jne eeeho
					mov al, bl
					eeeho:

					cmp ecx,2
					jne eeeha
					xor al, bl
					eeeha:
				loop l14
				xor al, bl
				pop ecx
				jmp next
				
				next:
				xor [edx], al
				mov al, [edx]
				inc esi
				add edi, 4
	RET
mixColumnsDecrypt2 ENDP
;----------------------------------------------------------
;Calculates: Generate Key according to round number.
;Recieves: EDI (Offset on key array), roundNumber variable (Zero based).
;Returns: Newly generated key array.
;----------------------------------------------------------
keyGeneration PROC
		add edi,12
		mov ebx, offset temp
			;(0) Copying to a temp array
			mov ecx, 4
			copyingToTemp:
				mov al, [edi]
				mov [ebx], al
				inc edi
				inc ebx
			loop copyingToTemp

			;(1) Virtual Rotation
			movzx ecx, byte ptr [temp]
			push ecx
				mov ecx, 8
				rotating:
					shl temp+3,1
					rcl temp+2,1
					rcl temp+1,1
					rcl temp,1
				loop rotating
			pop ecx
		mov [temp+3], cl

		;(2) Virtual Subsitution
		;
		mov ecx, 4
		mov ebx, offset temp
			subTemp:
				push ecx
					mov ecx, offset SBOX_R0
					movzx eax, byte ptr [ebx]
					add ecx, eax
					movzx eax, byte ptr [ecx]
					mov [ebx], al
					inc ebx
				pop ecx
			loop subTemp

		;(3) XOR
		mov ebx, offset temp
		mov edi, offsetkey
		mov eax,4
		movzx ecx, roundNumber
		mul ecx
		mov ecx, eax
		mov eax, offset rcon
		add eax, ecx
		
		mov ecx,16
		XORing:
			push ecx
				push eax
				mov eax, ecx
				mov ecx, 4
				div ecx
				cmp edx,0
				jne NotEndOfColumn
					mov ebx, offset temp
				NotEndOfColumn:
				pop eax
				movzx ecx, byte ptr[ebx]
				xor cl, [edi]
				pop esi
				cmp esi,12
				push esi
				jle noRCON
					xor cl, [eax]
				noRcon:
					mov [ebx], cl
					mov [edi], cl
					inc ebx		;Offset of temp array
					inc edi		;Offset of key array
					inc eax		;Offset of RCON array
			pop ecx
		loop XORing
	RET
keyGeneration ENDP
;----------------------------------------------------------
;Calculates: Copy first key + newly generated key to a memory array.
;Recieves: EBX (Offset of AllKeys array), EDI (offset on key).
;Returns: A new key is add to AllKeys array.
;----------------------------------------------------------
copyKeyToAllKeys PROC
		mov ecx, 16
		copying:
			mov eax, [edi]
			mov [ebx], eax
			inc edi
			inc ebx
		loop copying
	RET
copyKeyToAllKeys ENDP
Encrypt proc text:PTR byte, key: PTR byte, len:Dword
pushAD
		mov eax, text
		mov offsetText, eax

		mov eax, key
		mov offsetKey, eax

		mov esi, offsettext
		mov edi, offsetkey
		call addRoundKey									;(0)

		mov ebx, offset allKeys
		mov holdKeyIndex, ebx
		mov ecx, 9
		DoNineRounds:
			push ecx
				mov ebx, holdKeyIndex
				mov edi, offsetkey
				call copyKeytoAllKeys
				mov holdKeyIndex, ebx

				mov edi, offset SBOX_R0
				mov esi, offsettext
				call substituteBytesEncrypt					;(1)


				mov esi, offsettext
				inc esi
				call shiftRowsEncrypt						;(2)

				mov edi, offset em
				mov esi, offsettext
				call mixColumnsEncrypt						;(3)

				pop ecx										;
				mov eax, 9									; 
				sub eax, ecx								;	
				push ecx									;
				mov roundNumber, al							;roundNumber is zero based
				mov edi, offsetkey							;
				call keyGeneration							;<====Generation for key
				
				mov esi, offsettext
				mov edi, offsetkey
				call addRoundKey							;(4)

			pop ecx
		loop DoNineRounds
		mov ebx, holdKeyIndex
		mov edi, offsetkey
		call copyKeytoAllKeys
		mov holdKeyIndex, ebx

		mov edi, offset SBOX_R0
		mov esi, offsettext
		call substituteBytesEncrypt							;(1)

		mov esi, offsettext
		inc esi
		call shiftRowsEncrypt								;(2)

		mov roundNumber, 9									; Zero bazed
		mov edi, offsetkey
		call keyGeneration									;<====Generation for key

		mov edi, offsetkey
		mov ebx, holdKeyIndex
		call copyKeytoAllKeys
		mov holdKeyIndex, ebx

		mov esi, offsettext
		mov edi, offsetkey
		call addRoundKey									;(3)

		mov ebx, text
		mov ebx, offsettext								;Output
		mov text, ebx
popAD
ret
Encrypt Endp

Decrypt proc text:PTR byte, key: PTR byte, len:Dword
pushAD
		mov eax, text
		mov offsetText, eax

		mov eax, key
		mov offsetKey, eax

		sub holdKeyIndex, 10h
		mov edi, holdKeyIndex				;Previously saved key.
		mov esi, offsettext
		call addRoundKey

		mov ecx, 9
		DoNineRoundsOfDecryption:
			push ecx
				mov esi, offsettext
				call shiftRowsDecrypt

				mov esi, offsettext
				mov edi, offset Inv_SBOX_R0
				call subsituteBytesDecrypt

				sub holdKeyIndex, 10h
				mov edi, holdkeyIndex
				mov esi, offsettext
				call addRoundKey

				mov edi, offset eme
				mov esi, offsettext
				mov edx, offset resulte
				call mixColumnsDecrypt1
			pop ecx
		loop DoNineRoundsOfDecryption

				sub holdKeyIndex, 10h		;Previous saved key.
				mov edi, holdKeyIndex

				mov esi, offsettext
				call shiftRowsDecrypt

				mov esi, offsettext
				mov edi, offset Inv_SBOX_R0
				call subsituteBytesDecrypt

				mov esi, offsettext
				mov edi, holdkeyIndex
				call addRoundKey

				mov ebx, offsetText
				mov text, ebx
popAD
ret
Decrypt Endp

; DllMain is required for any DLL
DllMain PROC hInstance:DWORD, fdwReason:DWORD, lpReserved:DWORD
mov eax, 1 ; Return true to caller.
ret
DllMain ENDP
END DllMain