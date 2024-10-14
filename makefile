blink:
	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o blink.o src/blink.c					# Compile & assemble into object code

	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -S -o blink.asm src/blink.c 				# Compile into assembly code to easily
																								# analyse number of CPU instructions
	
	avr-gcc -o blink.bin blink.o																# Convert object code into executable (*.bin), ready to upload to MCU
	
	avr-objcopy -O ihex -R .eeprom blink.bin blink.hex											# Convert binary into Intel hex format
	
	sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyUSB0 -b 115200 -U flash:w:blink.hex	# Flash Intel hex formatted file
																								# onto Arduino Uno