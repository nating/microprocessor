# microprocessor
A Microcoded Instruction Set Processor written in VHDL.

<img src="https://github.com/nating/microprocessor/blob/master/Images/Full-Processor-Schematic.png" width="600">

## Introduction
This project is a many VHDL components put together to make a microcoded instruction set processor in which programs can be written to memory for the processor to run.

## Design
This microprocessor runs programs made up of instructions in memory.



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
  
An instruction in memory has:

Opcode    | Destination Register | Source Register A | Source Register B
----------|----------------------|-------------------|--------------------------------------------------
 7 bits   | 3 bits               | 3 bits            | 3 bits

The _opcode_ of an instruction is the address in Control Memory of the first micro-operation for that instruction. The opcode is put into the _Control Address Register_, which indexes the micro-operation. The opcode is 7 bits long. The registers (DR,SA & SB) specified in the instruction are 3 bits each and index the _Register File_. There are 8 registers in the Register File. Registers 0 through 7 can be specified as the source or destination registers for instructions, whereas register 8 is used for certain less straight forward instructions that need the use of another.

Once the processor is started up, the _Program Counter_ points to the first address in memory. This is the first instruction of our program.  
  To demonstrate the capabilities of the processor, the memory holds a trivial program that performs all of the instructions in the instruction set. 
  
