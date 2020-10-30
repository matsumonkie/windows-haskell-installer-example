# we start by defining variables
!define APPNAME "Hello World"
!define COMPANYNAME "BestCompanyEver"

!define EXECUTABLE_NAME "hello-world-app-exe.exe"
!define ICON_NAME "icon.ico"

!define VERSIONMAJOR 1
!define VERSIONMINOR 0
!define VERSIONPATCH 0

# create a directory where our assets will lay (eg: image, executable, uninstaller, dependencies...)
InstallDir "$PROGRAMFILES\${COMPANYNAME}\${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONPATCH}" (ie: C:\Program Files\BestCompanyEver\1.0.0\)

# Define the installer name
outFile "hello-world-app-installer.exe"

section "install"
	setOutPath $INSTDIR

    # copy the executable in the installation directory
    file EXECUTABLE_NAME

	# create a start menu shortcut
	createShortCut "$SMPROGRAMS\${COMPANYNAME}\${APPNAME}.lnk" "$INSTDIR\${EXECUTABLE_NAME}" "" "$INSTDIR\${ICON_NAME}"
	# create a desktop shortcut
    createShortCut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\${EXECUTABLE_NAME}" "" "$INSTDIR\${ICON_NAME}"
sectionEnd