#!/bin/bash

#Spell checks, compiles,displays word count, and views a .tex document

echo "What is the name of the file (without file extension): "
read file
ispell -t $file.tex
rm $file.aux $file.log $file.pdf $file.dvi $file.tex.bak
latex $file.tex
dvipdfm $file.dvi
rm $file.aux $file.log $file.dvi
./texcount.pl -total $file.tex
kpdf $file.pdf
