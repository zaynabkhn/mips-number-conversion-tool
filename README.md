# MIPS Number Conversion Tool

A simple MIPS Assembly program that converts a user-input decimal number into its **binary** and **hexadecimal** representations and prints the results.

---

## Features

- Prompts the user to enter a decimal number.
- Outputs the 32-bit binary representation of the number.
- Outputs the 8-digit uppercase hexadecimal representation of the number.
- Demonstrates user input/output, bitwise operations, loops, and conditional logic in MIPS assembly.

---

## How to Run

1. Open the `number_conversion.asm` file in the [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/MARS/).
2. Assemble the program.
3. Run the program.
4. When prompted, enter a decimal number (e.g., `5`) and press Enter.
5. View the binary and hexadecimal representations printed in the console.

---

## Example Output

Enter a decimal number: 5
Binary: 00000000000000000000000000000101
Hexadecimal: 00000005

## Code Overview

- Uses `syscall` for I/O operations.
- Utilizes shift operations (`srlv`) to extract bits for conversion.
- Implements loops to iterate through each bit/nibble.
- Converts numeric values to ASCII characters for printing.

