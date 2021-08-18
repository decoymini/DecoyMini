![DecoyMini_bg](https://github.com/decoymini/DecoyMini/blob/main/DecoyMini_bg.png)

![version](https://img.shields.io/badge/version-v1.0.1718-brightgreen)
![language](https://img.shields.io/badge/language-golang-orange)
![platform](https://img.shields.io/badge/platform-windows%20%7C%20linux-lightgrey)

🍯 欺骗防御是近些年出现的新技术，以攻防对抗思路为基础，让防守者得以观察攻击者行为的新兴网络安全防御战术。传统的安全防御思路，防守者需要充分、全面、完整的对网络和系统的安全漏洞和风险进行分析、评估和整改来确保整个网络的安全，但是网络的攻击面众多，很难完全及时发现所有问题或风险；而攻击者只需要抓住一次机会就可以达到其攻击目标。欺骗防御技术跟传统安全模型完全相反，攻击者除非 100% 正确，否则就会触碰到诱捕环境进而暴露攻击行为。

通过欺骗防御，可以有效改变攻防不对称，变被动为主动，是对传统防御的有力增强和有益补充。全球最具权威的 IT 研究与顾问咨询公司 Gartner 评价 "欺骗防御" 等技术未来 5-10 年能够进入主流市场，是对现有安全防护体系产生深远影响的安全技术发展趋势。

[DecoyMini 演示环境](http://119.45.162.160:88) (使用论坛帐户登录)

## :zap: 特点
* 安全稳定：基于商业化蜜罐产品（DecoyPro）能力积累，以商业化思维做免费蜜罐产品（DecoyMini），产品安全性高，稳定性有保障。
* 多样化仿真诱捕能力：支持通过一键式导入仿真模板即可实现新的仿真能力的快速部署和应用。仿真模板支持网络服务类、WEB 类、数据库类、中间件类、应用类、设备类等多种类型，支持通过 DecoyMini 论坛进行分享。 
* 高可扩展能力：采用可视化仿真编排引擎，提供友好的配置管理界面，支持仅通过界面配置即可实现对新的网络协议或服务、应用的仿真能力；用户自主即可快速、高效实现对新的网络协议、服务和应用的仿真。 
* 情报激励：通过用户手动或工具自动提交威胁情报数据，可以获取丰富的奖励。
* 部署灵活：工具支持主流操作系统（Windows 32/64 位,CentOS 32/64 位），安装、使用简单。支持单节点运行，也支持多节点集中管理。

## :hourglass_flowing_sand: 部署模式
* 单节点模式：管理中心与诱捕探针一体式运行在一台主机上，为 DecoyMini 默认模式。
* 集中管理模式：在网络中选择一台主机部署 DecoyMini 软件作为管理中心，在多个主机上以诱捕探针模式部署诱捕节点，将诱捕节点集中到此管理中心统一管理。

## :desktop_computer: 环境需求
配置\类别|单节点|管理中心|诱捕探针
--|:--:|:--:|:--:
最低配置|CPU ≥ 2核; 内存 ≥ 2G; 硬盘 ≥ 50G|CPU ≥ 4核; 内存 ≥ 4G; 硬盘 ≥ 100G|CPU ≥ 2核; 内存 ≥ 1G; 硬盘 ≥ 10G
推荐配置|CPU 4 核; 内存 4G; 硬盘 100G|CPU 6 核; 内存 8G; 硬盘 200G|CPU 2 核; 内存 2G; 硬盘 20G

## :package: 安装与卸载
前往 :point_right: [releases](https://github.com/decoymini/DecoyMini/releases) 处下载 DecoyMini，支持 32 位和 64 位的 Windows 和 Linux，用户安装需遵循 [安装许可使用协议](http://bbs.decoyit.com/thread-17-1-1.html) ！

### 单节点/管理中心安装

**Windows：**
```bash
DecoyMini_Windows_xxx.exe -install
```

**Linux：**
```bash
DecoyMini_Linux_xyy_xxx.pkg -install
```

登录可使用两种方式登录，一个使用论坛帐号直接登录 (推荐)，另一个是使用本地默认帐户登录，本地默认帐号密码：
```bash
帐号：admin
密码：Admin@123
```
### 诱捕探针安装

**Windows**:
```bash
DecoyMini_Windows_xxx.exe -install -addr 管理中心地址
```

示例
```bash
DecoyMini_Windows_xxx.exe -install -addr http://192.168.8.100:8080
```

**Linux:**
```bash
DecoyMini_Linux_xyy_xxx.pkg -install -addr 管理中心地址
```

示例
```bash
DecoyMini_Linux_xyy_xxx.pkg -install -addr http://192.168.8.100:8080
```

### 卸载

如若要卸载，在终端下输入相应命令即可（Windows 下卸载同样也需在 cmd 管理员模式下）：
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

## :book: 手册
如需了解更多，请参阅 [用户手册](http://bbs.decoyit.com/thread-6-1-1.html) ！

## :pushpin: 交流
在使用 DecoyMini 过程中，如有问题可以在微信群或 QQ 群交流讨论 :clap:，我们都会及时处理！
* QQ 群：599120645
* 微信群：扫描以下二维码一键入群

![image](https://user-images.githubusercontent.com/85264922/129677318-478498da-aa94-4563-b021-fdb088b7f598.png)
* 可在 [此处](http://bbs.decoyit.com/forum-44-1.html) 进行 BUG 反馈 :sunglasses:
