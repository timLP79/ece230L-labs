# Number Theory: Subtraction

In this lab you've learned the basics of number theory as it relates to subtraction.

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
In this lab, we built on the adder circuits from the previous lab to explore binary subtraction and the
representation of negative numbers. Using the supplied truth table, we implemented a half subtractor
with the difference and borrow outputs. It uses the XOR just as the half adder does, however the half subtractor
produces a borrow when A is 0 and B is 1.

Following the slides from the lab, we reused the full adder module to build a four-bit one's complement adder. The first
stage adds the two inputs, and the second stage adds the carry from the most significant bit. This handles the end-around
carry without creating a combinational loop.

We also built an eight-bit two's complement converter by inverting every input bit and adding one as we've learned in class.
This connects to the course material showing how subtraction can be performed by adding a number's two's complement. Then finally
we connected all three modules in top.v using the switch and led mappings.
## Lab Questions
### 1 - Explain the differences between our Half Adder from last lab and the Half Subtractor from this lab.
The half adder from our previous lab adds two one-bit inputs, while the half subtractor computes A - B. Both
circuits use XOR for the result, so their Y outputs are the same equation of Y = A ^ B.
  
The difference is the carry and the borrow outputs. The half adder uses Carry = A & B, which produces a carry when
both inputs are 1 because 1 + 1 equals binary 10. The half subtractor uses Borrow = (~A) & B, which produces a
borrow when A is 0 and B is 1. In this case, the current column needs to borrow from the next higher bit position to
complete the subtraction.
### 2 - What about the end around carry of One’s Complement makes it hard to use and implement?
One's complement addition requires any carry out of the most significant bit to be added back into the least significant 
bit. So there is a complication added because the carry must propagate through the first addition before the correction can 
occur. Adding that carry back can also produce more carries that must ripple through the result.
  
Connecting the final carry directly back to the same adder's carry input creates a combinational loop, where the output 
depends on itself. We avoided this by using two stages of full adders: one to add A and B, and then another to add the end-around 
carry. This requires additional logic which introduces some latency.
### 3 - What is the edge case and problem with Two’s Complement number representation?
The edge case in two's complement is the most negative number, because it has no positive counterpart within the same signed bit width. 
For an eight-bit signed number, the range is -128 to +127.
  
In our eight-bit converter, -128 is represented as 10000000. Inverting the bits gives 01111111, and adding one produces 10000000 
again. The result still represents -128 because +128 cannot fit in eight-bit signed two's complement. This causes signed overflow when we 
try to negate -128. We would need at least nine bits to represent +128 as a signed value.
