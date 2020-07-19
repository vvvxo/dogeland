8# DogeLand-App
开箱即用的Android运行Linux解决方案  
已支持免ROOT运行🐳🐳🐳  
## 快速上手
本应用程序安装选定的 GNU/Linux 发行版，并在 chroot / proot 容器中运行。
 使用步骤：  
  1. 给本应用 超级用户（Root） 权限。
  2. 正常连接至互联网。
  3. 导入Linux系统包
  4. 设置相关参数
  5. 点击"启动"选项按钮来启动容器。
  6. 通过 CLI、SSH、VNC 等方式连接容器  
  Tips: 启动SSH推荐安装支持组件，快捷启动SSH服务  
### 设备要求
 最低支持Android 5  
 ARM,ARM64,X86,X86_64均已支持  
### 使用
[下载最新版本](https://github.com/WhiteSky-Team/DogeLand-App/releases/)  
本应用同时兼容LinuxDeploy安装的系统，只设置安装路径与命令行即可使用。  
![UBQd8U.png](https://s1.ax1x.com/2020/07/16/UBQd8U.png)
![UBQ0v4.png](https://s1.ax1x.com/2020/07/16/UBQ0v4.png)
![UB117n.png](https://s1.ax1x.com/2020/07/16/UB117n.png)
![UB1Gt0.png](https://s1.ax1x.com/2020/07/16/UB1Gt0.png)
### 已知bug
1.chroot模式下的ssh无法切换到su用户和sudo不可用(但可直接使用ROOT帐号登录,问题暂时解决)    

如果您知道这些问题如何解决，请立刻提交issue,感谢支持.
