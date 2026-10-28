# Multiplexers and Demultiplexers

In this lab you have learned about multiplexers and demultiplexers.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Mika Calderon, Tim Palacios

## Summary
In this lab, we learned how to implement multiplexers and demultiplexers in 
Verilog. In our scenario, we wanted one of four different users to be selected 
and then sent into one of four businesses. When we chained the mux and demux, 
the input was one of four users, who could then choose one of four businesses 
to connect to. We used the 4 buttons on the Basys3 board to be our mux and demux 
selectors. By checking the selectors, we could see which of the outputs the user 
wanted to connect to.

## Lab Questions

### In plain English describe the function and use of a multiplexer.
A multiplexer is a many-to-one, which means that one of several inputs is sent 
into a single output. For this specific lab, it was used to route one of multiple 
users to the local library.

### In plain English describe the function and use of a demultiplexer.
A demultiplexer is a one-to-many, which takes one input line and routes it to one 
of many outputs. In this lab's scenario, it was used to route users into one of 
four different businesses. 

### What other uses might these circuits have? (Think Shannon’s)
Another use multiplexers and demultiplexers can have is dividing a logic function 
into sub-functions. A variable determines which sub-function is currently in use, 
depending on whether the variable is 0 or 1.