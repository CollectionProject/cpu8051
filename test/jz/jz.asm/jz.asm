.area   SYS   (ABS)

; RESET VECTOR
        .org    0x0000
        ljmp    _setup

; EXTERNAL 0 Interrupt vector
	.org    0x0003
        ljmp    _halt

; TIMER 0 Interrupt vector
	.org    0x000B
        ljmp    _halt

; EXTERNAL 1 Interrupt vector
	.org    0x0013
        ljmp    _halt

; TIMER 1 Interrupt vector
	.org    0x001B
        ljmp    _halt

; SERIAL Interrupt vector
	.org    0x0023
        ljmp    _halt

; MAIN code area
        .org    0x30 

_setup: mov     SP, #0x7
        lcall   _main
_halt:  sjmp    _halt

_pass:  mov     0x7f, #0x99
        sjmp    _end
_fail:  mov     0x7f, #0xbb
_end:   ret

_main:  mov     0x7f, #0

;--------------------------------------------------------
; Main test program here


;--------------------------------------------------------
; JZ reladdr

	; ACC is 0
	mov A, #0
	jz		_ok0
	ljmp		_fail
_ok0:	
	mov A, #1
	jz		_fail

;--------------------------------------------------------
; JNZ reladdr

	; ACC is not 0
	mov A, #1
	jnz		_ok1
	ljmp		_fail
_ok1:	
	; ACC is zero
	mov A, #0
	jnz		_fail

	ljmp    _pass

;--------------------------------------------------------

;       END

