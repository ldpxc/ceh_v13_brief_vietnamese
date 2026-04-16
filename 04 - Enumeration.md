## Các kỹ thuật liệt kê (enumeration):

- **Trích xuất tên người dùng bằng địa chỉ email (Email ID)**: Mọi địa chỉ email đều chứa hai phần là tên người dùng và tên miền, theo định dạng `username@domainname`.
- **Mật khẩu mặc định (default passwords)**: Nhiều nguồn trực tuyến cung cấp danh sách mật khẩu mặc định do nhà sản xuất gán cho sản phẩm của họ. Người dùng thường bỏ qua khuyến nghị thay đổi mật khẩu mặc định, điều này tạo thuận lợi cho kẻ tấn công liệt kê và khai thác hệ thống.
- **Tấn công dò (brute force) trên Active Directory (AD)**: Microsoft Active Directory dễ bị liệt kê tên người dùng tại thời điểm xác minh đầu vào do lỗi thiết kế. Nếu người dùng bật tính năng “logon hours”, các nỗ lực xác thực dịch vụ sẽ trả về các thông báo lỗi khác nhau. Kẻ tấn công lợi dụng điều này để trích xuất tên người dùng hợp lệ, sau đó tiến hành brute-force.
- **Chuyển vùng DNS (DNS zone transfer)**: Nếu quản trị viên cấu hình máy chủ DNS không đúng cách, kẻ tấn công có thể sử dụng các lệnh như `nslookup` và `dig` để thực hiện chuyển vùng. Qua đó, chúng thu được danh sách tất cả các máy chủ có tên, các vùng phụ (sub-zones) và địa chỉ IP liên quan.
- **Trích xuất nhóm người dùng từ Windows**: Kẻ tấn công cần có một ID đã đăng ký với tư cách là người dùng trong AD. Sau đó, chúng có thể trích xuất thông tin từ các nhóm mà người dùng là thành viên bằng giao diện Windows hoặc dòng lệnh.
- **Trích xuất tên người dùng bằng SNMP**: Kẻ tấn công có thể dễ dàng đoán các chuỗi cộng đồng (community strings) dạng read-only hoặc read-write bằng cách sử dụng API của SNMP để trích xuất tên người dùng.
- **Trích xuất tài nguyên mạng và sơ đồ (topology) bằng SNMP**: Kẻ tấn công có thể truy vấn cây SNMP một cách có phương pháp để thu thập thông tin chi tiết về tài nguyên và cấu trúc liên kết mạng.

### Dịch vụ và cổng cần liệt kê:

- **TCP/UDP 53 - DNS Zone Transfer**: Máy chủ DNS sử dụng UDP làm giao thức mặc định, nhưng đối với các truy vấn dài mà UDP thất bại, TCP sẽ được sử dụng làm giải pháp dự phòng. Các phần mềm độc hại (như ADM worm, Bonk Trojan) sử dụng cổng 53 để khai thác lỗ hổng trong DNS.
- **TCP/UDP 135 - MS RPC Endpoint Mapper**: Lắng nghe trên cổng 135. Một lỗ hổng trong việc xử lý sai các thông điệp có định dạng kém có thể cho phép kẻ tấn công gửi thông điệp RPC để khởi chạy tấn công Từ chối dịch vụ (DoS).
- **UDP 137 - NetBIOS Name Service (NBNS)**: Hay còn gọi là WINS, cung cấp dịch vụ phân giải tên. Thường dùng UDP 137 làm giao thức truyền tải _(đôi khi có thể dùng TCP 137 nhưng hiếm gặp trong thực tế)._
- **TCP 139 - NetBIOS Session Service (SMB over NetBIOS)**: Cổng Windows nổi tiếng nhất dùng để truyền tệp, thiết lập phiên null, chia sẻ tệp và máy in. Cấu hình sai có thể dẫn đến hệ thống bị truy cập vào các tệp hệ thống quan trọng trái phép.
- **TCP/UDP 445 - SMB over TCP (Direct Host)**: Lưu lượng chia sẻ tệp và máy in bằng giao thức SMB được lưu trữ trực tiếp trên TCP (thay vì qua NetBIOS như các HĐH cũ).
- **UDP 161 - SNMP (Simple Network Management Protocol)**: Dùng để giám sát các thiết bị mạng. Agent nhận yêu cầu trên cổng 161 từ manager và phản hồi trên cổng 162.
- **TCP/UDP 389 - LDAP (Lightweight Directory Access Protocol)**: Giao thức để truy cập và duy trì thông tin thư mục phân tán (như AD).
- **TCP 2049 - NFS (Network File System)**: Máy chủ NFS lắng nghe trên TCP 2049. Cấu hình sai có thể giúp kẻ tấn công chiếm quyền kiểm soát hệ thống, leo thang đặc quyền, hoặc tiêm mã độc.
- **TCP 25 - SMTP (Simple Mail Transfer Protocol)**: Giao thức gửi thư TCP/IP. Các lệnh thường dùng để liệt kê gồm: `HELO`, `MAIL FROM`, `RCPT TO`, `DATA`, `VRFY`, `EXPN`.
- **TCP/UDP 162 - SNMP Trap**: Dùng để gửi thông báo (như `sysUpTime`) từ một agent đến một manager.
- **UDP 500 - ISAKMP / IKE (Internet Key Exchange)**: Thiết lập, đàm phán, sửa đổi và xóa các liên kết bảo mật (SA) và khóa mã hóa trong mạng ảo riêng (VPN/IPsec).
- **TCP 22 - SSH / SFTP**: SSH dùng để quản lý an toàn thiết bị, còn SFTP trao đổi dữ liệu an toàn. Kẻ tấn công có thể brute-force SSH hoặc liệt kê SFTP để thu thập quyền thư mục/tài khoản.
- **TCP/UDP 3268 - Global Catalog Service**: Máy chủ của Microsoft lưu trữ thông tin bổ sung cho toàn bộ tổ chức thay vì chỉ một domain. Quản trị viên kết nối bằng LDP để khắc phục sự cố.
- **TCP/UDP 5060, 5061 - SIP (Session Initiation Protocol)**: Giao thức điện thoại Internet cho các cuộc gọi thoại/video. Cổng 5060: lưu lượng không mã hóa, cổng 5061: lưu lượng mã hóa (TLS).
- **TCP 20/21 - FTP (File Transfer Protocol)**: TCP 21 để điều khiển và TCP 20 (hoặc cổng động) để truyền dữ liệu. Kẻ tấn công liệt kê để tìm phiên bản phần mềm, sniffing/brute-force.
- **TCP 23 - Telnet**: Giao thức không an toàn truyền thông tin xác thực dưới dạng văn bản thuần túy (cleartext).
- **UDP 69 - TFTP (Trivial File Transfer Protocol)**: Giao thức không kết nối, thường dùng cập nhật phần mềm/firmware trên thiết bị từ xa. Dễ bị lợi dụng để cài mã độc.
- **TCP 179 - BGP (Border Gateway Protocol)**: Dùng bởi ISP để duy trì bảng định tuyến lớn. Cấu hình sai có thể dẫn đến tấn công từ điển, cạn kiệt tài nguyên hoặc không tặc (hijacking).

### **Liệt kê NetBIOS (NetBIOS enumeration):**

NetBIOS sử dụng chuỗi 16 ký tự ASCII để nhận dạng thiết bị mạng (15 ký tự cho tên thiết bị, ký tự thứ 16 dành riêng cho loại dịch vụ/bản ghi).
_(Lưu ý: NetBIOS không được Microsoft hỗ trợ phân giải tên cho IPv6)_

**Cổng hoạt động:**

- **137 UDP** — Name service
- **138 UDP** — Datagram service
- **139 TCP** — Session service

| Name          | NetBIOS Code | Type   | Thông tin thu được                                       |
| :------------ | :----------- | :----- | :------------------------------------------------------- |
| `<host name>` | `<00>`       | UNIQUE | Hostname (Tên host)                                      |
| `<domain>`    | `<00>`       | GROUP  | Domain name (Tên domain)                                 |
| `<host name>` | `<03>`       | UNIQUE | Dịch vụ Messenger đang chạy cho máy tính                 |
| `<username>`  | `<03>`       | UNIQUE | Dịch vụ Messenger đang chạy cho người dùng đã đăng nhập  |
| `<host name>` | `<20>`       | UNIQUE | Dịch vụ Server đang chạy                                 |
| `<domain>`    | `<1D>`       | GROUP  | Master browser name (Tên trình duyệt chủ cho subnet)     |
| `<domain>`    | `<1B>`       | UNIQUE | Domain master browser name (Xác định PDC cho domain)     |
| `<domain>`    | `<1E>`       | GROUP  | Browser service elections (Bầu chọn dịch vụ trình duyệt) |

### Công cụ:

- **`nbtstat -n`** — hiển thị các tên được đăng ký cục bộ (bảng local). _(Lưu ý ngoài nguồn: Lệnh hiển thị bảng local là `-n` theo tài liệu chuẩn, không phải `-m` như công cụ khác)_
- **`nbtstat -a <remotename>`** hoặc **`nbtstat -A <IP>`** — hiển thị bảng tên NetBIOS của hệ thống từ xa
- **`nbtstat -c`** — hiển thị nội dung bộ nhớ cache tên NetBIOS (cache từ xa) và địa chỉ IP đã phân giải
- **`PsExec`** — công cụ thay thế Telnet nhẹ, thực thi các quy trình trên hệ thống khác (điều khiển tương tác đầy đủ)
- **`PsFile`** — hiển thị danh sách các tệp trên hệ thống được mở từ xa và có thể đóng chúng

### Liệt kê tài nguyên chia sẻ:

Tiện ích `net view` hiển thị danh sách máy tính hoặc tài nguyên chia sẻ:

- **`net view \\<computername>`** — Hiển thị tài nguyên của một máy tính cụ thể.
- **`net view \\<computername> /ALL`** — Hiển thị tất cả các chia sẻ trên máy tính từ xa, bao gồm các chia sẻ ẩn.
- **`net view /domain`** — Hiển thị tất cả các chia sẻ trong domain.
- **`net view /domain:<domain name>`** — Hiển thị tất cả các chia sẻ trên domain được chỉ định.

### **1. Liệt kê SNMP (SNMP Enumeration)**

**Cổng:**

- **UDP 161**: SNMP agent (Lắng nghe các yêu cầu từ manager).
- **TCP/UDP 162**: SNMP trap (Gửi cảnh báo/thông báo từ agent tới manager).

**Phiên bản & Community Strings:**

- **Read Community String (`public`)**: Mật khẩu cho phép xem cấu hình thiết bị/hệ thống (chuỗi này thường công khai).
- **Read/Write Community String (`private`)**: Mật khẩu cho phép thay đổi hoặc chỉnh sửa cấu hình thiết bị.
- _(Lưu ý từ nguồn: SNMPv1 và SNMPv2c sử dụng community strings truyền dưới dạng bản rõ - plaintext. SNMPv3 đã được giới thiệu thêm tính năng xác thực - authentication và mã hóa - encryption để tăng cường bảo mật)._

**Công cụ và Lệnh:**

- **`snmpwalk`**: Công cụ dòng lệnh quét các node SNMP. Lệnh thường dùng:
  - `snmpwalk -v1 -c public <Target IP Address>` (xem tất cả OID)
  - `snmpwalk -v2c -c public <Target IP Address>` (quét SNMPv2)
- **Nmap**: `nmap -sU -p 161 --script=snmp-processes <Target IP Address>`
- **snmp-check**: Tự động thu thập lượng lớn thông tin thiết bị (hệ điều hành, phần cứng, port, user) qua SNMP.
- **SoftPerfect Network Scanner**: Quét cổng, dịch vụ từ xa, WMI, SNMP, thư mục chia sẻ.
- **Các công cụ khác**: OpUtils, Network Performance Monitor (SolarWinds), PRTG Network Monitor. _(Lưu ý ngoài nguồn: SNMPCheck, SNMP Scanner, SNScan không được đề cập riêng trong phần text của nguồn này)._

**Management Information Base (MIB):**
MIB là cơ sở dữ liệu ảo mô tả các đối tượng mạng, được nhận diện qua các chuỗi OID (Object Identifiers). Các MIB chính bao gồm:

- **`DHCP.MIB`** — 🟠 Giám sát lưu lượng mạng giữa máy chủ DHCP và máy chủ từ xa (DHCP service only).
- **`HOSTMIB.MIB`** — 🟡 Giám sát và quản lý các tài nguyên của host (hardware & system stats).
- **`LNMIB2.MIB`** — 🔵 Chứa các kiểu đối tượng (object types) cho các dịch vụ máy trạm (workstation) và máy chủ (Windows LAN Manager services).
- **`MIB_II.MIB`** — 🟢 Quản lý Internet dựa trên TCP/IP theo một kiến trúc và hệ thống đơn giản (TCP/IP networking).
- **`WINS.MIB`** — 🟣 Dành cho Dịch vụ tên Internet của Windows (WINS / NetBIOS name database).

### **2. Liệt kê LDAP (LDAP Enumeration)**

**Cổng:**

- **TCP/UDP 389**: LDAP (Lightweight Directory Access Protocol) truyền thống.
- **TCP 636**: Secure LDAP (LDAP bảo mật qua SSL/TLS).
- **TCP/UDP 3268**: Global Catalog Service (Dùng trong môi trường Active Directory của Microsoft).

**Công cụ và Lệnh:**

- **Python script (`ldap3`)**: Kẻ tấn công có thể tự viết script (`pip3 install ldap3`) để trích xuất các objects và `userPassword`.
- **Nmap**: `nmap -p 389 --script ldap-brute --script-args ldap.base='"cn=users,dc=CEH,dc=com"' <Target IP>` (Dùng để brute-force xác thực LDAP).
- **Softerra LDAP Administrator**: Trình duyệt và quản lý thư mục LDAP, trích xuất email, username, phòng ban.
- **`ldapsearch`**: Tiện ích dòng lệnh Linux. Lệnh: `ldapsearch -h <Target IP> -x -s base namingcontexts`.
- **Các công cụ khác**: AD Explorer, LDAP Admin Tool, LDAP Account Manager, LDAP Search.

### **3. Liệt kê NTP và NFS**

**NTP (Network Time Protocol):**

- **Cổng**: UDP 123
- **Công cụ và Lệnh**:
  - `ntpdate`: Thu thập mẫu thời gian.
  - `ntptrace`: Truy vết chuỗi các máy chủ NTP về nguồn chính. Lệnh: `ntptrace [-n] [-m maxhosts] [servername/IP_address]`.
  - `ntpdc`: Giám sát và truy vấn trạng thái ntpd daemon.
  - `ntpq`: Giám sát daemon và đánh giá hiệu suất. Lệnh: `ntpq [-inp] [-c command] [host]`.
  - **Công cụ UI**: PRTG Network Monitor, Nmap, Wireshark, udp-proto-scanner, NTP Server Scanner.

**NFS (Network File System):**

- **Cổng**: TCP 2049
- **Công cụ và Lệnh**:
  - `rpcinfo -p <Target IP Address>`: Quét địa chỉ IP mục tiêu để tìm cổng NFS mở và các dịch vụ RPC đang chạy.
  - `showmount -e <Target IP Address>`: Xem danh sách các thư mục và tệp được chia sẻ (exported directories).
  - **RPCScan**: Giao tiếp với dịch vụ RPC và kiểm tra cấu hình sai trên NFS shares.
  - **SuperEnum**: Dùng script `./superenum` để quét tự động các cổng mở, bao gồm NFS 2049.

### **4. Liệt kê SMTP và DNS**

**SMTP (Simple Mail Transfer Protocol):**

- **Cổng**: TCP 25. Ngoài ra còn dùng cổng 2525 hoặc 587.
- **Công cụ và kỹ thuật**:
  - **Telnet** để thử lệnh SMTP (`telnet <email server> 25`):
    - **`VRFY`**: Kiểm tra và xác thực xem tên người dùng (địa chỉ) có tồn tại trên máy chủ không.
    - **`EXPN`**: Hiển thị địa chỉ gửi thực tế của các bí danh (aliases) và mở rộng danh sách gửi thư (mailing lists).
    - **`RCPT TO`**: Chỉ định người nhận tin nhắn.
  - **Nmap**: `nmap -p 25 --script=smtp-enum-users <Target IP>`
  - **Metasploit**: Sử dụng module `auxiliary/scanner/smtp/smtp_enum`.
  - **NetScanTools Pro**: Công cụ SMTP Email Generator.
  - **`smtp-user-enum`**: Lệnh `smtp-user-enum.pl -M VRFY -u username -t host`.

**DNS Enumeration:**

- **Cổng**: TCP/UDP 53
- **Chuyển vùng DNS (DNS Zone Transfer)**:
  - `dig ns <target domain>`: Lấy danh sách name servers.
  - `dig @<domain of name server> <target domain> axfr`: Thử zone transfer.
  - `nslookup`: Trên Windows, sử dụng `set querytype=soa` và `ls -d <domain of name server>`.
  - **DNSRecon**: `dnsrecon -t axfr -d <target domain>`.
- **DNS Cache Snooping**:
  - **Phương pháp non-recursive**: Gửi truy vấn không đệ quy bằng `dig @<IP of DNS server> <Target domain> A +norecurse`. (Nếu không có cache, server trả về file `root.hints`).
  - **Phương pháp recursive**: Gửi đệ quy bằng `dig ... +recurse`. Đánh giá xem giá trị TTL trả về có nhỏ hơn mức khởi tạo không để xác định bản ghi đang nằm trong cache.
- **DNSSEC Zone Walking**: Kỹ thuật lấy bản ghi nội bộ từ cấu hình DNSSEC sai (NSEC record files).
  - **Công cụ**: LDNS (`ldns-walk @<IP> <Domain>`), DNSRecon (`dnsrecon -d <domain> -z`), nsec3map, nsec3walker, DNSwalk, Knock, Raccoon, Subfinder, Turbolist3r.
- **OWASP AMASS**:
  - `amass enum -d <Target Domain>`
  - `amass enum -passive -d <Target Domain> -src`

### **5. Liệt kê IPSec (IPsec Enumeration)**

Hầu hết các VPN dựa trên IPsec sử dụng giao thức ISAKMP (IKE) để thiết lập Security Associations (SA). Quét ISAKMP báo hiệu sự tồn tại của VPN gateway.

- **Cổng**: UDP 500
- **Nmap**:
  - `nmap -sU -p 500 <target IP address>` (Quét cơ bản).
  - `nmap -sU -p 500 --script=ike-version <target IP>` (Lấy phiên bản IKE).
- **ike-scan**: `ike-scan -M <target gateway IP address>`. Phát hiện IKE hosts, thu thập thuật toán mã hóa/hashing và Vendor ID.

### **6. Liệt kê VoIP (VoIP Enumeration)**

VoIP sử dụng giao thức SIP (Session Initiation Protocol).

- **Cổng mặc định**: UDP/TCP 2000, 2001, 5060 (không mã hóa), 5061 (mã hóa TLS).
- **Svmap**: Scanner nguồn mở nhận diện thiết bị SIP và máy chủ PBX. Lệnh: `svmap <target network range/IP Address>`.
- **Metasploit**: Dùng `auxiliary/scanner/sip/enumerator` để quét các username/extension số của điện thoại VoIP.

### **7. Liệt kê RPC (RPC Enumeration)**

- **Cổng**: Portmapper lắng nghe trên TCP/UDP 111, còn Endpoint Mapper của Microsoft RPC chạy trên TCP/UDP 135.
- **Nmap**: `nmap -sR <target IP/network>` hoặc `nmap -T4 -A <target IP/network>`.
- **Công cụ khác**: NetScanTools Pro (tính năng RPC Info).

### **8. Liệt kê người dùng Unix/Linux (Unix/Linux User Enumeration)**

- **`rusers`**: Hiển thị người dùng đang đăng nhập trên máy từ xa (remote machines).
  - Lệnh: `/usr/bin/rusers [-a] [-l] [-u| -h| -i] [Host ...]`. Tùy chọn `-a` (tất cả máy), `-l` (giống lệnh who), `-u` (sắp xếp theo lượng user), `-i` (sắp xếp theo idle time).
- **`rwho`**: Tương tự `who` nhưng quét toàn local network chạy rwho daemon. Lệnh: `rwho [ -a]`.
- **`finger`**: Hiển thị tên đăng nhập, thư mục home, thời gian nhàn rỗi (idle), sdt... Lệnh: `finger [-l] [-m] [-p] [-s] [user ...] [user@host ...]`.

### **9. Liệt kê SMB (SMB Enumeration)**

Lưu lượng chia sẻ SMB trước đây chạy qua NetBIOS TCP 139. SMB trực tiếp (Direct Host) trên Windows đời mới sử dụng TCP/UDP 445. Tấn công liệt kê SMB giúp lấy banner hệ điều hành, thư mục chia sẻ, session.

- **Cổng**: TCP/UDP 445, TCP 139
- **Nmap**:
  - `nmap -p 445 -A <target IP>`
  - `nmap -p 445 --script smb-protocols <Target IP>`
  - `nmap -p 139 --script smb-protocols <Target IP>`
  - `nmap -p 445 --script smb-enum-shares <Target IP>` (Liệt kê các thư mục share trên server).
- **Công cụ khác**: SMBMap, enum4linux, nullinux, SMBeagle, NetScanTool Pro.
