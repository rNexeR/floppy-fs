;set print-registers

MOV AH, 0x0E ;function nr
MOV BH, 0x00 ;page
MOV BL, 0x07 ;color


call os_clear_screen

mov si, msg ;move msg to SI-pointer
call os_print_string ;call function to print SI (msg)

call os_print_horiz_line

; mov ax, 5
; call os_int_to_string
; mov si, ax
; call os_print_string

; mov si, str1
; call os_string_to_int
; call os_int_to_string
; mov si, ax
; call os_print_string

; call os_wait_for_key

; mov bx, str1
; mov ax, 4
; push ax
; push bx

; call fs_write

; pop bx
; pop ax

mov si, msg
call os_print_string

call fs_get_drive_info

; mov bx, str1
; mov ax, 4
; push ax
; push bx
; call fs_read

; pop bx
; pop ax

; mov si, str1
; call os_print_string


mov si, msg ;move msg to SI-pointer
call os_print_string ;call function to print SI (msg)

call os_wait_for_key


string_t times 1 db 0

str1 db "1",0

msg db 'Hello world from the kernel!', 13, 10, 0
filename_input	times 1 db 0

%INCLUDE "features/fs.asm"
%INCLUDE "features/keyboard.asm"
%INCLUDE "features/utils.asm"
%INCLUDE "features/string.asm"
; %INCLUDE "features/screen.asm"
; %INCLUDE "features/cli.asm"
; %INCLUDE "features/disk.asm"
; %INCLUDE "features/math.asm"
; %INCLUDE "features/misc.asm"
; %INCLUDE "features/ports.asm"
; %INCLUDE "features/sound.asm"
; %INCLUDE "features/basic.asm"