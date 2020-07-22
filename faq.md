## FAQ
Tip: 所有教程命令不包含 {}  
  
Q.怎么修改帐号密码?  
A.运行终端命令-输入{ echo "要修改的用户名:要修改的密码"丨chpasswd }  
例: echo "root:1"丨chpasswd 就能把ROOT密码改为1。  
  
Q: Ubuntu安装系统包之后启动报错找不到 source ?  
A: 由于Ubuntu的默认sh是dash,dash没有source命令,使用'运行终端命令'功能运行{rm -rf /bin/sh && ln -s /bin/bash /bin/sh }即可解决  
  
Q: 无ROOT安装路径?  
A: /data/user/0/me.flytree.dogeland/files/xxxx-fs/ 其中xxxx是发行版名称,比如manjaro-fs  
T: 安装路径要和配置文件中的安装路径相同(已经标注了修改哪里)  
  
Q: 无ROOT情况下OpenSSH连接失败?  
A: OpenSSH对无ROOT支持不佳，现已更换dropbear.  

Q: 如果有其他问题欢迎提交issue  