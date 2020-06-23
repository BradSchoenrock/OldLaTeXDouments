#!/bin/bash

rm *out*

for f in $(ls *Stats*)
do
    cat ${f} | tr -s " " | sed "s/ ELAPSED/$(echo ${f} | cut -d '_' -f 1) ELAPSED/g" | sed "s/ / \& /g" | sed 's/$/ \\\\/' | sed "s/^/\\\hline /g" | sed '1 i \\\begin{tabular}{|l|l|l|l|l|}' | sed '1 i \\\begin{table}[H]' | sed -e '$a\\\hline' | sed -e '$a\\\end{tabular}' | sed -e '$a\\\label{TABLE-SessionSize}' | sed "s/TABLE-SessionSize/TABLE-SessionSize-$(echo ${f} | cut -d '_' -f 1)/g" | sed -e '$a\\\end{table}' | sed "s/%/\\\%/g" | sed "s/& days &/days/g" | cat >> $(echo ${f}  | cut -d '.' -f 1)"_out.txt"

done

