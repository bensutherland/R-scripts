#!/bin/bash
# method to split Imagene output files that are saved as multiple blocks per file
# currently runs on Imagene v8.0

# run the script from the folder containing the data

ls -1 *.txt | 
     perl -pe 's/\.txt//' |
     sort -u |
     while read i
     do
         echo "$i".txt
         grep -E 'ControlType|Block1' $i.txt > "$i"Block1.txt
         grep -E 'ControlType|Block2' $i.txt > "$i"Block2.txt
         grep -E 'ControlType|Block3' $i.txt > "$i"Block3.txt
         grep -E 'ControlType|Block4' $i.txt > "$i"Block4.txt
     done

