# DogeLand-App
![AutoBuild](https://github.com/WhiteSky-Team/DogeLand-App/workflows/Java%20CI%20with%20Gradle/badge.svg)  
Run Linux on Android.  
[简体中文](https://github.com/WhiteSky-Team/DogeLand-App/blob/master/README_zh.md)  
Supports running without root privileges  
Linux solution for running Android out of the box  
 ## Quick start
 This application installs the selected GNU/Linux distribution and runs it in the chroot / proot container.
  Steps for usage:  
   1. Give this application super user (Root) permission.
   2. Connect to the Internet normally.
   3. Import Linux system package
   4. Set relevant parameters
   5. Click the "Start" option button to start the container.
   6. Connect to the container through CLI, SSH, VNC, etc.
   Tips: It is recommended to install support components when starting SSH, and quickly start the SSH service
 ### Equipment requirements
  Minimum support Android 5
  ARM, ARM64, X86, X86_64 are all supported
 ### Use
[Download the latest version] (https://github.com/WhiteSky-Team/DogeLand-App/releases/)
 This application is also compatible with the system installed by LinuxDeploy, and can be used only by setting the installation path and command line.
 ![UBQd8U.png](https://s1.ax1x.com/2020/07/16/UBQd8U.png)
 ![UBQ0v4.png](https://s1.ax1x.com/2020/07/16/UBQ0v4.png)
 ![UB117n.png](https://s1.ax1x.com/2020/07/16/UB117n.png)
 ![UB1Gt0.png](https://s1.ax1x.com/2020/07/16/UB1Gt0.png)
 ### Known bugs
 1. ssh in chroot mode cannot be switched to su user and sudo is not available (but you can log in directly with ROOT account, the problem is temporarily )

 If you know how to solve these problems, please submit an issue immediately, thank you for your support.
