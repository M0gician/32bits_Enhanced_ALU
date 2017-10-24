# EECS/CSE 31L Midterm Project — 32bits Enhanced ALU

## Usage
Download:
```
git clone https://github.com/M0gician/32bits_Enhanced_ALU
```
Then open the 32bits_Enhanced_ALU.xpr in Vivado :)

## ALU Description
| Op-Code | Micro-Operation | Description                     |
| --------|:---------------:| ------------------------------- |
| 0000    | A + B           | Addition                        | 
| 0001    | A + B + 1       | Subtraction                     |
| 0010    | A + 1           | Increment                       |
| 0011    | A - 1           | Decrement                       |
| 0100    | A               | Move                            |
| 0101    | shl             | 1-bit logical shift left of A   |
| 0110    | SIMD A + B      | Four 8-bits Add                 |
| 0111    | A & B           | Bitwise AND                     |
| 1000    | A \| B          | Bitwise OR                      |
| 1001    | A &oplus; B     | Bitwise XOR                     |
| 1010    | ¬A (A')         | Complement                      |
| 1010    | A + 1           | 2's Complement                  |

## Flags
* **Carry Flag**: Only in ADD operation is set when you have carry out on Left-most bit (MSB)
* **Overflow Flag**: Only in ADD or SUB operations is set when addition of two positive numbers results in negative number or vice-versa.
* **Sign Flag**: Only in ADD or SUB operations is set when the output is a negative number.
* **Zero Flag**: Is set when the output is zero.