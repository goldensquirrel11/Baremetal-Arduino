#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // Setup
    DDRB = DDRB | (1 << DDB5);          // Define LED_BUILTIN (DDB5) as output

    // Loop
    while(1) {
        PORTB = PORTB | (1 << PORTB5);  // turn PORTB5 ON
        _delay_ms(1000);                // wait for a second
        PORTB = PORTB & ~(1 << PORTB5); // turn PORTB5 OFF
        _delay_ms(1000);                // wait for a second
    }
}