.data
    prompt:     .asciiz "Enter a decimal number: "
    newline:    .asciiz "\n"
    binaryMsg:  .asciiz "Binary: "
    hexMsg:     .asciiz "Hexadecimal: "

.text
.globl main

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t0, $v0          # Store input number in $t0

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Print "Binary: "
    li $v0, 4
    la $a0, binaryMsg
    syscall

    # Convert and print binary
    move $t1, $t0          # Copy number to $t1 for binary conversion
    li $t2, 31             # bit position counter (start from highest bit)

print_binary_loop:
    # Extract bit (t1 >> t2) & 1
    srlv $t3, $t1, $t2
    andi $t3, $t3, 1

    # Print bit as ASCII '0' or '1'
    addi $t3, $t3, 48      # convert 0/1 to '0'/'1'
    li $v0, 11             # print_char
    move $a0, $t3
    syscall

    addi $t2, $t2, -1
    bgez $t2, print_binary_loop

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Print "Hexadecimal: "
    li $v0, 4
    la $a0, hexMsg
    syscall

    # Convert and print hexadecimal
    move $t1, $t0          # Copy number to $t1 for hex conversion
    li $t2, 8              # hex digit count (32 bits / 4 bits per hex digit)

print_hex_loop:
    # Calculate bit offset = (t2 - 1) * 4
    addi $t4, $t2, -1
    sll $t4, $t4, 2        # multiply by 4 (shift left by 2 bits - immediate is allowed)

    srlv $t3, $t1, $t4     # shift right logical variable by $t4 bits
    andi $t3, $t3, 0xF     # mask lower 4 bits (one hex digit)

    # Convert to ASCII hex digit
    blt $t3, 10, print_hex_digit
    addi $t3, $t3, 55      # For A-F (65 - 10 = 55)
    j print_hex_char

print_hex_digit:
    addi $t3, $t3, 48      # For 0-9 digits

print_hex_char:
    li $v0, 11
    move $a0, $t3
    syscall

    addi $t2, $t2, -1
    bgtz $t2, print_hex_loop

    # Print newline and exit
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10             # exit
    syscall
