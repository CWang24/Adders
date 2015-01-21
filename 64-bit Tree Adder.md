## Schematic for 64-bit tree adder.
Showing the schematic part by part.<br />
Note that the “black cell” and “gray cell” in different stages are different in sizing, so I simply show one of them here, so as buffer. 
#### Individual G P generating:


#### “Black Cell” (generating group G and group P)


#### “Gray Cell” (generating group G only)

#### Buffer (two inverters in serial)
 

#### Overall schematic


## Functional test waveforms and results
#### Input Setting
I wrote [vec_gen.pl](https://github.com/CWang24/Adders/blob/master/vec_gen.pl) to generate the input vector file [lab3.vec](https://github.com/CWang24/Adders/blob/master/lab3.vec) for simulation and display the information of add operations on screen.

#### Theoretical result
And it shows the 10 combinations and the theoretical sums on the screen.
```
  8000000000000000 + 0
 +4000000000000000
 =C000000000000000.  Cout=0

  5555555555555555 + 1
 +AAAAAAAAAAAAAAAA
 =FFFFFFFFFFFFFFFF.  Cout=0

  0000000000000005 + 0
 +000000000000000A
 =000000000000000F.  Cout=0

  0000000000000055 + 1
 +00000000000000AA
 =0000000000000100.  Cout=0

  0000000000000555 + 0
 +0000000000000AAA
 =0000000000000FFF.  Cout=0

  0000000000005555 + 1
 +000000000000AAAA
 =0000000000010000.  Cout=0

  0000000000055555 + 0
 +00000000000AAAAA
 =00000000000FFFFF.  Cout=0

  0000000000555555 + 1
 +0000000000AAAAAA
 =0000000001000000.  Cout=0

  0000000005555555 + 0
 +000000000AAAAAAA
 =000000000FFFFFFF.  Cout=0

  0000000055555555 + 1
 +00000000AAAAAAAA
 =0000000100000000.  Cout=0
```

(Note that the result of addition No.2 is obviously wrong, it should be 0000000000000000 with Cout=1 instead of FFFFFFFFFFFFFFFF with Cout=0. This is because the overflow of value $Sum in the program. Due to the limit of time, I don’t fix it here, please live with this bug~~). 

#### Waveforms

#### Results
I wrote [vec_gen.pl](https://github.com/CWang24/Adders/blob/master/vec_gen.pl) to translate the waveform data [lab3.csv](https://github.com/CWang24/Adders/blob/master/lab3.csv#L2) into hex values.<br />

Run this perl script with the lab3.cvs file, the screen will show:
```
The 16bits data we get is: 01100000000000000000000000000000000000000000000000000000000000000,
Convert to hex, we get sum of addition No.1 is: C000000000000000, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000000000000000000000000000000000000,
Convert to hex, we get sum of addition No.2 is: 0000000000000000, with Cout=1

The 16bits data we get is: 00000000000000000000000000000000000000000000000000000000000001111,
Convert to hex, we get sum of addition No.3 is: 000000000000000F, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000000000000000000000000000100000000,
Convert to hex, we get sum of addition No.4 is: 0000000000000100, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000000000000000000000000111111111111,
Convert to hex, we get sum of addition No.5 is: 0000000000000FFF, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000000000000000000010000000000000000,
Convert to hex, we get sum of addition No.6 is: 0000000000010000, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000000000000000011111111111111111111,
Convert to hex, we get sum of addition No.7 is: 00000000000FFFFF, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000000000001000000000000000000000000,
Convert to hex, we get sum of addition No.8 is: 0000000001000000, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000000001111111111111111111111111111,
Convert to hex, we get sum of addition No.9 is: 000000000FFFFFFF, with Cout=0

The 16bits data we get is: 00000000000000000000000000000000100000000000000000000000000000000,
Convert to hex, we get sum of addition No.10 is: 0000000100000000, with Cout=0

After comparison, we confirm that all the 10 results are correct.
```
## Worst case
Referring to the general structure of the tree adder, we could find that the longest delay path is when all Gi are 0. Hence we have to propagate C0 from the start to the end, passing 5 black cells and 1 gray cell in total.

g_NAND2=6/5,p_NAND2=2.

G=(6/5)^14

H=1000

B=392/6

F=GHB, ρ=logF/log3.59=10.5. 

The optimal stage No. is already less than what I have now, so I stay with the present stage No. without adding buffer in the path to save P.

f_opt=F^(1/19)=2.0501. Using this f_opt and the output load, input Cg, sizing of every stage can be calculated.

Hence I designed in the second addition that A=5555555555555555, B=AAAAAAAAAAAAAAAA and C0=1, so that all Pi=1, and all Gi=0.
As with the end of the path, in the waveform of addition No.2, we found that S64 changes later than Cout.
And the worst case delay is 2.901ns
