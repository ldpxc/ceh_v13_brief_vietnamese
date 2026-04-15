## Intro

Tools - metasploit, nmap, hping3

TCP communication flags

| SYN | Bắt đầu kết nối TCP; cờ khởi tạo (thuộc `three-way handshake`) |
| --- | -------------------------------------------------------------- |
| ACK | Xác nhận cờ SYN; được đặt trên mọi segment sau SYN ban đầu     |
| FIN | Đóng kết nối một cách trơn tru                                 |
| RST | Ép kết thúc kết nối                                            |
| PSH | Ép giao dữ liệu được đẩy ngay                                  |
| URG | Đánh dấu dữ liệu là ưu tiên, gửi ngoài băng thông chính        |

Colasoft Packet Builder

Nmap

Hping3:
hping3 -1 0.0.0.0 ping sweep | ICMP ping
hping3 -A 10.10.10.10 -p 80 ACK scan on port 80
hping3 -2 0.0.0.0 -p 80 UDP scan port 80
hping3 10.10.10.10 -Q -p 139 Collecting initial sequence number
hping3 -S 10.10.10.10 -p 80 --tcp--timestamp
hping3 -8 50-60 -S 10.10.10.10 -V SYN scan on port 50-60
hping3 -F -P -U 10.10.10.10 -P 80 fin, push and urg scan
hping3 -1 10.0.1.x --rand-dest -I eth0 scan entire subnet for live host
hping3 -9 HTTP -I eth0 Intercept traffic containing http signature
hping3 -S 10.10.1.1 -a 192.168.1.254 -p 22 --flood syn flood a victim

| Flag           | Meaning        |
| -------------- | -------------- |
| `-S`           | SYN            |
| `-A`           | ACK            |
| `-F`           | FIN            |
| `-R`           | RST            |
| `-P`           | PUSH           |
| `-U`           | URG            |
| `-p`           | Port           |
| `-c`           | Packet count   |
| `-i`           | Interval       |
| `--flood`      | Max rate send  |
| `--traceroute` | TCP traceroute |

Metasploit,
NetScanTools Pro - discover devices on network

## Scanning techniques for host discovery

Host discovery Techniques
nmap -sn !!host discovery only
ARP ping scan - local only
nmap -PR 192.168.1.0/24 or nmap -sn (-Pr ARP request)
(can't use hping3)

UDP ping scan - nmap -sn -PU

ICMP ECHO Ping scan - nmap -sn -P (-L number of pings, -T ping timeout)

ICMP Timestamp ping scan - nmap -sn -PP get current time from machine

ICMP address masking ping scan - nmap -sn -PM get subnet mask

TCP SYN scan - nmap -sn -PS scan paralleled machines, can detect ONLINE MACHINE WITHOUT CREATING CONNECTION

TCP ACK ping scan - nmap -PA - uses default port 80; dùng để tăng cơ hội vượt qua firewall

IP protocol ping scan - nmap -sn -PO sends different probe packets; bất kỳ phản hồi nào cũng chỉ rằng host đang online

Ping sweep tools:

Angry IP Scanner
SolarWinds Engineer’s Toolset (https://www.solarwinds.com) ▪ NetScanTools Pro (https://www.netscantools.com) ▪ Colasoft Ping Tool (https://www.colasoft.com) ▪ Advanced IP Scanner (https://www.advanced-ip-scanner.com) ▪ OpUtils (https://www.manageengine.com)

## Port and service discovery

MUST KNOW
Ports
Well known ports 0-1023
Registered ports 1024-49,141
Dynamic ports 49,152-65,535

20/21 FTP  
22 SSH  
23 Telnet  
25 SMTP  
53 DNS  
67/68 DHCP  
69 TFTP  
80 HTTP  
110 POP3  
123 NTP  
135 RPC  
137–139 NetBIOS  
143 IMAP  
161 SNMP  
389 LDAP  
443 HTTPS  
445 SMB  
500 ISAKMP  
514 Syslog  
1433 MSSQL  
3306 MySQL  
3389 RDP  
5060 SIP

Port scan types:

TCP Connect/full open scan -> nếu cổng mở, handshake hoàn tất; nếu đóng sẽ nhận RST. `nmap -sT -v`

Stealth scan (half open scan) - reset kết nối TCP một cách đột ngột, không hoàn thành handshake
`nmap -sS` (thanh thản hơn so với `-sT`)

Inverse TCP scan: gửi tổ hợp TCP flags không tiêu chuẩn để tránh IDS (không hiệu quả trên Windows; thường dùng trên Unix)

- Xmas scan: đặt FIN, URG và PSH (sử dụng `nmap -sX`; tương tự `-sF` và `-sN` cho FIN và NULL scan)

- TCP maimon: gửi FIN và ACK; nếu cổng đóng sẽ trả về RST (`nmap -sM`)

- ACK flag probe scan - gửi cờ ACK và xem TTL; nếu RST có TTL < 64 thì cổng được cho là mở; phương pháp Window: nếu Window size khác 0 thì cổng được cho là mở. (Cũng dùng để kiểm tra firewall: nếu nhận RST thì không có firewall)

- !important! IDLE/IPID scan - dùng spoofed source address; sử dụng một máy zombie trung gian (`nmap -sI zombieIP targetIP`) (zombie là host "nhàn rỗi")

- UDP scan - gửi datagram tới cổng; nếu phản hồi ICMP unreachable (type 3 code 3) thì cổng đóng; không có phản hồi nhiều khi chỉ ra cổng mở hoặc được lọc

- SSDP scan - UpnP scan

`nmap -sS -A -f 172.17.15.12` có thể phân mảnh một SYN scan (vừa thực hiện OS fingerprinting)

Scan responses:
| Flag | open | closed | Filtered | Unfiltered (reachable path) |
| ---- | ----------------------------------- | ------------------------------- | ------------------------------- | --------------------------- |
| -sT | SYN-ACK | RST | No reply/ICMP unreachable | |
| -sS | SYN-ACK | RST | No reply/ICMP unreachable | |
| -sA | | | No Reply | RST |
| -sI | IPID increases (RST sent by zombie) | IPID unchanged | unclear/ odd changes | |
| -sU | no response | ICMP unreachable, type 3 code 3 | other icmp unreachable/no reply | |
| -sN | no response | RST | ICMP | |
| -sF | no response | RST | ICMP | |
| -sX | no response | RST | ICMP | |
| -sM | no response | RST | ICMP | |

## Nmap Scan Types

| Switch | Description                     |
| ------ | ------------------------------- |
| -sA    | ACK scan                        |
| -sF    | FIN scan                        |
| -sI    | IDLE (Zombie) scan              |
| -sL    | List (DNS resolution only) scan |
| -sN    | NULL scan                       |
| -sO    | Protocol scan                   |
| -sP    | Ping scan _(old, now -sn)_      |
| -sR    | RPC scan                        |
| -sS    | SYN (Stealth/Half-open) scan    |
| -sT    | TCP Connect scan                |
| -sW    | Window scan                     |
| -sX    | XMAS scan                       |

## Host Discovery (Ping Types)

| Switch | Description                        |
| ------ | ---------------------------------- |
| -PI    | ICMP Echo ping                     |
| -PS    | TCP SYN ping                       |
| -PT    | TCP ping                           |
| -PO    | IP Protocol ping (no TCP/UDP/ICMP) |

## Output Options

| Switch | Description        |
| ------ | ------------------ |
| -oN    | Normal text output |
| -oX    | XML output         |

## Timing Templates

| Switch | Description                |
| ------ | -------------------------- |
| -T0    | Serial — slowest, paranoid |
| -T1    | Serial — very slow         |
| -T2    | Serial — polite            |
| -T3    | Parallel — normal speed    |
| -T4    | Parallel — fast            |
| -T5    | Parallel — insane speed    |

Hping3

## Hping3 Scan & Mode Switches

| Switch    | Description                                                                                                                       |
| --------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `-1`      | ICMP mode (ICMP ping). Example: `hping3 -1 172.17.15.12`                                                                          |
| `-2`      | UDP mode. Example: `hping3 -2 192.168.12.55 -p 80`                                                                                |
| `-8`      | Scan mode (port scan). Accepts single, range, or `all`. Example: `hping3 -8 20-100`                                               |
| `-9`      | Listen mode. Triggers on a signature. Example: `hping3 -9 HTTP -I eth0`                                                           |
| `--flood` | Sends packets as fast as possible (no reply display). Useful for DoS simulation. Example: `hping3 -S 192.168.10.10 -p 22 --flood` |
| `-Q`      | Collect TCP sequence numbers to analyze predictability. Example: `hping3 172.17.15.12 -Q -p 139 -s`                               |

---

## Hping3 TCP Flag Switches

| Switch | Description                      |
| ------ | -------------------------------- |
| `-F`   | Set FIN flag                     |
| `-S`   | Set SYN flag                     |
| `-R`   | Set RST flag                     |
| `-P`   | Set PSH flag                     |
| `-A`   | Set ACK flag                     |
| `-U`   | Set URG flag                     |
| `-X`   | Set Xmas (FIN + PSH + URG) flags |

Spoofing packets tools: Hping, Scapy, Komodia, Ettercap, Cain.

G-zapper - remove Google tracking cookie
Service version discovery

---

`nmap -sV`

## OS Discovery banner grabbing

Active banner grabbing

Identify by TTL (giá trị TTL mặc định thường thấy)
Linux 64
Windows 128
FreeBSD 64
OpenBSD 255
Cisco 255
Solaris 255
AIX 255

OS discovery with `nmap -O`
Using nmap script engine `--script` or `-sC`
IPv6 nmap `-6 -O 69.69.69.69`

## Scanning beyond firewall

Packet Fragmentation ▪ Source Routing ▪ Source Port Manipulation ▪ IP Address Decoy ▪ IP Address Spoofing ▪ MAC Address Spoofing ▪ Creating Custom Packets ▪ Randomizing Host Order ▪ Sending Bad Checksums ▪ Proxy Servers ▪ Anonymizers

packet fragmentation:
`nmap -sS -t4 -A -f -v`

ip address spoofing: `hping3 www.certifiedhacker.com -a 7.7.7.7`
