# CS240_SI_Materials
Repository containing program files corresponding to topics taught in CSUF's CS 240, Computer Organization and Assembly Language, class.
(Note: These files only function in the Linux/Ubuntu x86_64 YASM Environment)

## How to compile the assembly files:
- yasm -g dwarf2 -f elf64 (asm_file_name).asm -l (asm_file_name).lst
- ld -g -o (asm_file_name) (asm_file_name).o

### Note: If a file does not print an output, it is highly advised to run your program on DDD debugger
- Install using: sudo apt-get install ddd
- Start the program using: ddd (program_file_name)

### If a file does have print output:
- Use: ./(program_file_name)

### Course Textbook:
x86-64 Assembly Language Programming with Ubuntu: http://www.egr.unlv.edu/~ed/assembly64.pdf
