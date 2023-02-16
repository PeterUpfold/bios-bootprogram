start:
mov al, "H" ; "A"
call write_char ; how are calling conventions going to work?

mov al, "e"
call write_char

mov al, "l"
call write_char
call write_char

mov al, "o"
call write_char

mov al, " "
call write_char

mov al, "W"
call write_char

mov al, "o"
call write_char

mov al, "r"
call write_char

mov al, "l"
call write_char

mov al, "d"
call write_char

mov al, " "
call write_char

mov al, 0x0D ; carriage return
call write_char

mov al, 0x0A ; line feed
call write_char

; loop through reading and printing ascii keys
read_loop:
    call read_char
    jmp read_loop

write_char:
    mov ah, 0x0E ; write in teletype mode
    int 0x10
    ret

read_char:
    mov ah, 0x0 ; read keyboard input
    int 0x16 ; 
    ; ah now contains the scan code, al contains the ascii character
    cmp al, 0x0
    jz skip_call_write_char
    call write_char
    skip_call_write_char:
    ret


times 510-($-$$) db 0 ; padding

dw 0xAA55  ; magic for boot loader
