include irvine32.inc
.data
;no static data
lsbRED byte ?
lsbBlue byte ?
lsbGreen byte ?
msgBit	byte ?
keyBit byte ?
holdMessage dword ?
holdKey dword ?
.code



Steganography proc RArr: PTR DWORD, BArr: PTR DWORD, GArr: PTR DWORD, imageSize: DWORD, message: PTR Byte, key: PTR Byte
	pushad
		mov eax, RArr
		mov esi, BArr
		mov edi, GArr
		mov ecx, 16
		mov edx, message
		mov holdMessage, edx
		mov edx, key
		mov holdKey, edx
		onPixels:
		  push ecx
		  mov ecx, 8
				shift1Byte:
					push ecx
						call byteByByte
					pop ecx
				loop shift1Byte
		  inc holdMessage
		  inc holdKey
		  inc edx
		  pop ecx
		loop onPixels
	popad
	ret
Steganography endp
byteByByte PROC
			mov edx, [eax]		;Check RED bit
			shr edx, 1
			jc lsbIsOne
				mov bl, 0
				mov lsbRED, bl
				jmp break1
			lsbIsOne:
				mov bl, 1
				mov lsbRED, bl
			break1:

			mov edx, holdKey	;Check Key bit
			shl byte ptr [edx], 1
			jc keyBitIsOne
				mov bl, 0
				mov keyBit, bl
				jmp break4
			keyBitIsOne:
				mov bl,1
				mov keyBit, bl
			break4:


			mov edx, holdMessage
			shl byte ptr [edx], 1
			jc msgBitIsOne
				mov bl, 0
				mov msgBit, bl
				mov dl, 0FEh			;To be anded later.
				jmp break2
			msgBitIsOne:
				mov bl,1
				mov msgBit, bl
				mov dl, 01h				;To be ored later.
			break2:


			mov cl, lsbRED
			XOR cl, keyBit
			cmp cl, 1
			je left
				cmp msgBit,1
				je orIt
					and [esi] , dl
					jmp break3
				orIt:
					or [esi], dl
				jmp break3
			left:
				cmp msgBit,1
				je orIt2
					and [edi], dl
					jmp break3
				orIt2:
					or [edi] , dl
			break3:

			add esi,4
			add edi,4
			add eax,4
	
RET
byteByByte ENDP
; DllMain is required for any DLL
DllMain PROC hInstance:DWORD, fdwReason:DWORD, lpReserved:DWORD
mov eax, 1 ; Return true to caller.
ret
DllMain ENDP
END DllMain