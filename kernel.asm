;set print-registers

MOV AH, 0x0E ;function nr
MOV BH, 0x00 ;page
MOV BL, 0x07 ;color


call os_clear_screen

mov si, msg ;move msg to SI-pointer
call os_print_string ;call function to print SI (msg)

call os_print_horiz_line

mov ax, 5
call os_int_to_string
mov si, ax
call os_print_string

; mov si, str1
; call os_string_to_int
; call os_int_to_string
; mov si, ax
; call os_print_string

call os_wait_for_key

mov ax, string_t
call os_input_string

mov si, string_t
mov ax, 20
push ax
push si

call fs_write

mov bx, str1
mov ax, 20
push ax
push bx
call fs_read

mov si, str1
call os_print_string


mov si, msg ;move msg to SI-pointer
call os_print_string ;call function to print SI (msg)

call os_wait_for_key


string_t times 20 db 0

str1 db "12374",0

msg db 'Hello world from the kernel!', 13, 10, 0
filename_input	times 12 db 0

%INCLUDE "features/keyboard.asm"
%INCLUDE "features/utils.asm"
%INCLUDE "features/string.asm"
%INCLUDE "features/fs.asm	"
; %INCLUDE "features/screen.asm"
; %INCLUDE "features/cli.asm"
; %INCLUDE "features/disk.asm"
; %INCLUDE "features/math.asm"
; %INCLUDE "features/misc.asm"
; %INCLUDE "features/ports.asm"
; %INCLUDE "features/sound.asm"
; %INCLUDE "features/basic.asm"