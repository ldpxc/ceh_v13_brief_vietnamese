Các kỹ thuật liệt kê (enumeration):

- Trích xuất tên người dùng bằng địa chỉ email (Email ID)
- Mật khẩu mặc định (default password)
- Tấn công dò (brute force) trên Active Directory (AD)
- Chuyển vùng DNS (DNS zone transfer) — sử dụng `dig`
- Trích xuất nhóm người dùng từ Windows
- Trích xuất tên người dùng bằng SNMP (SNMP — Simple Network Management Protocol)
- Trích xuất tài nguyên mạng và sơ đồ (topology) bằng SNMP

Dịch vụ và cổng cần liệt kê:

- TCP/UDP 53: DNS zone transfer
- TCP/UDP 135: MS RPC endpoint mapper (MS RPC endpoint mapper)
- UDP 137: NetBIOS Name Service (NBNS — NetBIOS Name Service)
- TCP 139: NetBIOS Session Service (SMB over NetBIOS)
- TCP/UDP 445: SMB over TCP (Direct Host) (SMB — Server Message Block)
- UDP 161: SNMP
- TCP/UDP 389: LDAP (LDAP — Lightweight Directory Access Protocol)
- TCP 2049: NFS (NFS — Network File System)
- TCP 25: SMTP (SMTP — Simple Mail Transfer Protocol)
- TCP/UDP 162: SNMP Trap
- UDP 500: ISAKMP / IKE (ISAKMP — Internet Security Association and Key Management Protocol; IKE — Internet Key Exchange)
- TCP 22: SSH / SFTP (SSH — Secure Shell; SFTP — SSH File Transfer Protocol)
- TCP/UDP 3268: Global Catalog Service
- TCP/UDP 5060, 5061: SIP (SIP — Session Initiation Protocol)
- TCP 20/21: FTP (FTP — File Transfer Protocol)
- TCP 23: Telnet
- UDP 69: TFTP (TFTP — Trivial File Transfer Protocol)
- TCP 179: BGP (BGP — Border Gateway Protocol)

**Liệt kê NetBIOS (NetBIOS enumeration):**
Cổng:
137 UDP — Name service
138 UDP — Datagram service
139 TCP — Session service
_Không hoạt động trên IPv6_

| Name      | NetBIOS Code | Type   | Thông tin thu được                         |
| --------- | ------------ | ------ | ------------------------------------------ |
| host name | <00>         | UNIQUE | Tên host                                   |
| domain    | <00>         | Group  | Tên domain                                 |
| host name | <03>         | UNIQUE | Dịch vụ Messenger                          |
| username  | <03>         | UNIQUE | Tên người dùng đang chạy dịch vụ Messenger |
| host name | <20>         | UNIQUE | Dịch vụ Server đang chạy                   |
| domain    | 1B           | UNIQUE | Domain Master browser name                 |
| domain    | 1E           | Group  | Browser service elections                  |

Công cụ:

- `nbtstat -m` — bảng local
- `nbtstat -A 10.10.10.10` — bảng hệ thống từ xa
- `nbtstat -c` — cache từ xa
- `PsExec` — liệt kê tài khoản người dùng
- `PsFile`

Liệt kê tài nguyên chia sẻ:

- `net view \\computername`
- `net view \\domain`

**Liệt kê SNMP (SNMP enumeration):**
Cổng:
UDP 161 — SNMP agent
UDP 162 — SNMP trap
Phiên bản:
v1 — không có bảo mật, chuỗi cộng đồng (community strings) plaintext
v2c — không có bảo mật nhưng nhanh hơn, vẫn plaintext
v3 — xác thực và mã hóa (auth + encryption), an toàn và được khuyến nghị
Công cụ:

- SNMPCheck
- Engineers Toolset
- SNMP Scanner
- OpUtils
- SNScan
- `snmpwalk -v1 -c public` — xem tất cả OID
- snmp-check
- SoftPerfect Network Scanner

Management Information Base (MIB):

- `DHCP.MIB` — giám sát lưu lượng giữa DHCP servers
- `HOSTMIB.MIB` — giám sát và quản lý tài nguyên host
- `LNMIB2.MIB` — chứa kiểu đối tượng cho dịch vụ workstation và server
- `MIB_II.MIB` — quản lý TCP/IP-based internet theo kiến trúc đơn giản
- `WINS.MIB` — cho Windows Internet Name Service (WINS)

- 🟢 **MIB-II = TCP/IP networking**
- 🟡 **HOSTMIB = hardware & system stats**
- 🔵 **LNMIB2 = Windows LAN Manager services**
- 🟣 **WINS.MIB = NetBIOS name database**
- 🟠 **DHCP.MIB = DHCP service only**

**Liệt kê LDAP (LDAP enumeration):**
Cổng:
TCP 389 — LDAP
TCP 636 — Secure LDAP
(Lightweight Directory Access Protocol)
Công cụ:

- `ldapsearch`
- AD Explorer
- Softerra LDAP Administrator
- nmap NSE script: `ldap-brute`

**Liệt kê NTP và NFS**

NTP (NTP — Network Time Protocol) Cổng:
UDP 123
Công cụ:

- `ntptrace`
- `ntpdc`
- `ntpq`

NFS Cổng:
2049
Công cụ:

- `rpcinfo -p` — kiểm tra cổng mở
- `showmount`
- `rpc-scan`
- SuperEnum

**Liệt kê SMTP và DNS**

SMTP Cổng:
TCP 25
Công cụ và kỹ thuật:

- Telnet để thử các lệnh SMTP:
  - `VRFY` — kiểm tra xem địa chỉ có tồn tại
  - `EXPN` — mở rộng mailing list thành từng người nhận
  - `RCPT TO` — chỉ định người nhận
- `telnet <email server>`
- Nmap, Metasploit, NetScanTools Pro
- `smtp-user-enum`

DNS enumeration (sử dụng zone transfer):
UDP 53
Công cụ:

- `dig ns` — lấy tất cả name servers
- `nslookup` — trên Windows: hosts, name servers, mail, v.v.
- `DNSRecon -t axfr -d` — thử zone transfer (AXFR)

DNS cache snooping:

- Phương pháp non-recursive — phản hồi với `root.hints` (`dig +norecurse`)
- Phương pháp recursive — kiểm tra TTL của bản ghi

DNSSEC zone walking — liệt kê zone bật DNSSEC
Công cụ: LDNS, DNSRecon, Knock, Raccoon, Turbolist3r

OWASP AMASS:

- `amass enum -d <domain>`

**Liệt kê IPSec**

- `nmap -sU -p 500`
- `ike-scan -M`

**VoIP enumeration:**

- `svmap`

**RPC enumeration:**

- `nmap -sR`
- `nmap -T4 -A`

**Liệt kê người dùng Unix/Linux**

- `rusers -a`, `rusers -l`, `rusers -u`, `rusers -i`
- `rwho -a`
- `finger -s`

**Liệt kê SMB:**

- `nmap -p 445 -A`
- `nmap -p 445 --script smb-protocols`
- `nmap -p 139 --script smb-protocols`
