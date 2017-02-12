fs_write:
	push bp
	mov bp, sp
	mov bx, [bp + 2] ;buffer_dir
	mov ax, [bp + 4] ;block_number

	call disk_convert_l2hts

	mov ah, 0x03
	mov al, 0x01
	mov es, bx
	mov bx, 0x0
	int 13h
	pop bp
	ret

fs_read:
	push bp
	mov bp, sp
	mov bx, [bp + 2] ;buffer_dir
	mov ax, [bp + 4] ;block_number

	call disk_convert_l2hts

	mov ah, 0x02
	mov al, 0x01
	mov es, bx
	mov bx, 0x0
	int 13h
	pop bp

	ret

fs_get_drive_info:
	ret

; --------------------------------------------------------------------------
; Reset floppy disk

disk_reset_floppy:
	push ax
	push dx
	mov ax, 0
; ******************************************************************
	mov dl, [bootdev]
; ******************************************************************
	stc
	int 13h
	pop dx
	pop ax
	ret


; --------------------------------------------------------------------------
; disk_convert_l2hts -- Calculate head, track and sector for int 13h
; IN: logical sector in AX; OUT: correct registers for int 13h

disk_convert_l2hts:
	push bx
	push ax

	mov bx, ax			; Save logical sector

	mov dx, 0			; First the sector
	div word [SecsPerTrack]		; Sectors per track
	add dl, 01h			; Physical sectors start at 1
	mov cl, dl			; Sectors belong in CL for int 13h
	mov ax, bx

	mov dx, 0			; Now calculate the head
	div word [SecsPerTrack]		; Sectors per track
	mov dx, 0
	div word [Sides]		; Floppy sides
	mov dh, dl			; Head/side
	mov ch, al			; Track

	pop ax
	pop bx

; ******************************************************************
	mov dl, [bootdev]		; Set correct device
; ******************************************************************

	ret


	Sides dw 2
	SecsPerTrack dw 18
; ******************************************************************
	bootdev db 0			; Boot device number