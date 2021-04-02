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
 
 
3. Basic Package Management
                                                                                               
brew install gcc libtool automake autoconf make m4 java ksh git ncview ncar-ncl wget mpich grads  
 
 

# WRF-4.2.2-install-script
This is a script that installs all the libararies, software, programs, and geostatic data to run the Weather Research Forecast Model (WRF-4.2.2) with the option to run 3DVAR & 4DVAR observational data. Script assumes a clean directory with no other WRF configure files in the directory.

# Installation 
(Make sure to download folder into your Home Directory):

git clone https://github.com/whatheway/WRF-4.2.2-install-script-macOS-32bit.git

chmod +x WRF_ARW_INSTALL.sh

./WRF_ARW_INSTALL

# Please make sure to read the WRF_ARW_INSTALL.sh script before installing.  
I have provided comments on what the script is doing and information on configuration files.


# WRF installation with parallel process.

Download and install required library and data files for WRF.

Tested in macOS Catalina 10.15.7

Built in 32-bit

Tested with current available libraries on 03/15/2021

If newer libraries exist edit script paths for changes

# Estimated Run Time ~ 80 - 120 Minutes
### Special thanks to  Youtube's meteoadriatic and GitHub user jamal919
