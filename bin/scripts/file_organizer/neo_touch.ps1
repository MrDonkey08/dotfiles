$neoFolder = "neo_files"

# Prompt for folder name and use default if empty
$inputFolder = Read-Host "Input the name of the folder where the files will be moved and organized (default: 'neo_files')"
if (![string]::IsNullOrWhiteSpace($inputFolder)) {
    $neoFolder = $inputFolder
}

# Create the directory if it doesn't exist
if (-not (Test-Path $neoFolder)) {
    New-Item -ItemType Directory -Path $neoFolder
}

# Move all files to the neo_folder
Get-ChildItem -File | Move-Item -Destination $neoFolder

# Change to the neo_folder
Set-Location -Path $neoFolder

# Define file patterns and corresponding folder names
$filePatterns = @{
    "bin_docs" = "*.doc, *.docx, *.odt, *.ods, *.odp, *.ppt, *.pptx, *.rtf, *.xls, *.xlsx"
    "text_plain_docs" = "*.csv, *.dbf, *.dif, *.psv, *.slk, *.tsv"
    "images" = "*.ai, *.bmp, *.cr2, *.dng, *.eps, *.gif, *.gifv, *.ico, *.jng, *.jp2, *.jpg, *.jpeg, *.jpx, *.jxr, *.nef, *.png, *.psb, *.psd, *.raw, *.svg, *.tif, *.tiff, *.webp"
    "linux_programs" = "*.appimage, *.deb, *.rpm"
    "mac_programs" = "*.dmg, *.pkg"
    "windows_programs" = "*.exe, *.msi"
    "videos" = "*.3gpp, *.avi, *.fla, *.flv, *.m4v, *.mkv, *.mng, *.mov, *.mp4, *.mpeg, *.mpg, *.mts, *.m2ts, *.ogv, *.rm, *.rmvb, *.swf, *.vob, *.webm"
    "web_files" = "*.asp, *.aspx, *.css, *.erb, *.flow, *.hbs, *.htm, *.html, *.js, *.jsx, *.less, *.mjs, *.php, *.prisma, *.sass, *.scss, *.ts, *.tsx, *.vue, *.xml, *.xhtml"
    "reading_files" = "*.azw, *.cb, *.cbz, *.cbr, *.djvu, *.epub, *.pdf, *.mobi"
    "linux_scripts" = "*.bash, *.dash, *.csh, *.fish, *.ksh, *.sh, *.tsh, *.zsh"
    "windows_scripts" = "*.bat, *.cmd, *.ps, *.ps1"
    "config_files" = "*.cfg, *.cjs, *.cnf, *.conf, *.config, *.editorconfig, *.env, *.ini, *.json, *.makefile, *.mk, *.properties, *rc, *.reg, *.toml, *.yaml, *.yml, *.xml, *.yarn.lock, package_lock.json"
    "markup" = "*.adoc, *.asciidoc, *.ipynb, *.jmd, *.kramdown, *.markdown, *.md, *.mdwn, *.mdown, *.mediawiki, *.mkd, *.mkdn, *.mdtxt, *.mdtext, *.rst, *.tex, *.txt, *.wiki"
    "database" = "*.cql, *.db, *.db3, *.hql, *.mdb, *.psql, *.pls, *.sql, *.sqlite, *.sqlite3, *.tsql"
    "hadware_scripts" = "*.pdsprj, *.prolog, *.sv, *.v, *.vh, *.vhdl"
    "assembly" = "*.asm, *.s, *.nasm"
    "compiled_scripts" = "*.c, *.cs, *.cc, *.cpp, *.cxx, *.cls, *.go, *.h, *.hpp, *.java, *.kt, *.kts, *.m, *.mm, *.trigger, *.r, *.rs"
    "interprated_scripts" = "*.awk, *.clj, *.cljs, *.coffee, *.cr, *.erl, *.el, *.groovy, *.hrl, *.jl, *.lua, *.pl, *.py, *.rb, *.rkt, *.scm, *.styl, *.tag, *.tcl"
}

foreach ($key in $filePatterns.Keys) {
    $pattern = $filePatterns[$key]
    $files = Get-ChildItem -File -Include $pattern -Recurse

    if ($files.Count -gt 0) {
        if (-not (Test-Path $key)) {
            New-Item -ItemType Directory -Path $key
        }

        foreach ($file in $files) {
            Move-Item -Path $file.FullName -Destination $key
        }
    }
}

# Change back to the original directory
Set-Location -Path ..

