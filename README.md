# Required software packages for macOS before using this script
in the terminal:

1. Command Line Tools

Type the following below command to install command line developer tools package:

xcode-select --install
 
 
 
2. Homebrew

#### For MacOS Catalina, macOS Mojave, and MacOS Big Sur enter this into terminal:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#### For macOS High Sierra, Sierra, El Capitan, and earlier enter this into terminal:

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 
 

3. Change default shell from zsh to bash

chsh -s /bin/bash
 
 

# WRF-4.3-install-script
This is a script that installs all the libararies, software, programs, and geostatic data to run the Weather Research Forecast Model (WRF-4.3) with KPP. Script assumes a clean directory with no other WRF configure files in the directory.

# Installation 
## Must be installed with GNU compiler, it will not work with other compilers.
(Make sure to download folder into your Home Directory):

git clone https://github.com/whatheway/WRF-4.3-install-script-macOS-32bit.git

chmod +x Install_MAC_WRF.sh

./Install_MAC_WRF.sh

# Please make sure to read the Install_MAC_WRF.sh script before installing.  
I have provided comments on what the script is doing and information on configuration files.


# WRF installation with parallel process.

Download and install required library and data files for WRF.

Tested in macOS Catalina 10.15.7

Built in 32-bit

Tested with current available libraries on 05/25/2021

If newer libraries exist edit script paths for changes

# Estimated Run Time ~ 80 - 120 Minutes
### Special thanks to  Youtube's meteoadriatic and GitHub user jamal919 and Gordon S.
