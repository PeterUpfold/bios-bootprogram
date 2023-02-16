start:

lea ax, str_helloworld
call write_string
jmp $

; loop through reading and printing ascii keys
read_loop:
    call read_char
    jmp read_loop

; expects -- string pointer in si
write_string:
    mov si, ax
    xor ax,ax
    lodsb
    cmp al, 0x0
    jz finish_write_string
    call write_char
    add si, 0x1
    jmp write_string
    finish_write_string:
    ret

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

str_helloworld db 'Hello world', 0x0A, 0x0D, 0



times 510-($-$$) db 0 ; padding
magic dw 0xAA55  ; magic for boot loader
