# Lab 05 - Combinatorial Logic

In this lab, you’ve learned real world applications of digital logic, as well
as how to assemble your own Verilog modules. In addition, you’ve learned how
the constraints file maps your inputs and outputs to real pins on the FPGA.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Mika Calderon and Tim Palacios

## Lab Summary
In this lab Mika and I learned about how to create combination logic circuits from truth tables and then implement the Boolean equations derived from the SOP and POS processes. We created two separate modules, Circuit A and Circuit B, and then we coconnected them together using a top-level module. The output of circuit A was connected to an input of circuit B, which showed how you can connect two verilog modules together to create a larger circuit. We also learned how the constraints file connects the inputs and the output in the Verilog design to the switches and led's on the Basys 3 board. 

## Lab Questions

### 1 - Explain the role of the Top Level file.
The Top Level file acts as a main connection point for the design. It creates instances of the individual Verilog modules and defines how their inputs and outputs are connected together. In the lab top.v connects Circuit A to the switches and LED 0, then it uses the output of Circuit A as input A for Circuit B. It also connects the remaining Circuit B inputs to switches and sens its output to LED 1. So what it is doing is comgining smaller modules into one complete circuit that can be mapped oonto the board.
### 2 - Explain the function of the Constraints file.

### 3 - Was the selection of Minterm and Maxterm correct for each circuit? What would you have chosen?

