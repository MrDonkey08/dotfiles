# Set code colors
function man() {
	env \
		MANWIDTH="$(tput cols)" \
		LESS_TERMCAP_mb=$'\e[01;31m' \
		LESS_TERMCAP_md=$'\e[01;31m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[01;44;33m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[01;32m' \
		man "$@"
}

# Secure file deletion
function rmk() {
	local file="$1"
	if [[ -f "$file" ]]; then
		scrub -p dod "$file"
		shred -zun 10 -v "$file"
	else
		echo "File not found: $file"
	fi
}

# Image conversion
function img_convert() {
	if [[ $# -lt 3 ]]; then
		echo "Usage: img_convert <images> <output_extension> <quality>"
		return 1
	fi

	local imgs=("${@:1:$#-2}")
	local out_ext=("${@: -2:1}")
	local quality=("${@: -1}")

	for img in "${imgs[@]}"; do
		if [[ -f "$img" ]]; then
			magick "$img" -quality "$quality" "${img%.*}.$out_ext"
		else
			echo "Warning: File not found - $img"
		fi
	done
}

# Image resizing
function img_resize() {
	if [[ $# -lt 4 ]]; then
		echo "Usage: img_resize <images> <width> <height> <quality>"
		return 1
	fi

	local imgs=("${@:1:$#-3}")
	local width=("${@: -3:1}")
	local height=("${@: -2:1}")
	local quality=("${@: -1}")

	for img in "${imgs[@]}"; do
		if [[ -f "$img" ]]; then
			magick "$img" -quality "$quality" -resize "${width}x${height}>" "$img"
		else
			echo "Warning: File not found - $img"
		fi
	done
}

# Combined image conversion and resizing
function img_convert_resize() {
	if [[ $# -lt 5 ]]; then
		echo "Usage: img_convert_resize <images> <output_extension> <width> <height> <quality>"
		return 1
	fi

	local imgs=("${@:1:$#-4}")
	local out_ext=("${@: -4:1}")
	local width=("${@: -3:1}")
	local height=("${@: -2:1}")
	local quality=("${@: -1}")

	for img in "${imgs[@]}"; do
		if [[ -f "$img" ]]; then
			magick "$img" -quality "$quality" -resize "${width}x${height}>" "${img%.*}.$out_ext"
		else
			echo "Warning: File not found - $img"
		fi
	done
}

# Make Git directories safe
function gitsafe() {
	find . -name ".git" -type d -exec bash -c 'git config --global --add safe.directory "${0%/.git}"' {} \;
}
