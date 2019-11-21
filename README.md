# RPMcreate
How to build your RPM in Linux

- Step1: Configure SPECS/rpm-example.spec file with the new version, BuildRoot, description and destination folder (i.e /opt/SYSTEM-VERSION)
- Step2: Configure BuildRpm.sh with the new version and the architecture
- Step3: Execute: ./BuildRpm.sh
- Step4: The RPM will be located in RPMS/<arch>

Notes 
-buildroot is specified during the call (--buildroot) to be compatible with rpmbuild version 4.11
-The example has been tested with RPM version 4.4 and 4.11
-rpmbuild is a very powerful tool that allows compile your code (see sections %build and %make in the tutorial) prior to pack it, among other things. However, it is likely better to do that with other tools. When your code are ready, just use rpmbuild to pack it (section %files).
-For more info about how to build a RPM, please visit:
http://ftp.rpm.org/max-rpm/
https://rpm-packaging-guide.github.io/
