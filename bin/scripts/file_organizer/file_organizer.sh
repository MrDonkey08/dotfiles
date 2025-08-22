#!/usr/bin/env bash

cd ~ || echo "Error: User Directory Not Found!" && return 1

cd Downloads || cd Descargas || echo "Error: Downloads Directory Not Found!" && exit

mkdir -p neo_files

mv "$(find . -maxdepth 1 -type f)" neo

cd neo_files || exit 1

## default folders
mkdir audio docs download images videos

executables = "./*.exe ./*.msi"

if ls $executables 1>/dev/null 2>&1; then
	mkdir installers
	mv $executables
fi

office_docs = "./*.doc ./*.docx ./*.xls ./*.xlsx ./*.ppt ./*.pptx ./*.pdf"

if ls $office_docs 1>/dev/null 2>&1; then
	mkdir docs
	mv office_docs docs/
fi



if ls $office_docs 1>/dev/null 2>&1; then
	mkdir docs
	mv office_docs docs/
fi







mv office_docs ./docs/

if ls ./*.zip ./*. ./*. ./*. ./*.
	mkdir

mkdir compress

mkdir code web

mv ./*.ai ./*.bmp ./*.eps ./*.gif ./*.gifv ./*.ico ./*.jng ./*.jp2 ./*.jpg ./*.jpeg ./*.jpx ./*.jxr ./*.pdf ./*.png ./*.psb ./*.psd ./images


