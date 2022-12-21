#!/bin/bash

#jupyter nbconvert --to python centro.ipynb 
python3 centro.py

sed "s/,/,  /g;s/$/,/g" centros.txt > centros.csv
povray 3poli.pov && eog 3poli.png
echo "EXIT !"