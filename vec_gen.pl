#!/usr/local/bin/perl
$file1 = 'LAB3.vec';
open(OUT,">$file1");
$count=0;
print OUT "radix ";
while($count<=128)
{print OUT "1 ";
$count=$count+1;}
$count=0;
print OUT "\nio ";
while($count<=127)
{print OUT "i ";
$count=$count+1;}
$count=1;
print OUT "\nvname ";
while($count<=64)
{print OUT "A<$count> B<$count> ";
$count=$count+1;}
print OUT "C0\nslope 0.01\nvih 1.8\ntunit ns\n";
print OUT "0   ";    #$time=1;
$A="8000000000000000";
$B="4000000000000000";$C0=0;
&printAiBi;          #print 1st Ai Bi from time 0ns
print OUT "0\n";     #C0=0;
print OUT "4   ";    #print 2nd Ai Bi from time 4ns
$A="5555555555555555";
$B="AAAAAAAAAAAAAAAA";$C0=1;
&printAiBi;
print OUT "1\n";     #C0=1;
print OUT "8   ";    #print 3rd Ai Bi from time 8ns
$A="0000000000000005";
$B="000000000000000A";$C0=0;
&printAiBi;
print OUT "0\n";     #C0=0;
print OUT "12  ";    #print 4th Ai Bi from time 12ns
$A="0000000000000055";
$B="00000000000000AA";$C0=1;
&printAiBi;
print OUT "1\n";     #C0=1;
print OUT "16  ";    #print 5th Ai Bi from time 16ns
$A="0000000000000555";
$B="0000000000000AAA";$C0=0;
&printAiBi;
print OUT "0\n";     #C0=0;
print OUT "20  ";    #print 6th Ai Bi from time 20ns
$A="0000000000005555";
$B="000000000000AAAA";$C0=1;
&printAiBi;
print OUT "1\n";     #C0=1;
print OUT "24  ";    #print 7th Ai Bi from time 24ns
$A="0000000000055555";
$B="00000000000AAAAA";$C0=0;
&printAiBi;
print OUT "0\n";     #C0=0;
print OUT "28  ";    #print 8th Ai Bi from time 24ns
$A="0000000000555555";
$B="0000000000AAAAAA";$C0=1;
&printAiBi;
print OUT "1\n";     #C0=1;
print OUT "32  ";    #print 9th Ai Bi from time 24ns
$A="0000000005555555";
$B="000000000AAAAAAA";$C0=0;
&printAiBi;
print OUT "0\n";     #C0=0;
print OUT "36  ";    #print 10th Ai Bi from time 24ns
$A="0000000055555555";
$B="00000000AAAAAAAA";$C0=1;
&printAiBi;
print OUT "1\n";     #C0=1;

sub printAiBi
{
$Cout=0;
$Sum=hex($A)+hex($B)+$C0;
if($Sum>hex(FFFFFFFFFFFFFFFF))
{$Cout=1;}
$Sum=sprintf("%X", $Sum);
while(length($Sum)<16)
  {$Sum="0".$Sum;
  }
print"  $A + $C0\n +$B\n =$Sum.  Cout=$Cout\n  \n";
$A=sprintf( "%B", hex( $A));
 while(length($A)<64)
 {$A="0".$A;
 }
 @A=split(//,$A);
 $B=sprintf( "%B", hex( $B));
  while(length($B)<64)
  {$B="0".$B;
  }
  @B=split(//,$B);
  $count=64;
   while($count>=0)
   {print OUT "$A[$count] $B[$count] ";
   $count=$count-1;
   }
}
