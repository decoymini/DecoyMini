![DecoyMini_bg](https://github.com/decoymini/DecoyMini/blob/main/DecoyMini_bg_new.png)

![version](https://img.shields.io/badge/version-v3.0.9086-brightgreen)
![language](https://img.shields.io/badge/language-golang-orange)
![platform](https://img.shields.io/badge/platform-windows%20%7C%20linux-lightgrey)

🍯 DecoyMini（吉星·智能仿真与诱捕防御工具）是一款完全免费的蜜罐软件，工具采用轻量化威胁诱捕技术，具备丰富的攻击诱捕和溯源分析能力；支持插件化的仿真模板，从论坛一键下载模板就可以快速在本地部署新的蜜罐；提供灵活的蜜罐自定义能力，通过界面可视化编排即可部署专属的蜜罐；支持本地高质量内生情报输出，可以无缝应用到网关设备对攻击进行及时封堵。DecoyMini是企业零成本构建主动感知网络攻击的得力工具，可以协助企业有效提升网络安全监测、响应及防御能力。

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
docker run -itd --name decoymini\
 --network host\
 --restart=always\
 --privileged=true\
 decoyit/decoymini:latest
```
使用 Docker 镜像安装 DecoyMini，默认管理端口为 88，可以通过设置环境变量 LISTENING_ADDR 来更改监听端口；可以将 DecoyMini 的 /usr/decoymini 和 /usr/decoy 两个目录持久化，实现 DecoyMini 系统数据持久化存储。支持自定义监听端口和数据持久化的安装命令如下：
```bash
docker run -itd --name decoymini\
 -v /usr/decoymini:/usr/decoymini\
 -v /usr/decoy:/usr/decoy\
 --env LISTENING_ADDR="0.0.0.0:8090"\
 --network host\
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
docker run -itd --name decoymini\
 --env MANAGER_ADDR="http://192.168.1.100:88"\
 --network host\
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

![image2](https://github.com/decoymini/DecoyMini/assets/85264922/1de68be5-3298-41d7-95d4-2a90839d22fe)

风险态势大屏：

![20220809174137](https://user-images.githubusercontent.com/85264922/183618050-b3351795-e117-458a-a160-b301fa22367b.png)

仪表盘：

![20220809174149](https://user-images.githubusercontent.com/85264922/183618110-0e97fcff-cafc-45ed-a500-e7c14b147242.png)

风险事件列表：

![1C703267-3B30-4702-A47F-64DDEB92614C](https://user-images.githubusercontent.com/85264922/178920448-849a3ee6-2393-47e1-a7bb-a3f8db43a3d6.png)

风险事件详情：

![3EACB8AD-C04E-458a-98A0-FC98348B9B8D](https://user-images.githubusercontent.com/85264922/178920509-5a6efe65-da78-4369-96df-419f876faf63.png)

诱捕日志详情：

![7FB80344-479C-4f91-8109-F34A46E24648](https://user-images.githubusercontent.com/85264922/178920581-e1b1f8cd-a3c0-4354-a0d3-d3d778f85c37.png)

诱捕策略配置：

![3D556309-455B-46ae-AA51-4A5FE499B160](https://user-images.githubusercontent.com/85264922/178920246-d8451bf8-f0a3-4bf5-a9e8-2d3adddb8aed.png)

仿真模板配置：

![E9984BEA-434A-4971-B755-335EF4ADD784](https://user-images.githubusercontent.com/85264922/178920300-97873029-a3de-411f-9ec8-1a5e2a5c8bc0.png)

攻击 IP 分析：

![P1](https://user-images.githubusercontent.com/85264922/144013098-a4cc497d-7015-4464-b070-499d9fa507fc.png)

被攻击 IP 分析：

![331AF7B7-6563-4133-9E8A-0F79D2198C5E](https://user-images.githubusercontent.com/85264922/142332936-1205a035-3baf-4d72-951e-029ba10a3809.png)

诱捕器分析：

![P2](https://user-images.githubusercontent.com/85264922/144013231-6c68e8f8-ec9f-4dee-ba56-1cf8297b4a1c.png)

内生情报输出：

![ABAFF3D4-6F0B-4573-9F61-62AD49D9B8E1](https://user-images.githubusercontent.com/85264922/178920676-0f83bc5e-3337-4ef6-a634-e7ac87e63a55.png)

## :book: 手册
如需了解更多，请参阅 [用户手册](http://help.decoymini.com) ！

## :pushpin: 交流
在使用 DecoyMini 过程中，如有问题可以在微信群或 QQ 群交流讨论 :clap:，我们都会及时处理！
* QQ 群：599120645
* 微信群：扫描以下二维码一键入群 (4 群) 4 月 19 日前有效

<img width="120" alt="Snipaste_2024-04-12_09-52-40" src="https://github.com/decoymini/DecoyMini/assets/85264922/96006945-d78d-4b32-9438-c7cbe8062d95">

进来后请不要发广告！！！如果发现自己无故被移出，说明你邀请过的人发过广告！！！

* 可在 [此处](http://bbs.decoyit.com/forum-41-1.html) 进行 BUG 反馈 :sunglasses:
