foobar-on-linux
===============

foobar-on-linux integrates a Wine installation of the [foobar2000](http://www.foobar2000.org) audio player into the Linux desktop so that it can be launched and used as if it were a native Linux application.

foobar-on-linux is released under the MIT license.

Features
--------

- Command-line interface (`foobar2000`) supporting the same switches/options as the Windows version
- Automatic and transparent conversion from UNIX to Windows paths
- Applications menu launcher with icon
- Context menu integration ("Open with foobar2000") for popular file managers
- Installation for single user or all users

Installation
------------

### Installing foobar2000 with Wine

1. Ensure Wine is installed (on Debian-based distros: `sudo apt-get install wine`)
2. Download the latest foobar2000 installer from the website
3. Run `wine foobar2000_vx.x.exe`
4. In the install wizard, make sure foobar installs in *portable mode*

### Installing foobar-on-linux

1. Clone the git repository (`git clone https://github.com/dweymouth/foobar-on-linux.git`)
2. `cd foobar-on-linux` and run `sudo ./install.sh` to install for all users or `./install.sh` to install for just you<br/>
(**Note:** install.sh searches for foobar2000's installation directory within $HOME. If foobar2000 was not installed in your home directory tree, you must run `[sudo] ./install.sh /path/to/foobar/dir`)
3. To uninstall foobar-on-linux, run `[sudo] ./uninstall.sh`

Todo
----

- Bash completion for the `foobar2000` script
- Add more MIME types to the desktop entry (cue sheet, etc.)
- Register MIME types for foobar2000-specific file formats (.fpl, etc.)

Feel free to fork and pull!
