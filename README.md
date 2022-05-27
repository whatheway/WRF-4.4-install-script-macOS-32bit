# Required software packages for macOS before using this script
in the terminal:

1. Command Line Tools

Type the following below command to install command line developer tools package:

> xcode-select --install
 
 
 
2. Homebrew

#### For MacOS Catalina, macOS Mojave, and MacOS Big Sur enter this into terminal:

> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#### For macOS High Sierra, Sierra, El Capitan, and earlier enter this into terminal:

> /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 
 

3. Change default shell from zsh to bash

> chsh -s /bin/bash
 
 

# WRF-4.4-install-script
This is a script that installs all the libararies, software, programs, and geostatic data to run the Weather Research Forecast Model (WRF-4.4) with the option to run 3DVAR & 4DVAR observational data. 
Script assumes a clean directory with no other WRF configure files in the directory.
**This script does not install NETCDF4 to write compressed NetCDF4 files in parallel**

# Installation 
(Make sure to download folder into your Home Directory): $HOME

> git clone https://github.com/whatheway/WRF-4.4-install-script-macOS.git

> chmod 775 Install_MAC_WRF.sh

> chmod 775 Minicoda3_Install.sh

> ./Install_MAC_WRF.sh

# WRF installation with parallel process (dmpar).
Must be installed with GNU compiler, it will not work with other compilers.


# WRF installation with parallel process.

Download and install required library and data files for WRF.

Tested in macOS Big Spur 11.2

Tested with current available libraries on 05/11/2022

If newer libraries exist edit script paths for changes

# Post-Processing Software Included

## ARWpost v3.1
Added to $PATH and ~/.bashrc for easy access

## NCAR COMMAND LANGUAGE (NCL) v.6.6.2
 Installed via CONDA package using miniconda3
 Conda environment ncl_stable
 Users Guide: https://www.ncl.ucar.edu/Document/Manuals/NCL_User_Guide/
## WRF Python
 Installed via CONDA package using miniconda3
 Conda environment wrf-python
Users Guide: https://wrf-python.readthedocs.io/en/latest/index.html
## WRF Hydro GIS Preprocessor
 Installed via CONDA package using miniconda3
 Conda environment wrfh_gis_env
Users Guide: https://github.com/NCAR/wrf_hydro_gis_preprocessor & https://ral.ucar.edu/projects/wrf_hydro/pre-processing-tools

# Estimated Run Time ~ 90 - 150 Minutes @ 10mbps download speed.
### - Special thanks to  Youtube's meteoadriatic, GitHub user jamal919, University of Manchester's  Doug L, University of Tunis El Manar's Hosni S.


