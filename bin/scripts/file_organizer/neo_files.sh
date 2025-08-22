#!/usr/bin/env bash

neo_folder="neo_files"

read -rp "Input the name of the folder where the files will be moved and organized (default: 'neo_files'): " input_folder

# Use default value if input is empty
neo_folder="${input_folder:-$neo_folder}"

# Create the folder if it doesn't exist
if [ ! -d "$neo_folder" ]; then
	mkdir "$neo_folder"
fi

# Move all files to the neo_folder
find . -maxdepth 1 -type f -exec mv -t "$neo_folder" {} +

# Change to the neo_folder
cd "$neo_folder" || exit 1

# Enable extended globbing
shopt -s extglob

declare -A files

files[bin_docs]="*.doc *.docx *.odt *.ods *.odp *.ppt *.pptx *.rtf *.xls *.xlsx"
files[text_plain_docs]="*.csv *.dbf *.dif *.psv *.slk *.tsv"
files[images]="*.ai *.bmp *.cr2 *.dng *.eps *.gif *.gifv *.ico *.jng *.jp2 *.jpg *.jpeg *.jpx *.jxr *.nef *.png *.psb *.psd *.raw *.svg *.tif *.tiff *.webp"
files[linux_programs]="*.appimage *.deb *.rpm"
files[mac_programs]="*.dmg *.pkg"
files[windows_programs]="*.exe *.msi"
files[videos]="*.3gpp *.avi *.fla *.flv *.m4v *.mkv *.mng *.mov *.mp4 *.mpeg *.mpg *.mts *.m2ts *.ogv *.rm *.rmvb *.swf *.vob *.webm"
files[web_files]="*.asp *.aspx *.css *.erb *.flow *.hbs *.htm *.html *.js *.jsx *.less *.mjs *.php *.prisma *.sass *.scss *.ts *.tsx *.vue *.xml *.xhtml"
files[reading_files]="*.azw *.cb *.cbz *.cbr *.djvu *.epub *.pdf *.mobi"
files[linux_scripts]="*.bash *.dash *.csh *.fish *.ksh *.sh *.tsh *.zsh"
files[windows_scripts]="*.bat *.cmd *.ps *.ps1"
files[config_files]="*.cfg *.cjs *.cnf *.conf *.config *.editorconfig *.env *.ini *.json *.makefile *.mk *.properties *rc *.reg *.toml *.yaml *.yml *.xml *.yarn.lock package_lock.json"
files[markup]="*.adoc *.asciidoc *.ipynb *.jmd *.kramdown *.markdown *.md *.mdwn *.mdown *.mediawiki *.mkd *.mkdn *.mdtxt *.mdtext *.rst *.tex *.txt *.wiki"
files[database]="*.cql *.db *.db3 *.hql *.mdb *.psql *.pls *.sql *.sqlite *.sqlite3 *.tsql"
files[hadware_scripts]="*.pdsprj *.prolog *.sv *.v *.vh *.vhdl"
files[assembly]="*.asm *.s *.nasm"
files[compiled_scripts]="*.c *.cs *.cc *.cpp *.cxx *.cls *.go *.h *.hpp *.java *.kt *.kts *.m *.mm *.trigger *.r *.rs"
files[interprated_scripts]="*.awk *.clj *.cljs *.coffee *.cr *.erl *.el *.groovy *.hrl *.jl *.lua *.pl *.py *.rb *.rkt *.scm *.styl *.tag *.tcl"

for key in "${!files[@]}"; do
	# Create directory if it does not exist
	if [ ! -d "$key" ]; then
		mkdir "$key"
	fi

	# Move files based on patterns
	for pattern in ${files[$key]}; do
		if compgen -G "$pattern" > /dev/null; then
			mv "$pattern" "$key/"
		fi
	done
done

# Disable extended globbing
shopt -u extglob

cd ..

echo "Files organized in $neo_folder succesfuly"
