#!/usr/local/bin/perl

$file = 'lab3.csv';
open(CURVE,$file)||die"$!";
@data_lines=<CURVE>;
close(CURVE);
#print @data_lines;
$count=0;
foreach $data_line (@data_lines)
{
 chomp $data_line;
 if ($data_line=~/S/)
 {@value_name=split(/,/,$data_line);} #get the time from the first line
 else
 {
 @data_line_elements=split(/,/,$data_line);
 @data_get=0; #use this to store the 64bits, for future convertion to HEX
 $countt=1;
 while ($countt<=127)
 {
  if ($data_line_elements[$countt]>0.9)      #so it's logic high
  { push @data_get,'1';
  }
  else
  { push @data_get,'0';
  }
 $countt=$countt+2;
 }
$real_data=join('',@data_get);   #converte @ to $, for the convenience of binary to hex convertion
print "The 16bits data we get is: $real_data, \n";
$real_data=sprintf("%X", oct( "0b$real_data"));      #go on converte it to hex for the convenience of comparing
}
while(length($real_data)<16)
{$real_data="0".$real_data;}
if($data_line_elements[129]>0.9)
{$Cout=1;}
else
{$Cout=0;}
if($count>0)
{print "Convert to hex, we get sum of addition No.$count is: $real_data, with Cout=$Cout\n  \n";}
$count=$count+1;
}
