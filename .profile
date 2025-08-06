#
# ~/.profile
#

for file in $(find "$HOME/.config/profile/" -xtype f | sort); do
	. "$file"
done
