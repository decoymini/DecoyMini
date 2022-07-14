![DecoyMini_bg](https://github.com/decoymini/DecoyMini/blob/main/DecoyMini_bg_new.png)

![version](https://img.shields.io/badge/version-v1.0.4958-brightgreen)
![language](https://img.shields.io/badge/language-golang-orange)
![platform](https://img.shields.io/badge/platform-windows%20%7C%20linux-lightgrey)

🍯 DecoyMini（智能仿真与诱捕防御工具）是一款完全免费的蜜罐软件，工具采用轻量化威胁诱捕技术，具备丰富的攻击诱捕和溯源分析能力；支持插件化的仿真模板，从论坛一键下载模板就可以快速在本地部署新的蜜罐；提供灵活的蜜罐自定义能力，通过界面可视化编排即可部署专属的蜜罐；支持本地高质量内生情报输出，可以无缝应用到网关设备对攻击进行及时封堵。DecoyMini是企业零成本构建主动感知网络攻击的得力工具，可以协助企业有效提升网络安全监测、响应及防御能力。

[DecoyMini 演示环境](http://demo.decoymini.com:88) (使用论坛帐户登录)

## :zap: 特点
* 智能仿真：插件化的仿真模板，一键导入云端仿真模板库就可以在本地网络快速部署多样化的安全可控的仿真服务和应用，支持对WEB站点进行自动学习和仿真
* 高效诱捕：支持快速部署蜜罐群，使用虚拟IP，将网络内空闲的IP资源绑定到一到多个仿真环境上，支持动态绑定端口来增加蜜罐诱惑性，大大提高攻击诱捕的能力
* 灵活扩展：采用可视化仿真编排引擎，用户通过界面配置即可实现对自定义的网络协议、服务或应用的仿真，模板支持系统间快速迁移和通过DecoyMini论坛进行分享
* 部署简便：支持主流操作系统（Windows 32/64位, CentOS/Ubuntu/Debian/Kali 32/64位, 树莓派等）,支持Docker运行，支持单节点、多节点集中管理，部署灵活、一键安装、使用简单
* 安全有效：基于商业化蜜罐产品（DecoyPro）能力积累，采用轻量化威胁诱捕技术做免费蜜罐工具（DecoyMini），安全性好，成熟度高、稳定性有保障。

## :hourglass_flowing_sand: 部署模式
* 单节点模式：管理节点与诱捕探针一体式运行在一台主机上，为 DecoyMini 默认模式。
* 集中管理模式：在网络中选择一台主机部署 DecoyMini 软件作为管理节点，在多个主机上以诱捕探针模式部署诱捕节点，将诱捕节点集中到此管理节点统一管理。

## :desktop_computer: 环境需求
配置\类别|单节点|管理节点|诱捕探针
--|:--:|:--:|:--:
最低配置|CPU ≥ 2核; 内存 ≥ 1G; 硬盘 ≥ 20G|CPU ≥ 2核; 内存 ≥ 2G; 硬盘 ≥ 100G|CPU ≥ 1核; 内存 ≥ 1G; 硬盘 ≥ 10G
推荐配置|CPU 4 核; 内存 2G; 硬盘 50G|CPU 4 核; 内存 4G; 硬盘 200G|CPU 2 核; 内存 2G; 硬盘 20G

## :package: 安装与卸载
前往 :point_right: [releases](https://github.com/decoymini/DecoyMini/releases) 处下载 DecoyMini，支持 32 位和 64 位的 Windows 和 Linux，用户安装需遵循 [安装许可使用协议](http://bbs.decoyit.com/thread-17-1-1.html) ！

### 单节点/管理节点安装

**Windows：**
```bash
DecoyMini_Windows_xxx.exe -install
```

**Linux：**
在已安装 Docker 的环境下，运行如下命令快速安装 DecoyMini：
```bash
./DecoyMini_Linux_xyy_xxx.pkg -install
```

**Docker：**
```bash
dockerrun-itd--namedecoymini\
--networkhost\
--restart=always\
--privileged=true\
decoyit/decoymini:latest
```
使用 Docker 镜像安装 DecoyMini，默认管理端口为 88，可以通过设置环境变量 LISTENING_ADDR 来更改监听端口；可以将 DecoyMini 的 /usr/decoymini 和 /usr/decoy 两个目录持久化，实现 DecoyMini 系统数据持久化存储。支持自定义监听端口和数据持久化的安装命令如下：
```bash
dockerrun-itd--namedecoymini\
-v/usr/decoymini:/usr/decoymini\
-v/usr/decoy:/usr/decoy\
--envLISTENING_ADDR="0.0.0.0:8090"\
--networkhost\
--restart=always\
--privileged=true\
decoyit/decoymini:latest
```
注意：按需将环境变量 LISTENING_ADDR 的值更改为实际需要监听的地址和端口。

登录可使用两种方式登录，一个使用论坛帐号直接登录 (推荐)，另一个是使用本地默认帐户登录，本地默认帐号密码：
```bash
帐号：admin
密码：Admin@123
```
### 诱捕探针安装

**Windows**:
```bash
DecoyMini_Windows_xxx.exe -install -addr 管理节点地址
```

示例
```bash
DecoyMini_Windows_xxx.exe -install -addr http://192.168.8.100:8080
```

**Linux:**
```bash
./DecoyMini_Linux_xyy_xxx.pkg -install -addr 管理节点地址
```

示例
```bash
./DecoyMini_Linux_xyy_xxx.pkg -install -addr http://192.168.8.100:8080
```

**Docker:**
在已安装 Docker 的环境下，运行如下命令快速安装 DecoyMini 诱捕探针：
```bash
dockerrun-itd--namedecoymini\
--envMANAGER_ADDR="http://192.168.1.100:88"\
--networkhost\
--restart=always\
--privileged=true\
decoyit/decoymini:latest
```
注意：须将环境变量 MANAGER_ADDR 的值更改为实际管理节点部署的地址。

### 卸载

如若要卸载，在终端下输入相应命令（-uninstall）即可（Windows 下卸载同样也需在 cmd 管理员模式下）：
```bash
Windows：decoymini.exe -uninstall
Linux：decoymini -uninstall
```

### 相关命令
```bash
Usage of decoymini:
  -info
        Show information
  -set -addr string
        Set Manager address
  -uninstall
        Uninstall Software
```

示例：显示安装信息，在命令行窗口执行如下命令：
```bash
decoymini -info
```

## :bar_chart: 界面
登录界面：

![image](https://user-images.githubusercontent.com/85264922/127760829-da736309-dad3-484b-b3f4-eeedd475513f.png)

风险态势大屏：

![8D39B8B4-9B12-4dcc-BB04-20E4032CFC88](https://user-images.githubusercontent.com/85264922/135040697-3f0daa86-7f0f-4fbd-bea7-3d0d1249bd1f.png)

仪表盘：

![p1](https://user-images.githubusercontent.com/85264922/129677849-e8248979-0747-4d26-ae6d-adb0d47715ac.png)

风险事件列表：

![p2](https://user-images.githubusercontent.com/85264922/129677904-e4d2ceab-9dd8-4916-8a83-e323f1dd4d26.png)

风险事件详情：

![image](https://user-images.githubusercontent.com/85264922/127760877-8f1aab77-631e-4751-8385-c80d5e6b650b.png)

诱捕日志详情：

![image](https://user-images.githubusercontent.com/85264922/127760886-ec49cafd-9ded-4a4d-bae1-a6f3ce89275f.png)

诱捕策略配置：

![image](https://user-images.githubusercontent.com/85264922/127760892-14524dc1-a295-440e-bf87-7319b7e0aa83.png)

仿真模板配置：

![image](https://user-images.githubusercontent.com/85264922/127760901-7f01fc3c-4608-493f-a7ca-0e7166fd3655.png)

攻击 IP 分析：

![P1](https://user-images.githubusercontent.com/85264922/144013098-a4cc497d-7015-4464-b070-499d9fa507fc.png)

被攻击 IP 分析：

![331AF7B7-6563-4133-9E8A-0F79D2198C5E](https://user-images.githubusercontent.com/85264922/142332936-1205a035-3baf-4d72-951e-029ba10a3809.png)

诱捕器分析：

![P2](https://user-images.githubusercontent.com/85264922/144013231-6c68e8f8-ec9f-4dee-ba56-1cf8297b4a1c.png)

## :book: 手册
如需了解更多，请参阅 [用户手册](http://bbs.decoyit.com/thread-6-1-1.html) ！

## :pushpin: 交流
在使用 DecoyMini 过程中，如有问题可以在微信群或 QQ 群交流讨论 :clap:，我们都会及时处理！
* QQ 群：599120645
* 微信群：扫描以下二维码一键入群 (3 群)

<img width="245" alt="20220712143053" src="https://user-images.githubusercontent.com/85264922/178424009-467cc78a-a44d-4e9d-9800-ff8771aa0313.png">

* 可在 [此处](http://bbs.decoyit.com/forum-41-1.html) 进行 BUG 反馈 :sunglasses:
