#!/bin/sh
##############################################################################
# @purpose This script will help you to build rpm
#    Step1: Configure the version of your program (SYSTEM)
#    Step2: Select architecture in specs file. Uncomment the corresponding
#    ARCH
#    Step3: Select the architecture in the spec file
#    Step4: Execute: ./BuildRpm.sh
#    Step5: The new RPM will be found in RPMS/<arch>
# Note: "populate" function will copy all the files of your program 
# underneath FILES folder, in order to be packed into RPM. 
# Remember your code has to be compiled previously, although 
# rpm-specs file is able to do it
# Tested with RPMBUILD version 4.4 and 4.11
##############################################################################

# Configuration

SYSTEM="rpm-example-0.1"
#Uncomment for no architecture
ARCH="noarch"
#Uncomment for x86_64 architecture
#ARCH="x86_64"
#Uncomment for x86 architecture
#ARCH="x86"

# End configuration

# Paths
PATH_FILES="FILES/opt/${SYSTEM}"
CURRENT_PATH=`pwd`
SOURCE_FILES="../files_for_rpm/*"

echo "Starting build process for: "
echo $SYSTEM
echo "Path of the files used: "
echo $PATH_FILES

# ----------------------------------------------------------------------------
# Cleaning previous builds
# ----------------------------------------------------------------------------
function Clean(){
    echo Deleting folders: FILES, RPMS
    rm -rf FILES
    rm -rf RPMS
}

# ----------------------------------------------------------------------------
# RPM folders
# ----------------------------------------------------------------------------
function CreateStructure(){
    echo Creating folders: FILES, RPMS
    mkdir -p $PATH_FILES
    mkdir -p RPMS/${ARCH}

}

# ----------------------------------------------------------------------------
# Populating FILES folder with the content of the RPM 
# ----------------------------------------------------------------------------
function Populate(){
    echo Populating FILES
    # Copy necessary files for rpm
    cp -r $SOURCE_FILES $PATH_FILES/
	
}

# ----------------------------------------------------------------------------
# Creating the RPM by using rpmbuild command. Parameters:
# --define: defining a MACRO. In this case topdir
# --buildroot: folder which contains the files of the system
# -v:verbose
# -bb: build a binary package
# ----------------------------------------------------------------------------
function BuildRpm(){
    echo Build RPM...
    cd SPECS
    rpmbuild --buildroot ${CURRENT_PATH}/FILES --define "_topdir ${CURRENT_PATH}" -v -bb rpm-example.spec 
}

echo Building RPM...
Clean
CreateStructure
Populate
BuildRpm

# END ########################################################################
