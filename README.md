
![screenshot](https://github.com/fastrgv/Wnexd/blob/master/eg.png)


# Wnexd
## -- Windows "nexd" Directory Utility for Command Prompt users
-------------------------------------------------------------------
### Wnexd Description
Adjunct to the Windows-intrinsic pushd/popd utilities for users of the Command Prompt terminal window that simulates a linux-style "pushd +1", and "dirs".

#### Features
* Allows round-robin traversal of directories in the "pushd" stack
* Runs on Windows 10
* Lightweight & simple
* Adds 2 new commands that work with the Windows-intrinsic pushd, popd:
	* **nexd** moves to the Next directory in queue [like 'pushd +1']
	* **dirs** displays contents of the directory queue [like 'dirs']

### Setup wnexd using doskey command:

Place the .\wnexd\\ directory under your home directory.
Executing "ndprep.bat" file will make the new commands available. It uses "doskey" to add two commands: nexd, dirs:

* doskey nexd=%HOMEPATH%\wnexd\nexd.bat
* doskey dirs=%HOMEPATH%\wnexd\dirs.bat $1


### Usage
* dirs : displays stack
* dirs -c : clears the stack
* nexd : moves to the next directory in the stack [without popping it]; similar in function to linux "pushd +1"; 


-------------------------------------------------------------------
### What is special about this utility?
It can preclude the need to open multiple Command Prompt windows when working with several related directories.
It is a simple way to enable additional pushd functionality. And, except for the quirky syntax of BAT scripts, the logic is reasonably transparent.

Open source developers are welcome to help improve or extend this utility.
Developer or not, send comments, suggestions or questions to:
fastrgv@gmail.com



--------------------------
### License:

This utility is covered by the GNU GPL v3 as indicated in the sources:

 Copyright (C) 2022  fastrgv@gmail.com

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You may read the full text of the GNU General Public License
 at <http://www.gnu.org/licenses/>.



