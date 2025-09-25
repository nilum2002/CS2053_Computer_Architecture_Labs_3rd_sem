#include "ripes_system.h"
unsigned *led_base = LED_MATRIX_0_BASE;
unsigned *switch_base = SWITCHES_0_BASE;
void main()
{
    unsigned state = 0;
    unsigned count = 1;
    while (1)
    {
        if (*switch_base & 0x1)
        {
            if (count % 10 == 0)
            { // State Change
                if (state == 2)
                {
                    state = 0;
                    *(led_base + 0x0) = 0x0;
                    *(led_base + 0x1) = 0x0;
                    *(led_base + 0x2) = 0x0;
                }
                else
                {
                    state++;
                }
            }
            if (state == 0)
            { // Go State
                // Lower Led should be Green and others black
                 *(led_base + 0x0) = 0x0;
                 *(led_base + 0x1) = 0x0;
                 *(led_base + 0x2) = 0xFF << 8;
            }
            else if (state == 1)
            { // Get Ready State
                *(led_base + 0x0) = 0x0;
                *(led_base + 0x1) = 0xFF << 8 | 0xFF << 16;
                *(led_base + 0x2) = 0x0;
               
            }
            else
            {
                *(led_base + 0x0) = 0xFF << 16;
                *(led_base + 0x1) = 0x0;
                *(led_base + 0x2) = 0x0;
            }
            count++;
        }
        else
        {
            // all black
            *(led_base + 0x0) = 0x0;
            *(led_base + 0x1) = 0x0;
            *(led_base + 0x2) = 0x0;
        }
    }
}