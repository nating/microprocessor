# microprocessor
A Microcoded Instruction Set Processor written in VHDL.

<img src="https://github.com/nating/microprocessor/blob/master/Images/Full-Processor-Schematic.png" width="600">

## Introduction
This project is a many VHDL components put together to make a microcoded instruction set processor in which programs can be written to memory for the processor to run.

## Design
This microprocessor runs programs made up of instructions in memory.

### Instructions
This microprocessor's instruction set includes the following operations:

Abbreviation    | Instruction
----------------|---------------------------------------------------------------------------------------------
**ADI**         |  Add immediate constant
**LD**          |   Load to value from memory
**ST**          |   Store a value in memory
**INC**         |   Increment
**NOT**         |   NOT
**ADD**         |   Add
**LDR**         |   Load into immediate register (the same as points to memory)
**SR**          |   Shift Right
**BEQ**         |   Branch if equal
**BNZ**         |   Branch if not zero

Each of these instructions has one or more _micro-operations_ in _Control Memory_ to be to tell the components of the processor what to do when the instructions are being performed.  
  LDR and SR make use of the _temporary register_, Register 8. And take more than one micro-operation to execute. These, as well as the branching operations can take more than one clock-cycle to be performed.  
  
An instruction in memory is 16 bits long and is laid out in the format:

Opcode    | Destination Register | Source Register A | Source Register B
----------|----------------------|-------------------|--------------------------------------------------
 7 bits   | 3 bits               | 3 bits            | 3 bits

The _opcode_ of an instruction is the address in Control Memory of the first micro-operation for that instruction. The opcode is put into the _Control Address Register_, which indexes the micro-operation. The registers (DR,SA & SB) specified in the instruction are 3 bits each and index the _Register File_. There are 8 registers in the Register File. Registers 0 through 7 can be specified as the source or destination registers for instructions, whereas register 8 is used for certain less straight forward instructions that need the use of another.

Instructions make use of many different components in the processor. Signals are sent to these components to tell them how to behave for the currently executing instruction. These signals come from the current micro-operation in control memory for that instruction.

For example, an ADD instruction indexes the ADD micro-operation in control memory. The ADD micro-operation tells the _functional unit_ to output the result of adding the two source registers together and tells the _register file_ to write the result into the desination register.

Once the processor is started up, the _Program Counter_ points to the first address in memory. This is the first instruction of our program.  
  To demonstrate the capabilities of the processor, the memory holds a trivial program that performs all of the instructions in the instruction set. 
  
Here is a screenshot of the code for memory. Each memory location holds an instruction of the Trivial Program. The comments show the index in memory, the assembly code, the pseudo code and the instruction in bits:
  
<img src="https://github.com/nating/microprocessor/blob/master/Images/Trivial-Program.png">  

### Control Memory
Control memory has all of the micro-operations for each instruction. Micro-operations are more complicated than their corresponding instructions. Micro-operations are 20 bits long. They have 16 different fields:

Next Address| MS	 | MC  | IL  | PI  | PL  | TD  | TA  | TB  | MB  | FS   | MD  | RW  | MM  | MW
------------|------|-----|-----|-----|-----|-----|-----|-----|-----|------|-----|-----|-----|---------------
8 bits      |3 bits|1 bit|1 bit|1 bit|1 bit|1 bit|1 bit|1 bit|1 bit|5 bits|1 bit|1 bit|1 bit|1 bit  

Each of these fields represent signals sent out to different components in the processor when executing the micro-operation.
* **Next Address**: The address of the next micro-operation in control memory (Usually _Instruction Fetch_).
* **Mux S select**: Used for changing the condition for the CAR to be incremented rather than loaded with the _Next Address_. This is used for micro-operations with multiple operations.
* **Mux C select**: Signalling whether the CAR should be loaded with the next instructions opcode on the next clock tick.
* **Instruction Load**: Signals that the Instruction Register should load the next instruction on the next clock tick.
* **Program Counter Increment**: Signals that the program counter's value should increase by one.
* **Program Counter Load**: Signals that the program counter should load a value from memory

### Testing
There are testbenches for each component to make sure larger components were built with strong foundations of smaller components that worked for every edge case.  
  The main testbench for the processor itself just has a clock and a reset signal. The reset signal clears all the registers and sets the CAR and Program Counter to zero. Once these are initialised, the processor runs itself through the instructions that have been hardcoded in memory for the trivial program.  
  To see careful stepping through of each instruction/micro-operation for the program in the testbench, please see the <a href="https://github.com/nating/microprocessor/blob/master/ProgramDemonstration.pages">Program Demonstration<a>.
