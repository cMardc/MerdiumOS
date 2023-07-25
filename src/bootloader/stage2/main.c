#include "stdint.h"
#include "stdio.h"

void _cdecl cstart_(uint16_t bootDrive)
{
    //Currently Prints Wrong Charachter Because Of Compiler Path Errors
    //Use WCC Watcom Compiler With Define _cdecl
    //C Standard : c99
    puts("Hello world from C!\r\n");
    for (;;);
}
