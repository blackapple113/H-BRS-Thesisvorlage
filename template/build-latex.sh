#!/bin/sh

file=Document.tex

# check if there is an argument
if [ -n "$1" ]; then
    file=$1
fi

echo Compiling "$file"
# compile latex files
latexmk -pdf -interaction=nonstopmode -file-line-error -outdir=./out/ -shell-escape "$file"

chown -R latex:latex out

# copy compiled file in main repository for convenience
cp -f ./out/"${file%.*}".pdf .