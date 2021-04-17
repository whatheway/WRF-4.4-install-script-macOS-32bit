#!/usr/bin/env bash

## WRF installation with parallel process.
# Download and install required library and data files for WRF.
# Tested in macOS Catalina 10.15.7
# Tested in 32-bit
# Tested with current available libraries on 03/15/2021
# If newer libraries exist edit script paths for changes
#Estimated Run Time ~ 80 - 120 Minutes
#Special thanks to  Youtube's meteoadriatic and GitHub user jamal919

#############################basic package managment############################
brew update
brew upgrade
brew install gcc libtool automake autoconf make m4 java ksh git ncview ncar-ncl wget mpich grads

##############################Directory Listing############################

export HOME=`cd;pwd`
mkdir $HOME/WRF
cd $HOME/WRF
mkdir Downloads
mkdir WRFPLUS
mkdir WRFDA
mkdir Libs
mkdir Libs/grib2
mkdir Libs/NETCDF


##############################Downloading Libraries############################

cd Downloads
wget -c https://www.zlib.net/zlib-1.2.11.tar.gz
wget -c https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.0/src/hdf5-1.12.0.tar.gz
wget -c https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-c-4.7.4.tar.gz
wget -c https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-fortran-4.5.3.tar.gz
wget -c https://download.sourceforge.net/libpng/libpng-1.6.37.tar.gz
wget -c https://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.1.zip




#############################Compilers############################

export DIR=$HOME/WRF/Libs
export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran

#############################zlib############################

cd $HOME/WRF/Downloads
tar -xvzf zlib-1.2.11.tar.gz
cd zlib-1.2.11/
./configure --prefix=$DIR/grib2
make

make install


#############################libpng############################

cd $HOME/WRF/Downloads
export LDFLAGS=-L$DIR/grib2/lib
export CPPFLAGS=-I$DIR/grib2/include
tar -xvzf libpng-1.6.37.tar.gz
cd libpng-1.6.37/
./configure --prefix=$DIR/grib2
make
make install

#############################JasPer############################

cd $HOME/WRF/Downloads
unzip jasper-1.900.1.zip
cd jasper-1.900.1/
autoreconf -i
./configure --prefix=$DIR/grib2
make
make install
export JASPERLIB=$DIR/grib2/lib
export JASPERINC=$DIR/grib2/include


#############################hdf5 library for netcdf4 functionality############################

cd $HOME/WRF/Downloads
tar -xvzf hdf5-1.12.0.tar.gz
cd hdf5-1.12.0
./configure --prefix=$DIR/grib2 --with-zlib=$DIR/grib2 --enable-hl --enable-fortran
make
make install

export HDF5=$DIR/grib2
export LD_LIBRARY_PATH=$DIR/grib2/lib:$LD_LIBRARY_PATH

##############################Install NETCDF C Library############################

cd $HOME/WRF/Downloads
tar -xzvf netcdf-c-4.7.4.tar.gz
cd netcdf-c-4.7.4/
export CPPFLAGS=-I$DIR/grib2/include
export LDFLAGS=-L$DIR/grib2/lib
./configure --prefix=$DIR/NETCDF --disable-dap
make
make install

export PATH=$DIR/NETCDF/bin:$PATH
export NETCDF=$DIR/NETCDF

##############################NetCDF fortran library############################

cd $HOME/WRF/Downloads
tar -xvzf netcdf-fortran-4.5.3.tar.gz
cd netcdf-fortran-4.5.3/
export LD_LIBRARY_PATH=$DIR/NETCDF/lib:$LD_LIBRARY_PATH
export CPPFLAGS=-I$DIR/NETCDF/include
export LDFLAGS=-L$DIR/NETCDF/lib
./configure --prefix=$DIR/NETCDF --disable-shared
make
make install



############################ WRF 4.2.2 #################################
## WRF v4.2.2
## Downloaded from git tagged releases
# option 17, option 1 for gfortran and distributed memory w/basic nesting
########################################################################

export WRFIO_NCD_LARGE_FILE_SUPPORT=1
cd $HOME/WRF/Downloads
wget -c https://github.com/wrf-model/WRF/archive/v4.2.2.tar.gz
tar -xvzf v4.2.2.tar.gz -C $HOME/WRF
cd $HOME/WRF/WRF-4.2.2
./clean
./configure
./compile em_real >& log_compile 2>& error_log

export WRF_DIR=$HOME/WRF/WRF-4.2.2



############################WPSV4.2#####################################
## WPS v4.2
## Downloaded from git tagged releases
#Option 19 for gfortran and distributed memory
########################################################################

cd $HOME/WRF/Downloads
wget -c https://github.com/wrf-model/WPS/archive/v4.2.tar.gz
tar -xvzf v4.2.tar.gz -C $HOME/WRF
cd $HOME/WRF/WPS-4.2
./configure
./compile




############################WRFPLUS 4DVAR###############################
## WRFPLUS v4.2 4DVAR
## Downloaded from git tagged releases
## WRFPLUS is built within the WRF git folder
## Does not include RTTOV Libarary for radiation data.  If wanted will need to install library then reconfigure
##Note: if you intend to run both 3DVAR and 4DVAR experiments, it is not necessary to compile the code twice.
#Option 10 for gfortran/gcc and distribunted memory
########################################################################

cd $HOME/WRF/Downloads
tar -xvzf v4.2.2.tar.gz -C $HOME/WRF/WRFPLUS
cd $HOME/WRF/WRFPLUS/WRF-4.2.2
mv * $HOME/WRF/WRFPLUS
cd $HOME/WRF/WRFPLUS
rm -r WRF-4.2.2/
export NETCDF=$DIR/NETCDF
export HDF5=$DIR/grib2
export LD_LIBRARY_PATH=$DIR/grib2/lib:$LD_LIBRARY_PATH
./configure wrfplus
./compile wrfplus
export WRFPLUS_DIR=$HOME/WRF/WRFPLUS




############################WRFDA 4DVAR###############################
## WRFDA v4.2 4DVAR
## Downloaded from git tagged releases
## WRFDA is built within the WRFPLUS folder
## Does not include RTTOV Libarary for radiation data.  If wanted will need to install library then reconfigure
##Note: if you intend to run both 3DVAR and 4DVAR experiments, it is not necessary to compile the code twice.
#Option 10 for gfortran/gcc and distribunted memory
########################################################################

cd $HOME/WRF/Downloads
tar -xvzf v4.2.2.tar.gz -C $HOME/WRF/WRFDA
cd $HOME/WRF/WRFDA/WRF-4.2.2
mv * $HOME/WRF/WRFDA
cd $HOME/WRF/WRFDA
rm -r WRF-4.2.2/
export NETCDF=$DIR/NETCDF
export HDF5=$DIR/grib2
export LD_LIBRARY_PATH=$DIR/grib2/lib:$LD_LIBRARY_PATH
export WRFPLUS_DIR=$HOME/WRF/WRFPLUS
./configure 4dvar #Option 18 for gfortran/gcc and distribunted memory
./compile all_wrfvar




######################## WPS Domain Setup Tools ########################
## DomainWizard

cd $HOME/WRF/Downloads
wget http://esrl.noaa.gov/gsd/wrfportal/domainwizard/WRFDomainWizard.zip
mkdir $HOME/WRF/WRFDomainWizard
unzip WRFDomainWizard.zip -d $HOME/WRF/WRFDomainWizard
chmod +x $HOME/WRF/WRFDomainWizard/run_DomainWizard


######################## WPF Portal Setup Tools ########################
## WRFPortal
cd $HOME/WRF/Downloads
wget https://esrl.noaa.gov/gsd/wrfportal/portal/wrf-portal.zip
mkdir $HOME/WRF/WRFPortal
unzip wrf-portal.zip -d $HOME/WRF/WRFPortal
chmod +x $HOME/WRF/WRFPortal/runWRFPortal

######################## Static Geography Data inc/ Optional ####################
# http://www2.mmm.ucar.edu/wrf/users/download/get_sources_wps_geog.html
# Double check if Irrigation.tar.gz extracted into WPS_GEOG folder
# IF it didn't right click on the .tar.gz file and select 'extract here'
#################################################################################

cd $HOME/WRF/Downloads
wget -c https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz
mkdir $HOME/WRF/GEOG
tar -xvzf geog_high_res_mandatory.tar.gz -C $HOME/WRF/GEOG
wget -c  https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_thompson28_chem.tar.gz
tar -xvzf geog_thompson28_chem.tar.gz -C $HOME/WRF/GEOG/WPS_GEOG
wget -c  https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_noahmp.tar.gz
tar -xvzf geog_noahmp.tar.gz -C $HOME/WRF/GEOG/WPS_GEOG
wget -c  https://www2.mmm.ucar.edu/wrf/src/wps_files/irrigation.tar.gz
tar -xvzf irrigation.tar.gz -C $HOME/WRF/GEOG/WPS_GEOG
wget -c  https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_px.tar.gz
tar -xvzf geog_px.tar.gz -C $HOME/WRF/GEOG/WPS_GEOG
wget -c  https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_urban.tar.gz
tar -xvzf geog_urban.tar.gz -C $HOME/WRF/GEOG/WPS_GEOG
wget -c  https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_ssib.tar.gz
tar -xvzf geog_ssib.tar.gz -C $HOME/WRF/GEOG/WPS_GEOG
wget -c  https://www2.mmm.ucar.edu/wrf/src/wps_files/lake_depth.tar.bz2
tar -xvf lake_depth.tar.bz2 -C $HOME/WRF/GEOG/WPS_GEOG



## export PATH and LD_LIBRARY_PATH
echo "export PATH=$DIR/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH" >> ~/.bashrc


#####################################BASH Script Finished##############################
echo "Congratulations! You've successfully installed all required files to run the Weather Research Forecast Model verison 4.2.2."
echo "Thank you for using this script"
