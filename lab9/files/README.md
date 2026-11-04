# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Mika Calderon and Tim Palacios
## Summary
In this lab, we implemented a D latch and used it to build a four-byte memory system. A D latch follows its data input while enable is high and holds its previous value when enable is low. We combined eight D latches to store one byte, then connected four byte modules to store 32 bits total. Arrays organized the signals, and generate loops created the repeated latch instances. Demultiplexers routed the data and store signal to the selected byte, while a multiplexor selected the store byte to display.
## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
Directly connecting gates in a feedback loop can describe a latch, but the lab explains that Vivado flags this implementation as a combinatorial loop when targeting the Basys 3. Behavioral Verilog lets us describe the storage behavior so Vivado can infer the appropriate latch hardware.
### What is the meaning of always @(*) in a sensitivity block?
The * creates an implicit sensitivity list containing the signals read by the block. The block runs whenever one of those signals changes, without requiring us to list each signal manually. For example, our demultiplexor responds to changes in the address, input data, or store signal.
### What importance is memory to digital circuits?
Memory allows digital circuits to retain information and use it later. Without memory, a combinational circuit's output depends only on its current inputs. With memory, a sequential circuit can also depend on its previous state. This makes registers, counters, state machines, and computer data storage possible. In our four-byte memory system, each byte retains its stored value while its enable is low. We can select an address and read its stored value even after the data switches have changed.
