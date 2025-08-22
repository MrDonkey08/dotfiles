#
# ~/.profile
#

# Append "$1" to $PATH when not already in.
function append_path() {
	case ":$PATH:" in
	*:"$1":*) ;;
	*)
		PATH="${PATH:+$PATH:}$1"
		;;
	esac
}

for file in $(find "$HOME/.config/profile/" -xtype f | sort); do
	. "$file"
done
