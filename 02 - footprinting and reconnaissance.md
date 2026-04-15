## TCP/IP Networking

- Using switched networks reduces number of received frames that are not addressed to your system
- UDP - connectionless (không kết nối; không thiết lập phiên)
- ![[Pasted image 20250929104437.png]]

- UDP most used protocols - TFTP, DNS, DHCP
- TCP segment structure:
- ![[Pasted image 20250930110332.png]]
- SYN (Synchronize) - initial communication, negotiation of parameters and sequence numbers (cờ SYN: khởi tạo kết nối; thương lượng tham số và số thứ tự)
- ACK (Acknowledgement) - as an acknowledgement of SYN flags. Set on all segments after initial SYN flag (cờ ACK: dùng để xác nhận)
- RST (Reset) - forces termination of connection in both directions (cờ RST: buộc ngắt kết nối)
- FIN(finish) - Closes communications (cờ FIN: đóng kết nối)
- URG (Urgent) - indicates that data inside is being sent out of band, for example canceling message midstream (cờ URG: dữ liệu gửi ngoài luồng)
  SYN sequence number is random and increments with each packet sent, helps maintain legitimacy and uniqueness of this session. Plenty of attacks that can guess the sequence number.

**Ghi nhớ `three way handshake` và `TCP flags` cho kỳ thi**

![[Pasted image 20250930111156.png]]

Các công cụ tạo packet:

- NetScanTools
- Ostinato
- packETH
- LANforge FIRE
- Colasoft Packet Builder

SYN, SYN/ACK, ACK, FIN

IANA (Internet Assigned Numbers Authority — cơ quan phân bổ số hiệu Internet) maintains Service Name and Transport Protocol Port Number registry which is the official list of all port number reservations

## Footprinting/reconnaissance

Types of reconnaissance

- **Passive** - without direct interaction; OSINT (Open Source Intelligence — tình báo nguồn mở), databases, intelligence sharing
- **Active** - DNS interrogation, social engineering (kỹ thuật xã hội), port scanning etc

Google advanced search operators:

| Search operator | Purpose                                                        |
| --------------- | -------------------------------------------------------------- |
| [catche:]       | Hiển thị trang web trong bộ nhớ cache của Google               |
| [link:]         | Liệt kê các trang web có liên kết tới trang web chỉ định       |
| [related:]      | Liệt kê các trang web tương tự                                 |
| [info]          | Hiển thị một số thông tin mà Google có về một trang web cụ thể |
| [site:]         | Giới hạn kết quả cho domain đã cho                             |
| [allintitle:]   | Giới hạn kết quả cho các trang có tất cả từ khóa trong tiêu đề |
| [intitle:]      | Giới hạn cho tài liệu có từ khóa trong tiêu đề                 |
| [allinurl:]     | Giới hạn kết quả trong URL                                     |
| [inurl:]        | Tài liệu chứa từ khóa trong URL                                |
| [location:]     | Tìm thông tin cho vị trí cụ thể                                |

Meta search engines - Startpage, Metager, etools.ch | hides users ip address
FTP search engines - NAPALM FTP indexer, FreewareWeb, Mamont, globalfilesearch.com

Searching SCADA and IoT - Shodan, Censys, ZoomEye
(SCADA — Supervisory Control and Data Acquisition: hệ thống giám sát và thu thập dữ liệu)

top level domains and sub-domains- Netcraft, DNSdumpster, pentest-tools, sublist3r

photon- retrieve archived url's (thu hồi URL đã lưu trữ)

People search services - Spokeo

OS detection - Netcraft, Censys

Competitive intelligence gathering - EDGAR database, D&B Hoovers (sales intelligence), LexisNexis, BusinessWire, Factiva, MarketWatch, The Wall Street Transcript, Euromonitor, Experian, The Search Monitor, USPTO, ABI/INFORM Global, SimilarWeb, SeRanking

Public source code repos - ReconNG

Social networks - TheHarvester

- theHarvester -d microsoft -l 200 -b linkedin
  - `-d` specifies domain
  - `-b` specifies linkedin data source

harvesting email lists - `theHarvester -l 200` (giới hạn 200 kết quả)

Analyzing social media presence - BuzzSumo

Footprinting social networking sites - Sherlock, SocialSearcher

## Whois, DNS footprinting

WHOIS (tra cứu đăng ký tên miền)
Types of whois -

- Thick whois - stores complete whois info
- Thin whois - stores only name of whois server
- Decentralized whois - complete info and managed by independent entities

Regional Internet Registries (RIRs):

- ARIN — America
- AFRINIC — Africa
- APNIC — Asia Pacific
- RIPE — Europe
- LACNIC — Latin America and Caribbean

![[Pasted image 20251228210853.png]]

Geolocation - IP2Location

DNS

DNS Record types

| Record type | Label               | Description                                                                                        |
| ----------- | ------------------- | -------------------------------------------------------------------------------------------------- |
| A           | Address record      | Maps hostname to IPv4 (ánh xạ hostname tới địa chỉ IPv4)                                           |
| AAAA        | IPv6 address record | Maps hostname to IPv6                                                                              |
| MX          | Mail exchange       | Xác định mail server cho domain                                                                    |
| NS          | Name server         | Xác định authoritative name servers                                                                |
| CNAME       | Canonical name      | Map alias to true hostname (gán bí danh tới hostname thật)                                         |
| SOA         | Start of Authority  | Định nghĩa authority cho zone DNS (chứa tên server chịu trách nhiệm cho tất cả bản ghi trong zone) |
| SRV         | Service record      | Chỉ định vị trí dịch vụ (LDAP, SIP)                                                                |
| PTR         | Pointer record      | Reverse lookup - ánh xạ IP tới hostname (thường dùng cho email servers)                            |
| RP          | Responsible person  | Liệt kê admin/owner của domain                                                                     |
| HINFO       | Host information    | Lưu loại phần cứng và hệ điều hành                                                                 |
| TXT         | Text Record         | Lưu dữ liệu text cho DKIM và SPF                                                                   |

Tools

- Fierce - finds subdomains, dns misconfigurations, ip ranges, hostnames, internal naming patterns
- DNSRecon - DNS enumeration (liệt kê DNS), discover hosts and subdomains
- MXToolbox

Traceroute:
Tools:

- NetscanToolsPro
- PingPlotter

Email tracking tools:

- eMailTrackerPro
- IP2Location

## Social engineering

- Eavesdropping — nghe lén các cuộc hội thoại
- Shoulder surfing — quan sát mục tiêu một cách bí mật
- Dumpster diving — lục thùng rác để tìm thông tin
- Impersonation — mạo danh người có thẩm quyền

## Automating footprinting tasks

- Maltego — xác định mối quan hệ và liên kết thực tế
- Recon-ng — web reconnaissance framework (mã nguồn mở)
- FOCA — tool to find metadata and hidden information in scanned documents (tìm metadata và thông tin ẩn trong tài liệu quét)
- subfinder — subdomain discovery
- Osint framework
- Recon-dog — uses API's to collect information about target system (dùng API để thu thập thông tin về mục tiêu)
- BillCipher — various things: DNS lookup, WHOIS, port scanning, zone transfer, etc.

## Ports etc.

**Well known ports: 0-1023**
**Registered ports 1024-49,151**
**Dynamic ports 49,152-65,535**

Important port numbers:

| Port number | Protocol | Transport protocol |
| ----------- | -------- | ------------------ |
| 20/21       | FTP      | TCP                |
| 22          | SSH      | TCP                |
| 23          | Telnet   | TCP                |
| 25          | SMTP     | TCP                |
| 53          | DNS      | TCP and UDP        |
| 67          | DHCP     | UDP                |
| 69          | TFTP     | UDP                |
| 80          | HTTP     | TCP                |
| 88          | Kerberos | TCP                |
| 110         | POP3     | TCP                |
| 123         | NTP      | UDP                |
| 135         | MS RPC   | TCP                |
| 137-139     | NetBIOS  | TCP/UDP            |
| 143         | IMAP     | TCP                |
| 161/162     | SNMP     | UDP                |
| 178         | RTSP     | TCP/UDP            |
| 389         | LDAP     | TCP/UDP            |
| 443         | HTTPS    | TCP                |
| 445         | SMB      | TCP                |
| 514         | Syslog   | UDP/TCP            |

CurrPorts — Displays all open ports on your PC

Port states:

- CLOSE_WAIT — remote side of connection has closed the connection
- TIME_WAIT — your side has closed connection

`netstat` - hiển thị tất cả kết nối và cổng đang lắng nghe
`netstat -b` - hiển thị executable tied to the open port

IPv4 - unicast, multicast and broadcast

ICMP - Internet Control Message Protocol (Network layer)
ICMP message codes:
0: Echo Reply
3: Destination unreachable:
0- Destination network unreachable
1- Destination host unreachable
6- Network unknown
9- Network administratively prohibited
13- Communication administratively prohibited
4: Source quench
5: Redirect
8: Echo request
11: Time exceeded

Ping sweep - best way to find active machines on network, very noisy
Tools:

- Angry IP Scanner
- SolarWinds Engineer's Toolset
- Network Ping
- OpUtils
- Superscan
- Advanced IP Scanner
- Pinkie

Nmap scan through TOR

ARP:

- Ties IP to MAC address in network
- ARP scan in NMAP: `nmap -sn -PR 192.168.1.69`

Port scanners work by manipulating TCP flags to identify active hosts and scan their ports.

Port scan types:

- Full connect — TCP connect or full open scan: chạy `three-way handshake` trên cổng, sau đó đóng bằng RST. Dễ bị phát hiện nhất nhưng có thể đáng tin cậy. Open ports sẽ trả về SYN/ACK; closed trả về RST.

- Stealth — half-open scan hoặc SYN scan: chỉ gửi SYN. Ít bị chú ý hơn vì không hoàn thiện phiên.

- Inverse TCP flag — dùng FIN, URG hoặc PSH để kiểm tra cổng. Nếu cổng mở thường không có phản hồi; nếu đóng sẽ trả về RST/ACK.

- Christmas scan (XMAS) — bật tất cả flags; phản hồi giống inverse TCP scan. Không hiệu quả trên máy Windows.

- ACK flag probe — gửi cờ ACK và kiểm tra header trả về (TTL hoặc Window fields). Trong phương pháp TTL: nếu RST có TTL < 64 thì cổng được cho là mở. Trong phương pháp Window: nếu Window size khác 0 thì cổng được cho là mở. (Cũng có thể dùng để kiểm tra firewall: nếu RST trả về thì không có firewall)

- IDLE scan — spoofing một IP; cần một máy idle

NMAP

- Nmap without any options runs SYN scan; nmap remeber switches
- NetScanTools
- Hping3
- 224

MIB info - need to check
