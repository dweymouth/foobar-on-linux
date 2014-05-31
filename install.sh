#!/bin/bash
# foobar-on-linux install script
# Written by Drew Weymouth

# Ensure a directory exists before doing a copy
mkcp () {
	mkdir -p "$2" && cp "$1" "$2"
}

escape_slashes () {
	echo "$1" | sed 's/\//\\\//g'
}

if [ "$1" == "--help" -o "$1" == "-h" ]; then
	echo "Usage: install.sh [foobar2000-wine-install-dir]"
	echo "  to install foobar-on-linux for current user"
	echo "or sudo install.sh [foobar2000-wine-install-dir]"
	echo "  to install for all users"
	exit
fi

# Find foobar2000 install directory
if [ -f "$1/foobar2000.exe" ]; then
	FOOBAR_HOME="$1"
	echo "Using supplied foobar2000 install directory:"
else
	echo "Searching for foobar2000 install directory..."
	FOOBAR_HOME="$(dirname "$(find "$HOME" -name foobar2000.exe -type f)")"
fi
echo "foobar install dir: $FOOBAR_HOME"

# set install directories for current user or all users
if [ $EUID -ne 0 ]; then
	echo "Installing foobar-on-linux for current user"
	BIN="$HOME/bin"
	ICON_DIR="$HOME/.local/share/icons"
	APP_DIR="$HOME/.local/share/applications"
else
	echo "Installing foobar-on-linux for all users"
	BIN='/usr/local/bin'
	ICON_DIR='/usr/local/share/icons'
	APP_DIR='/usr/share/applications'
fi

# copy files to appropriate install directories
mkcp foobar2000 "$BIN"
mkcp foobar2000.desktop "$APP_DIR"
mkcp foobar2000.png "$ICON_DIR"

# update the bash script with the foobar installation directory
sed -i "s/%FOOBAR_HOME/`escape_slashes \"$FOOBAR_HOME\"`/g" "$BIN/foobar2000"
# update the .desktop file with the appropriate directories
sed -i "s/%BIN/`escape_slashes \"$BIN\"`/g" "$APP_DIR/foobar2000.desktop"
sed -i "s/%ICON_DIR/`escape_slashes \"$ICON_DIR\"`/g" "$APP_DIR/foobar2000.desktop"

echo "foobar-on-linux was installed successfully!"
