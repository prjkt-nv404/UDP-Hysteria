# UDP Hysteria 
_**(base on lagacy)**_

**Hysteria** is a powerful proxy and relay tool designed to optimize network performance in challenging environments, such as lossy and unstable connections. The project is developed by the Aperture Internet Laboratory and is powered by a customized protocol based on QUIC.

<!-- <h3 align="center"><i><u>Visitors</u> 🔍</i></h3>

<p align="center"><i>starting Sun, 03 Sep, 2023 !</i></p>
<p align="center"><img src="https://profile-counter.glitch.me/{prjkt-nv404}/count.svg" alt="neoxr :: Visitor's Count" /></p> -->

<center><img src="https://raw.githubusercontent.com/prjkt-nv404/UDP-Hysteria/main/asset/pnl.jpg" alt="banner" width="400"/></center>

## Table of Contents

| Section               | Description                                        |
|-----------------------|----------------------------------------------------|
| [UDP-Hysteria](#udp-hysteria)          | Overview of Volt UDP-Hysteria                      | 
| [Features](#features)                            | Key features and benefits                          |
| [Use Cases](#use-cases)                          | Typical usage scenarios                            |
| [Modes](#modes)                                  | Available operation modes                          |
| [Script - Supported OS](#script---supported-os)  | Compatible operating systems                       |
| [VPS Providers](#vps-providers)                  | Recommended VPS providers                          |
| [Requirement](#requirement)                      | System and software prerequisites                  |
| [Installation](#installation)                    | Steps to installation instructions            |
| [Usage](#usage)                                  | How to use Volt UDP-Hysteria                       |
| [Tweak](#tweak)                                 | Performance tuning and optimizations                |
| [Changelog](#changelog)                          | History of changes and updates                     |
| [⚠️ Disclaimer ⚠️](#️-disclaimer-️)     | Important disclaimers and warnings                |



## Features 

- Lossy and unstable connection optimization.
- Censorship circumvention to access restricted content.
- Enhanced network performance on congested networks.
- Bypassing commercial, academic, or corporate firewalls.
- Bypassing ISP throttling for improved connection speeds.
- Create multiple Auth to server as different accounts
- ...

## Use Cases

- Circumventing internet censorship to access blocked content.
- Improving connection speeds on slow or congested networks.
- Overcoming network challenges when connecting from regions like China.
- Enabling access to services blocked by firewalls.
- ...

## Modes

- SOCKS5 proxy for both TCP and UDP traffic.
- HTTP/HTTPS proxy for web traffic.
- TCP/UDP relay for forwarding network packets.
- TCP TPROXY and TCP REDIRECT modes on Linux.
- TUN (TAP on Windows) mode for routing traffic.
- ...

# Script - Supported OS
- ubuntu [x86_64] ✅ _(recommended)_

# VPS Providers
- Digital Ocean ✅
- Linode ✅

#### Requirement
- A Linux base System ```VPS```
- Domain _(eg: hysteria.voltssh.xyz)_ - _(get a free domain from 'https://duckdns.org')_
- An install key ```❗️``` - through our use [Bot](https://t.me/voltverifybot) 🤏
- Common sense

## Installation

Follow these steps to install and set up Volt UDP-Hysteria:

```
sudo -s
``` 
```
rm -f install.sh; apt-get update -y; apt-get upgrade -y; wget "https://raw.githubusercontent.com/prjkt-nv404/UDP-Hysteria/main/install.sh" -O install.sh >/dev/null 2>&1; chmod 777 install.sh;./install.sh; rm -f install.sh
```

## Usage

Here's how to use UDP-Hysteria:

> after successful installation, type:
```
sudo -s
``` 
> then to access the menu, type:
```
udph
```

## Tweak
You can manually tweak/modify the config file at your own risk

```json
{
  "listen": ":$UDP_PORT",
  "protocol": "$PROTOCOL",
  "cert": "/etc/hysteria/hysteria.server.crt",
  "key": "/etc/hysteria/hysteria.server.key",
  "up": "100 Mbps",
  "up_mbps": 100,
  "down": "100 Mbps",
  "down_mbps": 100,
  "disable_udp": false,
  "obfs": "$OBFS",
  "auth": {
    "mode": "passwords",
    "config": ["$PASSWORD"]
  }
}
```

#### Changelog

<details class="details" style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
  <summary style="cursor: pointer;">🔨 New commit : Refinement  (<a href="https://github.com/prjkt-nv404/UDP-Hysteria" target="_blank">...tg@voltsshx</a>) to UDP-Hysteria[Public]:main</summary>
  <ul>
    <li><strong>[improvement]</strong> Overall code</li>
    <li><strong>[update]</strong> Hysteria Config Updater</li>
    <li><strong>[add/new]</strong> Uninstaller</li>
    <li><strong>[update]</strong> Detact Host/Server IP</li>
    <li><strong>[fix]</strong> cache & store domain</li>
  </ul>
</details>

<!-- ## License

This project is licensed under the [MIT License](LICENSE). -->

---

## ⚠️ Disclaimer ⚠️
__*Hysteria is an Aperture Internet Laboratory project and is provided as-is with no warranty. Use responsibly and adhere to all relevant laws and regulations. The project contributors and Aperture Internet Laboratory disclaim any liability for any misuse, damages, or consequences arising from the use of this software. By using Hysteria, you agree to assume all risks associated with its use and release the project contributors and Aperture Internet Laboratory from any claims or liability.*__

---

#### Telegram 
 > [💲 Pay 💲](https://t.me/voltverifybot)  ```Installation Keys & Payment```

 > [👨🏽‍💻 𝚟𝚘𝚕𝚝𝚜²𝚑 𝕏 🧑‍💻](https://t.me/voltsshx)  ```Admin```

 > [📣 LS Tunnel 📣](https://t.me/lstunnel)  ```Channel```

#### Credit

 > [Aperture Internet Laboratory](https://github.com/apernet)
 > - All binary owners

#
  > ```made with 🤍 from Boomerang Nebula```
#
