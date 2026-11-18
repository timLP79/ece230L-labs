# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

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
In this lab, we built two clock dividers using our flip-flop and full-adder modules. Three T flip-flops form a ripple counter that divides the input clock by 8. The modulo divider uses three full adders to increment a three-bit count, then returns the count to zero and toggles its output every six rising clock edges. This produces a divide-by-12 output. Both circuits use the center button as the clock and the upper button as reset. 

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
The output toggles once each time the counter completes its count. A full output cycle needs two toggles: one from low to high and another from high to low. Our counter toggles every six input clock cycles, so a full output cycle takes twelve input clock cycles. This divides the input frequency by 2 * 6 = 12.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
With the original connections, each flip-flop’s Q output clocks the next flip-flop. The first clock edge changes the first output from 0 to 1. That change triggers the second flip-flop, which then triggers the third. This is why all three outputs become 1.

In our code, we used ~Q[0] and ~Q[1] to clock the next stages. This makes those stages toggle when the previous Q output changes from 1 to 0. Our counter starts at 000 and goes to 001 on the first clock edge. It continues counting up to 111, then returns to 000. It still divides the input clock by 8.

### 3 - What width of ~~ring~~ counter would you use to get to an output of ~1KHz?
Using the 100 MHz board oscillator, each ripple-counter stage divides the frequency by two, so the output frequency is 100,000,000 / 2^N. Solving for 1,000 Hz gives N = log2(100,000) = about 16.61. We would use 17 stages, which gives about 763 Hz. A 16-stage counter gives about 1,526 Hz, so 17 stages is closer to 1 kHz. A ripple counter cannot produce exactly 1 kHz from 100 MHz because it only divides by powers of two.

