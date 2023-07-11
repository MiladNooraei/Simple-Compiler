
# Simple Compiler

Implemented  a simple Compiler which reads a text file containing a math equation as input and gives three  address code as output
## Description
In this project we have a text file containing a math equation with four symbols : 
- :A: 
for adding (+)
- :S:
for subtracting(-)
- :M:
for multiplying(*)
- :D:
for dividing(/)

And we want to generate three address code. Only Three phases of lexical analysis, syntax analysis, intermediate code generation are implemented.
The priority of the operators is as usual, but their participation is the opposite.
For each operator, the calculation of operands is reversed.

Here are some input and output examples:

```bash
Input -> x = 3 :D: 4:S: 12
Output ->

t1 = 4/3;
x = 12-t1;
```
```bash
Input -> x = 3 :D: (4:S: 12)
Output -> 

t1 = 12-4;
x = t1/3;
```
```bash
Input -> x = 36 :M: test :D: ps :A:123
Output -> 

t1 = ps/test;
t2 = t1*36;
x = 123+t2;
```
