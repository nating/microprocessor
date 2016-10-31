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
Control memory is 256x28 bits. It has all of the micro-operations for each instruction. Micro-operations are more complicated than their corresponding instructions. Micro-operations are 28 bits long. They have 16 different fields:

Next Address| MS	 | MC  | IL  | PI  | PL  | TD  | TA  | TB  | MB  | FS   | MD  | RW  | MM  | MW
------------|------|-----|-----|-----|-----|-----|-----|-----|-----|------|-----|-----|-----|---------------
8 bits      |3 bits|1 bit|1 bit|1 bit|1 bit|1 bit|1 bit|1 bit|1 bit|5 bits|1 bit|1 bit|1 bit|1 bit  

Each of these fields represent signals sent out to different components in the processor when executing the micro-operation.
* **Next Address**: The address of the next micro-operation in control memory (Usually _Instruction Fetch_).
* **Mux S select**: Used for changing the condition for the CAR to be incremented rather than loaded with the _Next Address_. This is used for micro-operations with multiple operations.
* **Mux C select**: Signalling whether the CAR should be loaded with the next instructions opcode on the next clock tick.
* **Instruction Load**: Signals that the Instruction Register should load the next instruction on the next clock tick.
* **Program counter Increment**: Signals that the program counter's value should increase by one.
* **Program counter Load**: Signals that the program counter should be offset by the immediate value in the source registers.
* **Temporary Destination**: Signals that the destination register for the micro-operation should be register 8.
* **Temporary source A/B**: Signals that the source register A/B for the micro-operation should be register 8.
* **Mux B select**: Signals that the immediate value in Source Register B should be used as input to the functional unit instead of the value from the register file.
* **Function Select**: Selects which function should be performed by the functional unit.
* **Mux D select**: Selects that a the memory's output should be placed in the destination register rather than the output of the functional unit.
* **Read/Write**: Signals that the input value for the register file should overwrite the value in the destination register.
* **Mux M select**: Signals that the program counter should index memory instead of the value in source register A.
* **Memory Write**: Signals that the input value to memory should overwrite the indexed memory address' value.

Each micro-operation for the instruction set has its own values for these fields to make sure that the components around the processor behave in the correct manner. The value for each micro-operation is described in this Screenshot of a comment at the top of the code for Control Memory:

<img src="https://github.com/nating/microprocessor/blob/master/Images/Micro-operations.png">

### Components
There are 29 components that make up the microcoded processor. Here are some details of the more important/larger components, that we have not yet discussed:

#### Microprogrammed Control
The _Microprogrammed control_ takes care of the signalling that gets sent around the processor. It is really just for grouping similar components together to make the running of the processor more simple to understand. The components in the microprogrammed control are the CAR, the PC, control memory and the IR.

#### Datapath
The _Datapath_ groups together components that deal with the registers and the manipulation of the values in them. The register file and the functional unit are members of the datapath.

#### Zero fill
The zero fill is a component in the datapath that is used to extend the bits in source register B so that it's 3 bits can become an equivalent 8 bit value to be used as an immediate value in the Functional unit.

#### Control Address Register
The _CAR_ indexes control memory so that the right micro-operation is active. On a clock tick, if the condition specified is met then a signal comes from MUX S indicating that the CAR's value should increment by one. If there is no signal from MUX S, then the value from MUX C is loaded into the CAR. The value in MUX C will be the _next address_ of the current micro-operation or the opcode of the next instruction from the Instruction Register.

#### Instruction Register
The _IR_ holds the current instruction and sends signals out to the CAR and the Register file specifying an operation and registers for the instruction. On a clock tick, its value will be overwritten by the output of memory if the _Instruction Load_ signal is set.

#### Program Counter
The _PC_ holds the index in memory of the current instruction in the program. When the _Mux M select_ signal is set, memory outputs the value at this index. If _Program counter Increment_ is set on a clock tick, the index increases by one. If _Program counter Load_ is set, then the value from _Extend_ is added to the index. Extend holds a 6 bit value that is made up of the 3 bits from source register A and the 3 bits from source register B. This is how branching occurs, and the offset can be negative or positive. The program counter can only branch to instructions 2<sup>5</sup> places up or down from its current position in memory.

#### Register File
The register file has 8 registers. It outputs two 16bit values, which come from registers indexed by the _source register A_ signal and _source register B_ signal. If the _temporary source A/B_ signals are set, then the value in register 8 is output instead of the values in the register indexed by the _source register A/B_ signals. There is a 16bit input signal to the register file. This signal overwrites the value in a register if the _Read/Write_ signal is set. The register overwritten is indexed by the _destination register_ signal, or register 8 if the _temporary destination_ signal is set.

#### Functional unit
The functional unit does the manipulation of values in registers. It houses the Arithmetic Logic Unit and a Barrel shifter. Two 16 bit values are input to the functional unit, and it outputs one 16 bit result value. The functional unit also outputs four condition signals that are set depending on the calculation that was performed. Depending on the _function select_ signal, a certain operation is performed in the ALU or barrel shifter and then output as the result.  
  The barrel shifter component, is not used as a barrel shifter but rather shifts are calculated in multiple micro-operations as I felt this was more complex and demonstrated a better understanding of the flow of the data in the processor when I was working on this project. So signals sent to the barrel shifter only ever get it to shift one to the right on any given clock cycle. I decided to implement this single bit shifting with a barrel shifter to also demonstrate my understanding of more complex components.
  
#### Arithmetic Logic Unit
The ALU takes care of logical operations with the Logical Circuit and care of the arithmetic operations with the Arithmetic Circuit. The logic circuit takes the _function select_ signal and outputs the input having performed whatever logical operation was specified on it. The Arithmetic Circuit has a carry-lookahead-adder that can implement with the help of clever _'b_to_y'_ logic whatever arithmetic function is specified be the _function select_ signal. The _function select_ signal will specify which of these components' outputs are used as the output for the ALU.

#### Multiplexers and Decoders
There are many different _"MUX"s_ and decoders used throughout the processor as well. The most important are MUX B, C, D, M & S which we have mentioned when discussing the fields in the micro-operations.

## Testing
There are testbenches for each component to make sure larger components were built with strong foundations of smaller components that worked for every edge case.  
  The main testbench for the processor itself just has a clock and a reset signal. The reset signal clears all the registers and sets the CAR and Program Counter to zero. Once these are initialised, the processor runs itself through the instructions that have been hardcoded in memory for the trivial program.  
  To see careful stepping through of each instruction/micro-operation for the program in the testbench, please see the <a href="https://github.com/nating/microprocessor/blob/master/ProgramDemonstration.pages">Program Demonstration<a>.
