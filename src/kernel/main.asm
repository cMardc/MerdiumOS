org 0x0
bits 16

%define ENDL 0x0D, 0X0A

start:
    ;Print Kernel Is Loaded
    mov si, load_message
    call puts


.halt:
    cli
    hlt

;
; Prints A String To The Screen
; Params:
;   - ds:si Points To String
;
puts:
    ; Save registers That We Will Modify
    push si
    push ax
    push bx 

.loop:
    lodsb           ; Loads Next Charachter In al
    or al, al       ; Verify If Next Chacahter Is Null ?
    jz .done        ; End If Null

    mov ah, 0x0E    ; BIOS Interrupt Parameter (VIDEO)
    mov bh, 0       ; Set Page Number To 0
    int 0x10        ; Call BIOS Interrupt

    jmp .loop

.done:
    pop bx
    pop ax
    pop si
    ret

load_message: db 'Kernel Loaded Succesfuly!', ENDL, 0