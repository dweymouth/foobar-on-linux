#!/bin/bash
# foobar-on-linux uninstall script
# Written by Drew Weymouth

if [ $EUID -ne 0 ]; then
	echo "Uninstalling foobar-on-linux for current user"
	rm -f "$HOME/bin/foobar2000"
	rm -f "$HOME/.local/share/icons/foobar2000.png"
	rm -f "$HOME/.local/share/applications/foobar2000.desktop"
else
	echo "Uninstalling foobar-on-linux for all users"
	rm -f '/usr/local/bin/foobar2000'
	rm -f '/usr/local/share/icons/foobar2000.png'
	rm -f '/usr/share/applications/foobar2000.desktop'
fi

echo "foobar-on-linux was uninstalled successfully!"
