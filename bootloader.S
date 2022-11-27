
mov al, 0x41
mov ah, 0x0E
int 0x10

times 510-($-$$) db 0 ; padding

dw 0xAA55  ; magic for boot loader
