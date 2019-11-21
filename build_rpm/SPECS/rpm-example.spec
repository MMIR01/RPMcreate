Summary: RPM example for Linux
Name: rpm-example
Version: 1.0
Release: 0.1
Group: Tools
Packager: mmir01
License: open source
BuildArch: noarch
#BuildArch: x86_64
#The buildroot folder is specified during the call of rpmbuild, since
#this variable is deleted in some point of the build process. See this page for more info:
#https://forums.opensuse.org/showthread.php/461928-rpmbuild-fails-BUILDROOT
#BuildRoot: /home/mm/rpm_example/build_rpm/FILES

# Recommendation. Compile the code previous the rpm build. That is the reason directives
# prep, build and install are commented
# Notes:
# -The following comments have been copied from: 
# https://rpm-packaging-guide.github.io/ 
# -This file does not include all the directives. To find out more visit: 
# http://ftp.rpm.org/max-rpm/s1-rpm-specref-scripts.html

%description
# A full description of the software packaged in the RPM
RPM EXAMPLE

#%build
#Command or series of commands for actually building the software into machine code 
#(for compiled languages) or byte code (for some interpreted languages).

#%prep	
#Command or series of commands to prepare the software to be built, for example, 
#unpacking the archive in Source0. This directive can contain a shell script.

#%install
#Command or series of commands for copying the desired build artifacts from the %builddir 
#(where the build happens) to the %buildroot directory (which contains the directory 
#structure with the files to be packaged). 

#%check
#Command or series of commands to test the software. This normally includes things such as unit tests.
#It is executed after install directive

#%clean
#Executed at the end of the build. It cleans up files produced during a build

#%pre
#All here will be executed before rpm installation. Helpful, for example, to create new users

#%post
#All here will be executed after rpm installation. Helpful, for example, to create new temporary folders

#%preun
#All here will be executed before rpm uninstallation
#%postun
#All here will be executed after rpm uninstallation. Helpful to remove files produced for the program
#(i.e logs)

%files
%defattr(-, root, root)
/opt/rpm-example-0.1/*

%changelog
* Thu Oct 17 2019 mmir01. rpm-example-0.1
- First version 
