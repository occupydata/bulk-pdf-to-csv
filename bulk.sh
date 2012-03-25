#!/bin/bash
mkdir "bulk"
cd "bulk"
for y in {1995..2011}
do
  for q in {1..4}
  do
    wget "http://www.occ.treas.gov/topics/capital-markets/financial-markets/trading/derivatives/dq$q${y: -2}.pdf"
    pdftotext -layout dq$q${y: -2}.pdf
    ruby ../csv.rb dq$q${y: -2}.txt
  done
done
