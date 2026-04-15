## Mạng TCP/IP

- Sử dụng mạng chuyển mạch (switched networks) giảm số khung (frame) nhận được không dành cho hệ thống của bạn.
- UDP — không kết nối (connectionless).
- ![[Pasted image 20250929104437.png]]

- Các giao thức hay dùng qua UDP: TFTP, DNS, DHCP.
- Cấu trúc phân đoạn TCP (TCP segment structure):
- ![[Pasted image 20250930110332.png]]
- `SYN` (Synchronize) — khởi tạo liên lạc, thương thảo tham số và số thứ tự (sequence numbers).
- `ACK` (Acknowledgement) — phản hồi cho `SYN`. Được đặt trên mọi phân đoạn sau khi `SYN` ban đầu.
- `RST` (Reset) — buộc chấm dứt kết nối theo cả hai hướng.
- `FIN` (Finish) — đóng kết nối.
- `URG` (Urgent) — báo hiệu dữ liệu đang được gửi ngoài luồng (out‑of‑band), ví dụ huỷ thông điệp giữa chừng.

Số thứ tự SYN (SYN sequence number) là ngẫu nhiên và tăng theo mỗi gói được gửi, giúp đảm bảo tính hợp lệ và duy nhất cho phiên (session). Có nhiều cuộc tấn công cố gắng đoán số thứ tự này.

**Ghi nhớ: three‑way handshake và các cờ TCP cho kỳ thi**

![[Pasted image 20250930111156.png]]

Công cụ tạo gói (Packet crafting tools):

- NetScanTools
- Ostinato
- packETH
- LANforge FIRE
- Colasoft Packet Builder

Các trạng thái liên quan: `SYN`, `SYN/ACK`, `ACK`, `FIN`.

IANA duy trì registry tên dịch vụ / giao thức / số cổng — danh sách chính thức các đăng ký số cổng.

## Thu thập dấu vết / trinh sát (Footprinting / Reconnaissance)

Các loại trinh sát:

- Thụ động (Passive) — không tương tác trực tiếp: OSINT, cơ sở dữ liệu, chia sẻ thông tin tình báo.
- Chủ động (Active) — tra cứu DNS, social engineering, quét cổng (port scanning), v.v.

Google advanced search operators:

| Search operator | Mục đích (Purpose)                                                                |
| --------------- | --------------------------------------------------------------------------------- |
| `cache:`        | Hiển thị trang web được Google lưu cache (Displays webpages in Google cache)      |
| `link:`         | Liệt kê trang web có liên kết tới trang web chỉ định (Lists pages linking to URL) |
| `related:`      | Liệt kê các trang tương tự (Lists similar pages)                                  |
| `info:`         | Hiển thị một số thông tin Google lưu về một trang (Presents info Google has)      |
| `site:`         | Giới hạn kết quả trong một tên miền (Restricts results to domain)                 |
| `allintitle:`   | Tìm trang có tất cả từ khóa trong tiêu đề (Restricts to titles)                   |
| `intitle:`      | Tìm trang có từ khóa trong tiêu đề (Restricts to titles)                          |
| `allinurl:`     | Giới hạn URL chứa tất cả từ khóa (Restricts to URL)                               |
| `inurl:`        | Tìm tài liệu có từ khóa trong URL (Documents containing keyword in URL)           |
| `location:`     | Tìm thông tin cho vị trí cụ thể (Find information for specific location)          |

Meta search engines — Startpage, Metager, etools.ch (che dấu địa chỉ IP người dùng).

Công cụ tìm kiếm FTP — NAPALM FTP indexer, FreewareWeb, Mamont, globalfilesearch.com.

Tìm kiếm SCADA và IoT — Shodan, Censys, ZoomEye.

Tìm tên miền cấp cao và subdomains — Netcraft, DNSdumpster, Pentest‑Tools, Sublist3r.

`photon` — thu hồi các URL đã lưu trữ (retrieve archived URLs).

Dịch vụ tìm kiếm người — Spokeo.

Phát hiện hệ điều hành (OS detection) — Netcraft, Censys.

Thu thập thông tin cạnh tranh — EDGAR database, D&B Hoovers, LexisNexis, BusinessWire, Factiva, MarketWatch, The Wall Street Transcript, Euromonitor, Experian, The Search Monitor, USPTO, ABI/Inform, SimilarWeb, SeRanking.

Kho mã nguồn công khai — ReconNG.

Mạng xã hội / thu thập từ mạng xã hội — TheHarvester

- Ví dụ: `theHarvester -d microsoft -l 200 -b linkedin`
  - `-d` chỉ domain
  - `-b` chỉ nguồn dữ liệu (ví dụ `linkedin`)

Thu thập danh sách email — `theHarvester -l 200` (giới hạn 200 kết quả).

Phân tích mạng xã hội — BuzzSumo.

Footprinting trên mạng xã hội — Sherlock, SocialSearcher.

## WHOIS, DNS footprinting

WHOIS

- Các loại WHOIS:
  - Thick WHOIS — lưu trữ đầy đủ thông tin WHOIS.
  - Thin WHOIS — chỉ lưu tên máy chủ WHOIS.
  - Decentralized WHOIS — thông tin được quản lý phân tán bởi các thực thể độc lập.

Các Regional Internet Registries (RIR):

- ARIN — Bắc Mỹ
- AFRINIC — Châu Phi
- APNIC — Châu Á Thái Bình Dương
- RIPE — Châu Âu
- LACNIC — Mỹ Latinh và Caribe

![[Pasted image 20251228210853.png]]

Định vị địa lý (Geolocation) — IP2Location.

DNS

Các loại bản ghi DNS (DNS Record types):

| Loại bản ghi (Record type) | Nhãn (Label)        | Mô tả (Description)                                                                              |
| -------------------------- | ------------------- | ------------------------------------------------------------------------------------------------ |
| A                          | Address record      | Map hostname tới IPv4                                                                            |
| AAAA                       | IPv6 address record | Map hostname tới IPv6                                                                            |
| MX                         | Mail exchange       | Xác định mail server cho domain                                                                  |
| NS                         | Name server         | Xác định name server có thẩm quyền                                                               |
| CNAME                      | Canonical name      | Gán bí danh (alias) tới hostname thực sự                                                         |
| SOA                        | Start of Authority  | Định nghĩa authority cho zone (chứa tên server chịu trách nhiệm cho các bản ghi trong namespace) |
| SRV                        | Service record      | Chỉ định vị trí dịch vụ (ví dụ LDAP, SIP)                                                        |
| PTR                        | Pointer record      | Reverse lookup — ánh xạ IP tới hostname (thường cho mail server)                                 |
| RP                         | Responsible person  | Liệt kê admin/chủ sở hữu của domain                                                              |
| HINFO                      | Host information    | Lưu trữ loại phần cứng và hệ điều hành                                                           |
| TXT                        | Text Record         | Lưu trữ văn bản cho DKIM và SPF                                                                  |

Công cụ DNS:

- Fierce — tìm subdomain, cấu hình DNS sai, phạm vi IP, hostname, mẫu đặt tên nội bộ.
- DNSRecon — liệt kê DNS, phát hiện host và subdomain.
- MXToolbox — kiểm tra bản ghi MX và dịch vụ mail.

Traceroute
Công cụ:

- NetScanToolsPro
- PingPlotter

Công cụ theo dõi email:

- eMailTrackerPro
- IP2Location

## Social engineering

- Eavesdropping — nghe lén các cuộc hội thoại.
- Shoulder surfing — quan sát mục tiêu bí mật.
- Dumpster diving — lục thùng rác tìm thông tin.
- Impersonation — giả danh người có thẩm quyền.

## Tự động hóa tác vụ footprinting

- Maltego — xác định mối quan hệ và liên kết thực tế.
- Recon‑ng — framework trinh sát web mã nguồn mở.
- FOCA — tìm metadata và thông tin ẩn trong tài liệu quét.
- subfinder — phát hiện subdomain.
- OSINT Framework — tập hợp công cụ OSINT.
- Recon‑dog — dùng API để thu thập thông tin về mục tiêu.
- BillCipher — tra cứu DNS, WHOIS, quét cổng, zone transfer, v.v.

## Cổng (Ports) và phân loại

- Well‑known ports: 0–1023
- Registered ports: 1024–49151
- Dynamic/Private ports: 49152–65535

Các port quan trọng:

| Port number | Protocol | Transport protocol |
| ----------- | -------- | ------------------ |
| 20/21       | FTP      | TCP                |
| 22          | SSH      | TCP                |
| 23          | Telnet   | TCP                |
| 25          | SMTP     | TCP                |
| 53          | DNS      | TCP và UDP         |
| 67          | DHCP     | UDP                |
| 69          | TFTP     | UDP                |
| 80          | HTTP     | TCP                |
| 88          | Kerberos | TCP                |
| 110         | POP3     | TCP                |
| 123         | NTP      | UDP                |
| 135         | MS RPC   | TCP                |
| 137–139     | NetBIOS  | TCP/UDP            |
| 143         | IMAP     | TCP                |
| 161/162     | SNMP     | UDP                |
| 178         | RTSP     | TCP/UDP            |
| 389         | LDAP     | TCP/UDP            |
| 443         | HTTPS    | TCP                |
| 445         | SMB      | TCP                |
| 514         | Syslog   | UDP/TCP            |

`CurrPorts` — hiển thị tất cả các cổng mở trên máy tính của bạn.

Trạng thái cổng (Port states):

- `CLOSE_WAIT` — phía từ xa đã đóng kết nối.
- `TIME_WAIT` — phía của bạn đã đóng kết nối.

`netstat` — hiển thị tất cả kết nối và cổng đang lắng nghe.
`netstat -b` — hiển thị executable liên kết với cổng mở.

IPv4 — hỗ trợ unicast, multicast và broadcast.

ICMP — Internet Control Message Protocol (lớp mạng).
Mã thông điệp ICMP:

- 0: Echo Reply
- 3: Destination unreachable (các mã phụ: 0: network unreachable, 1: host unreachable, 6: network unknown, 9: administratively prohibited, 13: communication administratively prohibited)
- 4: Source quench
- 5: Redirect
- 8: Echo request
- 11: Time exceeded

Ping sweep — cách tốt để tìm máy còn hoạt động trong mạng, nhưng rất ồn ào (noisy).
Công cụ:

- Angry IP Scanner
- SolarWinds Engineer’s Toolset
- Network Ping
- OpUtils
- Superscan
- Advanced IP Scanner
- Pinkie

Quét Nmap qua TOR (Nmap scan through TOR).

ARP

- ARP liên kết IP tới địa chỉ MAC trong mạng.
- Quét ARP trong Nmap: `nmap -sn -PR 192.168.1.69`.

Port scanners hoạt động bằng cách điều khiển các cờ TCP để xác định host hoạt động và quét cổng.

Các kiểu quét cổng (Port scan types):

- Full connect (TCP connect / full open scan) — chạy qua three‑way handshake trên cổng, sau đó kết thúc bằng `RST`. Dễ bị phát hiện nhưng đáng tin cậy; cổng mở phản hồi `SYN/ACK`, cổng đóng trả `RST`.
- Stealth (half‑open / SYN scan) — chỉ gửi `SYN`. Ít bị chú ý hơn vì không hoàn tất kết nối.
- Inverse TCP flag — dùng `FIN`, `URG` hoặc `PSH` để kiểm tra cổng. Nếu cổng mở thường không có phản hồi; nếu đóng thì trả `RST/ACK`.
- Christmas scan (XMAS) — bật tất cả các cờ; phản hồi tương tự inverse TCP scan. Không hiệu quả trên hệ thống Microsoft.
- ACK flag probe — gửi cờ `ACK` và kiểm tra header trả về (TTL hoặc trường Window). Dùng để kiểm tra firewall (nếu trả `RST` thì không có firewall giữa bạn và host).
- IDLE scan — spoof IP; cần một máy ở trạng thái idle.

Nmap

Các công cụ liên quan:

- Nmap
- NetScanTools
- Hping3

MIB info — cần kiểm tra.
