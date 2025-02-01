org 0x7C00
bits 16

; macro for \r, \n
%define ENDL 0x0D, 0x0A

start:
	jmp main

;
; prints a string to the screen
; Params:
;	ds:si points to the string

puts:
	; save registers we will modify
	push si
	push ax

.loop:
	lodsb 				; loads next character from si in al
	or al, al			; orring al with al, if it is null, then the 
						; 		null flag is set true
	jz .done			;

	mov ah, 0x0e
	int 0x10
	
	jmp .loop

.done:
	pop ax
	pop si
	ret

main:
	; setting up data segments
	mov ax, 0
	mov ds, ax
	mov es, ax

	; setting up the stack
	mov ss, ax
	mov sp, 0x7C00

	; printing the msg_hello
	mov si, msg_hello
	jmp puts
	
	hlt

.halt:
	jmp .halt

msg_hello: db 'Hello World!', ENDL, 0 ; 0 at end indicates null

times 510-($-$$) db 0
dw 0AA55h
