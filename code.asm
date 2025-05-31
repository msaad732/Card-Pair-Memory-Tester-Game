INCLUDE Irvine32.inc

.data
cards      DWORD 3, 7, 3, 7, 9, 5, 5, 9   ; 8 shuffled cards (4 pairs)
revealed   BYTE 8 DUP(0)

msgIndex1  BYTE "Enter first index (0-7): ", 0
msgIndex2  BYTE "Enter second index (0-7): ", 0
msgMatch   BYTE "Match found!", 0
msgNoMatch BYTE "No match!", 0
msgWin     BYTE "All pairs matched! You won!", 0
msgAlready BYTE "Card already revealed! Try again.", 0
msgColon   BYTE ": ", 0
msgEqual   BYTE " = ", 0
msgStar    BYTE "[*]", 0
newline    BYTE 13, 10, 0

.code

main PROC
    call Clrscr

gameLoop:
    call showBoard

    ; First index
    mov edx, OFFSET msgIndex1
    call WriteString
    call ReadInt
    mov esi, eax         ; esi = first index

    ; Check if already revealed
    mov al, revealed[esi]
    cmp al, 1
    je alreadyRevealed

    ; Second index
    mov edx, OFFSET msgIndex2
    call WriteString
    call ReadInt
    mov edi, eax         ; edi = second index

    ; Check if already revealed
    mov al, revealed[edi]
    cmp al, 1
    je alreadyRevealed

    call Clrscr
    call showTempBoard

    ; Compare cards (multiply index by 4 to access DWORD)
    mov eax, cards[esi*4]   ; Access card at index esi
    mov ebx, cards[edi*4]   ; Access card at index edi
    cmp eax, ebx
    je matched

    ; Not matched
    mov edx, OFFSET msgNoMatch
    call WriteString
    call Crlf
    jmp checkWin

matched:
    mov revealed[esi], 1
    mov revealed[edi], 1
    mov edx, OFFSET msgMatch
    call WriteString
    call Crlf

checkWin:
    mov ecx, 0
checkLoop:
    cmp ecx, 8
    je youWon
    cmp revealed[ecx], 1
    jne gameLoop
    inc ecx
    jmp checkLoop

youWon:
    mov edx, OFFSET msgWin
    call WriteString
    call Crlf
    exit

alreadyRevealed:
    mov edx, OFFSET msgAlready
    call WriteString
    call Crlf
    jmp gameLoop

main ENDP

; ------------------------------
showBoard PROC
    mov ecx, 0
showLoop:
    cmp ecx, 8
    je done

    mov eax, ecx
    call WriteInt
    mov edx, OFFSET msgColon
    call WriteString

    mov al, revealed[ecx]
    cmp al, 1
    je showReal

    mov edx, OFFSET msgStar
    call WriteString
    call Crlf
    jmp skip

showReal:
    mov eax, cards[ecx*4]
    call WriteInt
    call Crlf

skip:
    inc ecx
    jmp showLoop

done:
    ret
showBoard ENDP

; ------------------------------
showTempBoard PROC
    mov ecx, 0
showTempLoop:
    cmp ecx, 8
    je doneTemp

    mov eax, ecx
    call WriteInt
    mov edx, OFFSET msgColon
    call WriteString

    mov al, revealed[ecx]
    cmp al, 1
    je showRealTemp

    cmp ecx, esi
    je showRealTemp
    cmp ecx, edi
    je showRealTemp

    mov edx, OFFSET msgStar
    call WriteString
    call Crlf
    jmp skipTemp

showRealTemp:
    mov eax, cards[ecx*4]
    call WriteInt
    call Crlf

skipTemp:
    inc ecx
    jmp showTempLoop

doneTemp:
    ret
showTempBoard ENDP

END main
