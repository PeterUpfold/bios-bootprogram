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

jmp start

write_char:
    mov ah, 0x0E ; write in teletype mode
    int 0x10
    ret

times 510-($-$$) db 0 ; padding

dw 0xAA55  ; magic for boot loader
