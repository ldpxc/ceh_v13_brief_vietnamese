### Thông tin thu thập được từ Enumeration (Information Enumerated by Intruders) (Trang 427)

Trong giai đoạn liệt kê, kẻ tấn công tạo các kết nối tích cực với hệ thống để thu thập các thông tin sau:

- Tài nguyên mạng (Network resources)
- Thư mục/tệp chia sẻ mạng (Network shares)
- Bảng định tuyến (Routing tables)
- Cài đặt kiểm toán và dịch vụ (Audit and service settings)
- Chi tiết SNMP và FQDN (SNMP and FQDN details)
- Tên máy (Machine names)
- Người dùng và nhóm (Users and groups)
- Ứng dụng và banner (Applications and banners)

## Các kỹ thuật liệt kê (enumeration):

- **Trích xuất tên người dùng bằng địa chỉ email (Email ID)**: Mọi địa chỉ email đều chứa hai phần là tên người dùng và tên miền, theo định dạng `username@domainname`.
- **Mật khẩu mặc định (default passwords)**: Nhiều nguồn trực tuyến cung cấp danh sách mật khẩu mặc định do nhà sản xuất gán cho sản phẩm của họ. Người dùng thường bỏ qua khuyến nghị thay đổi mật khẩu mặc định, điều này tạo thuận lợi cho kẻ tấn công liệt kê và khai thác hệ thống.
- **Tấn công dò (brute force) trên Active Directory (AD)**: Microsoft Active Directory dễ bị liệt kê tên người dùng tại thời điểm xác minh đầu vào do lỗi thiết kế. Nếu người dùng bật tính năng “logon hours”, các nỗ lực xác thực dịch vụ sẽ trả về các thông báo lỗi khác nhau. Kẻ tấn công lợi dụng điều này để trích xuất tên người dùng hợp lệ, sau đó tiến hành brute-force.
- **Chuyển vùng DNS (DNS zone transfer)**: Nếu quản trị viên cấu hình máy chủ DNS không đúng cách, kẻ tấn công có thể sử dụng các lệnh như `nslookup` và `dig` để thực hiện chuyển vùng. Qua đó, chúng thu được danh sách tất cả các máy chủ có tên, các vùng phụ (sub-zones) và địa chỉ IP liên quan.
- **Trích xuất nhóm người dùng từ Windows**: Kẻ tấn công cần có một ID đã đăng ký với tư cách là người dùng trong AD. Sau đó, chúng có thể trích xuất thông tin từ các nhóm mà người dùng là thành viên bằng giao diện Windows hoặc dòng lệnh.
- **Trích xuất tên người dùng bằng SNMP**: Kẻ tấn công có thể dễ dàng đoán các chuỗi cộng đồng (community strings) dạng read-only hoặc read-write bằng cách sử dụng API của SNMP để trích xuất tên người dùng.
- **Trích xuất tài nguyên mạng và sơ đồ (topology) bằng SNMP**: Kẻ tấn công có thể truy vấn cây SNMP một cách có phương pháp để thu thập thông tin chi tiết về tài nguyên và cấu trúc liên kết mạng.

### Các giao thức và Cổng để Liệt kê (Services and Ports to Enumerate) (Trang 429)

Giao thức điều khiển truyền vận (TCP) và Giao thức dữ liệu người dùng (UDP) quản lý truyền thông dữ liệu trong mạng.

- **TCP (Transmission Control Protocol):** Là giao thức hướng kết nối (connection-oriented), truyền tải thông điệp/email đáng tin cậy. Các tính năng bao gồm:
  - Hỗ trợ xác nhận (acknowledgement) qua hệ thống cửa sổ trượt (sliding window).
  - Tự động truyền lại dữ liệu bị mất.
  - Cho phép định địa chỉ và ghép kênh (multiplexing).
  - Có thể thiết lập, quản lý và chấm dứt kết nối.
  - Cung cấp truyền tải chất lượng dịch vụ (QoS).
  - Quản lý tắc nghẽn và kiểm soát luồng (flow control).
- **UDP (User Datagram Protocol):** Là giao thức không kết nối, truyền tải các thông điệp ngắn và cung cấp dịch vụ không đáng tin cậy (unreliable). Ứng dụng của UDP bao gồm: Audio streaming, Videoconferencing và Teleconferencing.

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
- **Các tham số `nbtstat` bổ sung (Trang 435-439):**
  - `-r`: Hiển thị số lượng đếm của tất cả các tên được phân giải bởi broadcast hoặc máy chủ WINS.
  - `-R`: Xóa (purges) name cache và tải lại tất cả các mục được gắn thẻ #PRE từ tệp `Lmhosts`.
  - `-RR`: Giải phóng và đăng ký lại tất cả các tên với name server.
  - `-s`: Liệt kê bảng NetBIOS sessions, chuyển đổi IP đích thành tên NetBIOS của máy tính.
  - `-S`: Liệt kê các NetBIOS sessions hiện tại và trạng thái cùng với địa chỉ IP.
  - `<interval>`: Hiển thị lại các số liệu thống kê, tạm dừng trong số giây được chỉ định.
  - `-?`: Hiển thị trợ giúp.
- **Công cụ liệt kê NetBIOS bổ sung (NetBIOS Enumeration Tools):**
  - NetBIOS Enumerator: Quét một dải IP để lấy thông tin NetBIOS name, username, domain, MAC.
  - Global Network Inventory (magnetosoft.com)
  - Advanced IP Scanner
  - Hyena
  - Nsauditor Network Security Auditor
- **`PsExec`** — công cụ thay thế Telnet nhẹ, thực thi các quy trình trên hệ thống khác (điều khiển tương tác đầy đủ)
- **`PsFile`** — hiển thị danh sách các tệp trên hệ thống được mở từ xa và có thể đóng chúng
- **`PsGetSid`** — dịch các SIDs (Security Identifiers) sang tên hiển thị và ngược lại. Hoạt động trên các tài khoản tích hợp, tài khoản domain và tài khoản cục bộ (Trang 440-441).
- **`PsKill`** — tiện ích có thể tiêu diệt/đóng các tiến trình trên hệ thống từ xa bằng Process ID hoặc tên tiến trình.
- **`PsInfo`** — thu thập thông tin chính về hệ thống (loại cài đặt, kernel build, bộ nhớ vật lý, số lượng bộ vi xử lý, ngày hết hạn dùng thử, v.v.).
- **`PsList`** — hiển thị thông tin về CPU, bộ nhớ và số liệu thống kê luồng (thread statistics) của các tiến trình.
- **`PsLoggedOn`** — hiển thị người dùng đăng nhập cục bộ và người dùng đăng nhập qua tài nguyên chia sẻ bằng cách quét các key trong registry `HKEY_USERS`.
- **`PsLogList`** — trích xuất nội dung của Event Log (nhật ký sự kiện) trên máy tính cục bộ hoặc từ xa.
- **`PsPasswd`** — cho phép quản trị viên thay đổi mật khẩu tài khoản (hàng loạt) trên hệ thống cục bộ hoặc từ xa mà không gửi mật khẩu dưới dạng bản rõ qua mạng.
- **`PsShutdown`** — tắt hoặc khởi động lại máy tính cục bộ hoặc từ xa mà không cần cài đặt phần mềm client.

### Liệt kê tài nguyên chia sẻ:

Tiện ích `net view` hiển thị danh sách máy tính hoặc tài nguyên chia sẻ:

- **`net view \\<computername>`** — Hiển thị tài nguyên của một máy tính cụ thể.
- **`net view \\<computername> /ALL`** — Hiển thị tất cả các chia sẻ trên máy tính từ xa, bao gồm các chia sẻ ẩn.
- **`net view /domain`** — Hiển thị tất cả các chia sẻ trong domain.
- **`net view /domain:<domain name>`** — Hiển thị tất cả các chia sẻ trên domain được chỉ định.

### Liệt kê NetBIOS bằng AI (NetBIOS Enumeration using AI) (Trang 444-446)

Kẻ tấn công có thể tận dụng công nghệ AI tạo sinh như ChatGPT để tự động hóa các tác vụ liệt kê mạng.

- _Ví dụ Prompt 1:_ `"Perform NetBIOS enumeration on target IP 10.10.1.11"` -> AI sẽ trả về lệnh: `nbtscan 10.10.1.11`.
- _Ví dụ Prompt 2:_ `"Get NetBIOS info for IP 10.10.1.11 and display the associated names"` -> AI sẽ trả về lệnh: `nmblookup -A 10.10.1.11`.
- _Ví dụ Prompt 3:_ `"Enumerate NetBIOS on target IP 10.10.1.22 with nmap"` -> AI sẽ trả về lệnh: `nmap -sU -p 137 --script nbstat.nse 10.10.1.22`.

### **1. Liệt kê SNMP (SNMP Enumeration)**

**Cổng:**

- **UDP 161**: SNMP agent (Lắng nghe các yêu cầu từ manager).
- **TCP/UDP 162**: SNMP trap (Gửi cảnh báo/thông báo từ agent tới manager).

**Cách thức hoạt động của SNMP (Working of SNMP) (Trang 449-450):**
Quá trình giao tiếp giữa SNMP manager và SNMP agent bao gồm các bước:

1. **Khởi tạo (Initialization):** Agent khởi động, khởi tạo cấu hình và lắng nghe trên UDP 161.
2. **Khám phá (Discovery):** Manager gửi yêu cầu broadcast hoặc IP cụ thể để tìm agent.
3. **Trao đổi thông tin (Information Exchange) qua PDUs:**
   - **Get Request:** Manager yêu cầu lấy giá trị của một biến cụ thể.
   - **GetNext Request:** Manager yêu cầu lấy biến tiếp theo trong cây MIB.
   - **Set Request:** Manager yêu cầu thay đổi/cấu hình giá trị của một biến.
   - **GetBulk Request:** Lấy lượng lớn dữ liệu trong một yêu cầu (SNMPv2).
   - **Response:** Agent trả về giá trị yêu cầu hoặc xác nhận hành động.
   - **Inform Request:** Agent gửi thông tin cho manager (giữa các manager với nhau).
   - **Trap:** Tin nhắn cảnh báo gửi từ agent đến manager (VD: thiết bị khởi động lại, lỗi link).
4. **Giám sát và Quản lý (Monitoring and Management) (Trang 450):** SNMP manager sử dụng thông tin thu thập được từ SNMP agents để giám sát hiệu suất mạng, phát hiện/chẩn đoán sự cố, và cấu hình thiết bị từ xa. Quá trình liên tục này bao gồm việc thăm dò thường xuyên (gửi Get Requests) và lắng nghe Traps/Inform Requests từ agents.

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
- **Engineer’s Toolset (SolarWinds) (Trang 455)**

**Liệt kê SNMP bằng AI (SNMP Enumeration using AI) (Trang 456-458):**
Kẻ tấn công sử dụng ChatGPT để tự động hóa việc liệt kê SNMP trên mục tiêu.

- _Ví dụ Prompt 1:_ `"Perform SNMP enumeration on target IP 10.10.1.22 using SnmpWalk and display the result here"` -> AI trả về lệnh: `snmpwalk -c public -v1 10.10.1.22`.
- _Ví dụ Prompt 2:_ `"Perform SNMP enumeration on target IP 10.10.1.22 using nmap and display the result here"` -> AI trả về lệnh: `nmap -sU -p 161 --script snmp-info 10.10.1.22`.
- _Ví dụ Prompt 3:_ `"Perform SNMP processes on target IP 10.10.1.22 using nmap and display the result here"` -> AI trả về lệnh: `nmap -sU -p 161 --script snmp-processes 10.10.1.22`.

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

- **Python script (`ldap3`) (Trang 460-462)**: Kẻ tấn công có thể thực hiện liệt kê thủ công thông qua thư viện `ldap3` của Python.
  - **Cài đặt:** `pip3 install ldap3`
  - **Viết script kết nối:**
    ```python
    >>> import ldap3
    >>> server = ldap3.Server('Target IP Address', get_info=ldap3.ALL, port=389)
    >>> connection = ldap3.Connection(server)
    >>> connection.bind() # (Trả về True nếu thành công)
    >>> server.info # (Lấy thông tin naming context)
    ```
  - **Trích xuất tất cả đối tượng thư mục:**
    ```python
    >>> connection.search(search_base='DC=DOMAIN,DC=DOMAIN', search_filter='(&(objectClass=*))', search_scope='SUBTREE', attributes='*')
    >>> connection.entries
    ```
  - **Trích xuất thông tin người dùng và mật khẩu (Dump LDAP):**
    ```python
    >>> connection.search(search_base='DC=DOMAIN,DC=DOMAIN', search_filter='(&(objectClass=person))', search_scope='SUBTREE', attributes='userPassword')
    >>> connection.entries
    ```
- **Nmap**: `nmap -p 389 --script ldap-brute --script-args ldap.base='"cn=users,dc=CEH,dc=com"' <Target IP>` (Dùng để brute-force xác thực LDAP).
- **Softerra LDAP Administrator**: Trình duyệt và quản lý thư mục LDAP, trích xuất email, username, phòng ban.
- **`ldapsearch` (Trang 464-465)**: Tiện ích dòng lệnh Linux truy cập vào thư viện `ldap_search_ext(3)`. Cú pháp: `ldapsearch -h <Target IP Address> -x`.
  - Lấy chi tiết naming contexts: `ldapsearch -h <Target IP Address> -x -s base namingcontexts`
  - Lấy thông tin về một object class cụ thể (VD: Employee): `ldapsearch -h <Target IP Address> -x -b "DC=htb,DC=local" '(objectClass=Employee)'`
  - Lấy tất cả các đối tượng trong thư mục: `ldapsearch -x -h <Target IP Address> -b "DC=htb,DC=local" "objectclass=*"`
  - Lấy danh sách người dùng với thuộc tính `sAMAccountName`: `ldapsearch -h <Target IP Address> -x -b "DC=htb,DC=local" '(objectClass= Employee)' sAMAccountName sAMAccountType`
- **Các công cụ khác**: AD Explorer, LDAP Admin Tool, LDAP Account Manager, LDAP Search.

### **3. Liệt kê NTP và NFS**

**NTP (Network Time Protocol):**

- **Cổng**: UDP 123
- **Công cụ và Lệnh**:
  - `ntpdate`: Thu thập mẫu thời gian.
  - `ntptrace`: Truy vết chuỗi các máy chủ NTP về nguồn chính. Lệnh: `ntptrace [-n] [-m maxhosts] [servername/IP_address]`.
  - `ntpdc`: Giám sát và truy vấn trạng thái ntpd daemon.
  - `ntpq`: Giám sát daemon và đánh giá hiệu suất. Lệnh: `ntpq [-inp] [-c command] [host]`.
  - _(Lưu ý: Trong nhiều bản phân phối Linux, daemon NTP `ntpd` đã được kết hợp với Chrony, `chronyd` để đồng bộ thời gian với máy chủ từ xa)._
  - **Các tham số lệnh chi tiết cho NTP (Trang 468-472):**
    - **`ntpdate:`** `-4` (Ép phân giải IPv4), `-6` (Ép phân giải IPv6), `-a key` (Xác thực với key identifier), `-B` (Ép thời gian luôn được slewed), `-b` (Ép thời gian được stepped), `-d` (Bật debug mode), `-e authdelay` (Chỉ định độ trễ xử lý xác thực), `-k keyfile` (Đường dẫn file key), `-o version` (Chỉ định phiên bản NTP 1 hoặc 2, mặc định là 4), `-p samples` (Số mẫu 1-8, mặc định là 4), `-q` (Chỉ truy vấn, không set clock), `-s` (Chuyển log output sang syslog), `-t timeout` (Thời gian chờ tối đa cho phản hồi server), `-u` (Dùng unprivileged port), `-v` (Verbose).
    - **`ntptrace:`** `-n` (Không in host name, chỉ in IP), `-m maxhosts` (Số cấp tối đa theo chuỗi trace).
    - **`ntpdc:`** `-4`, `-6`, `-d` (Bật debug), `-c command` (Lệnh định dạng tương tác), `-i` (Chạy ở chế độ tương tác), `-l` (Lấy danh sách peers), `-n` (Xuất IP thay vì host name), `-p` (In danh sách peers và trạng thái của chúng), `-s` (In danh sách peers với định dạng khác).
    - **`ntpq:`** `-4`, `-6`, `-c command`, `-d`, `-i`, `-n`, `-p` (Chức năng tương tự ntpdc).
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
  - **Công cụ `smtp-user-enum` (Cú pháp chi tiết):** `smtp-user-enum.pl [options] (-u username|-U file-of-usernames) (-t host|-T file-of-targets)`. Các tùy chọn: `-m n` (số tiến trình tối đa), `-M mode` (chỉ định lệnh EXPN, VRFY, hoặc RCPT TO), `-f addr` (email người gửi), `-D dom` (domain gắn thêm vào user), `-p port` (chỉ định cổng), `-d` (debug).
- **Các bước liệt kê qua Metasploit (`smtp_enum`) (Trang 482-489):**
  1. **Bước 1:** Khởi chạy msfconsole, nạp module `use auxiliary/scanner/smtp/smtp_enum`.
  2. **Bước 2:** Sử dụng lệnh `show options` (hoặc `show evasion` để xem tùy chọn lẩn tránh).
  3. **Bước 3:** `set RHOSTS <IP đích>`.
  4. **Bước 4:** Thiết lập wordlist (mặc định là `unix_users.txt`) qua lệnh `set USER_FILE <đường dẫn file>`.
  5. **Bước 5:** Dùng lệnh `show advanced` để xem toàn bộ tùy chọn nâng cao.
  6. **Bước 6:** Chạy lệnh `run` để tiến hành brute-force kiểm tra danh sách user.

**Liệt kê SMTP bằng AI (SMTP Enumeration using AI) (Trang 482-489):**
Kẻ tấn công sử dụng ChatGPT để tự động hóa:

- _Ví dụ Prompt 1:_ `"Perform SMTP enumeration on target IP 10.10.1.19"` -> AI trả về lệnh: `nmap -p25 --script smtp-enum-users --script-args smtp-enum-users.methods={VRFY,EXPN,RCPT} 10.10.1.19 -oN ~/enumeration_results/smtp_enum_10.10.1.19.txt`.
- _Ví dụ Prompt 2:_ `"Perform SMTP enumeration on target IP 10.10.1.19 with metasploit"` -> AI trả về lệnh: `msfconsole -q -x "use auxiliary/scanner/smtp/smtp_enum; set RHOSTS 10.10.1.19; run; exit"`.

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
  - **Các lệnh OWASP Amass bổ sung (Trang 501, 506-510):**
    - Lệnh theo dõi/so sánh 2 lần quét gần nhất: `amass track -config /root/amass/config.ini -dir amass4owasp -d <Target Domain> -last 2`
    - Lệnh hiển thị kết quả từ cơ sở dữ liệu: `amass db -dir amass4owasp -list`
    - Lệnh tạo biểu đồ trực quan HTML d3-force: `amass viz -d3 -dir amass4owasp`

**Liệt kê DNS bằng AI (DNS & DNS Cache Snooping using AI) (Trang 506-510):**

- **DNS Enumeration với AI:**
  - _Prompt:_ `"Use Nmap to perform DNS Enumeration on target domain www.certifiedhacker.com"` -> AI xuất chuỗi lệnh Nmap sử dụng scripts `dns-brute` và `dns-zone-transfer` lưu kết quả tự động.
- **DNS Cache Snooping với AI:**
  - _Prompt 1:_ `"Use dig command to perform DNS cache snooping on target domain www.certifiedhacker.com using recursive method. Use DNS server IP as 162.241.216.11"` -> Trả về lệnh: `dig @162.241.216.11 www.certifiedhacker.com +recurse`.
  - _Prompt 2:_ `"Use dig command to perform DNS cache snooping on the target domain www.certifiedhacker.com using non-recursive method..."` -> Trả về lệnh: `dig @162.241.216.11 www.certifiedhacker.com +norecurse`.

### **5. Liệt kê IPSec (IPsec Enumeration)**

Hầu hết các VPN dựa trên IPsec sử dụng giao thức ISAKMP (IKE) để thiết lập Security Associations (SA). Quét ISAKMP báo hiệu sự tồn tại của VPN gateway.

- **Cổng**: UDP 500
- **Nmap**:
  - `nmap -sU -p 500 <target IP address>` (Quét cơ bản).
  - `nmap -sU -p 500 --script=ike-version <target IP>` (Lấy phiên bản IKE).
- **ike-scan**: `ike-scan -M <target gateway IP address>`. Phát hiện IKE hosts, thu thập thuật toán mã hóa/hashing và Vendor ID.
  - **Tính năng mở rộng của ike-scan (Trang 513-515):** Bên cạnh khám phá host, `ike-scan` còn thực hiện:
    - **Fingerprinting (Lấy dấu vân tay):** Xác định triển khai IKE và phiên bản phần mềm bằng kỹ thuật UDP backoff fingerprinting (so sánh thời gian đến của gói tin) và Vendor ID fingerprinting.
    - **Transform enumeration:** Xác định thuật toán mã hóa và băm được máy chủ VPN hỗ trợ (IKE phase 1).
    - **User enumeration:** Khám phá tên người dùng VPN hợp lệ trên một số hệ thống.
    - **Pre-shared key cracking:** Dùng công cụ `psk-crack` (thuộc gói ike-scan) để crack hash xác thực (IKE Aggressive Mode) bằng từ điển hoặc brute-force.

**Liệt kê IPsec bằng AI (IPsec Enumeration with AI) (Trang 513-515):**

- _Prompt AI:_ `"Perform IPsec enumeration on target IP 10.10.1.22 with nmap"` -> AI tự động trả về lệnh `nmap -sU -p 500 --script=ike-version 10.10.1.22`.

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

**Liệt kê SMB bằng AI (SMB Enumeration with AI) (Trang 525-532):**
Kẻ tấn công sử dụng ChatGPT để quét các cổng SMB mở và liệt kê danh sách chia sẻ.

- _Prompt AI:_ `"Scan the target IP 10.10.1.22 for the port using SMB with nmap"` -> AI sẽ trả về lệnh quét: `nmap -p 445 --script smb-enum-shares 10.10.1.22`.

### 10. Tạo và Chạy Script tự động liệt kê bằng AI (Create and Run Custom Script to Automate Network Enumeration Tasks with AI) (Trang 525-532)

Kẻ tấn công có thể yêu cầu AI (ChatGPT) tạo ra một bash script tự động hóa toàn bộ quá trình do thám mạng.

- _Prompt:_ `"Develop and execute a script which will automate network enumeration tasks on target IP range 10.10.1.0/24"`
- AI sẽ tạo ra một file `network_enumeration.sh` tự động cài đặt nmap, tạo thư mục chứa log (`mkdir -p ~/enumeration_results`), thực hiện ping sweep (`nmap -sn`), quét nhanh (`nmap -T4 -F`), quét chi tiết HĐH (`nmap -T4 -A`) và quét phát hiện phiên bản dịch vụ (`nmap -sV`) tự động lưu thành các file txt riêng biệt. Lệnh thực thi: `chmod +x network_enumeration.sh && ./network_enumeration.sh`.

### Các biện pháp phòng chống liệt kê (Enumeration Countermeasures) (Trang 533-541)

**SNMP Countermeasures:**

- Loại bỏ SNMP agent hoặc tắt dịch vụ SNMP nếu không cần thiết.
- Thay đổi tên community strings mặc định ("public" và "private") thành các giá trị phức tạp, duy nhất.
- Nâng cấp lên SNMPv3 để mã hóa mật khẩu và thông điệp.
- Thực thi Group Policy "Additional restrictions for anonymous connections".
- Giới hạn quyền truy cập vào null session pipes, null session shares và lọc IPsec.
- Chặn truy cập vào cổng TCP/UDP 161.
- Không cài đặt các thành phần quản lý và giám sát của Windows trừ khi thực sự cần thiết.
- Mã hóa hoặc xác thực bằng IPsec.
- Tránh cấu hình sai quyền read-write (Chỉ cấp quyền read-only cho các thiết bị không cần write).
- Cấu hình Access Control Lists (ACLs) hoặc tường lửa để chỉ cho phép các IP hợp pháp truy cập thiết bị SNMP.
- Kiểm toán (Audit) lưu lượng mạng thường xuyên.
- Sử dụng chế độ "AuthNoPriv" (dùng MD5 và SHA) để mã hóa thông tin xác thực.
- Tránh dùng chế độ "NoAuthNoPriv" vì nó không mã hóa giao tiếp.
- Triển khai Role-based access control (RBAC) cho các nhóm người dùng SNMP.
- Đưa lưu lượng quản lý SNMP vào một VLAN an toàn, tách biệt để hạn chế phơi nhiễm trước những kẻ nghe lén.
- Áp dụng các bản cập nhật bảo mật từ nhà sản xuất. Triển khai công cụ phát hiện bất thường để cảnh báo lưu lượng SNMP lạ. Đảm bảo mọi truy cập SNMP đều được ghi log.

**LDAP Countermeasures:**

- Mặc định LDAP không bảo mật, hãy dùng Secure Sockets Layer (SSL) hoặc STARTTLS để mã hóa lưu lượng.
- Chọn username khác với địa chỉ email và bật account lockout.
- Hạn chế quyền truy cập Active Directory bằng phần mềm như Citrix.
- Sử dụng NTLM, Kerberos hoặc xác thực cơ bản thay cho quyền ẩn danh.
- Ghi log tất cả các truy cập vào AD.
- Chặn người dùng truy cập một số thực thể AD bằng cách thay đổi quyền trên object/attribute.
- Triển khai canary accounts (tài khoản mồi nhử) giống hệt tài khoản thật để đánh lừa kẻ tấn công.
- Tạo decoy groups (nhóm mồi nhử) có chữ "Admin" trong tên để bẫy kẻ tấn công.
- Bật Xác thực đa yếu tố (MFA).
- Vô hiệu hóa truy vấn ẩn danh (anonymous binds) trừ khi bắt buộc.
- Cấu hình ACLs để giới hạn quyền xem/hành động của người dùng đã xác thực.
- Dùng các công cụ giám sát phát hiện các pattern truy vấn LDAP bất thường. Đặt server LDAP vào một phân vùng mạng an toàn. Cấu hình tường lửa chặn truy cập bên ngoài không cần thiết. Enforce chính sách mật khẩu mạnh.

**NFS Countermeasures:**

- Thực thi quyền hạn hợp lý (chỉ định rõ ai được read/write) trên các file systems được export.
- Tạo luật tường lửa để chặn cổng NFS 2049.
- Cấu hình chuẩn xác các file `/etc/smb.conf`, `/etc/exports`, `/etc/hosts.allow`, `/etc/hosts.deny`.
- Thường xuyên cập nhật `/etc/exports` để đảm bảo chỉ host được phép mới có quyền truy cập.
- Dùng file `/etc/hosts.allow` và `/etc/hosts.deny` để từ chối truy cập dịch vụ NFS.
- Ghi log (Log requests) mọi truy cập file hệ thống trên NFS server.
- Bật tùy chọn `root_squash` trong `/etc/exports` để không tin tưởng quyền root từ phía client.
- Mã hóa lưu lượng NFS qua SSH tunneling.
- Áp dụng nguyên tắc Đặc quyền tối thiểu (Least privileges).
- Đảm bảo không có file nào chạy quyền suid và sgid trên thư mục export.
- Kiểm tra sâu gói tin (DPI firewall) với toàn bộ lưu lượng NFS. Áp dụng xác thực Kerberos.
- Nâng cấp lên NFSv4 để hưởng các tính năng bảo mật tốt hơn.
- Sử dụng công cụ file system auditing và vá lỗi hệ thống định kỳ.

**SMTP Countermeasures:**

- Định cấu hình bỏ qua email gửi đến người nhận không xác định.
- Sử dụng Machine Learning (ML) để nhận diện spammer.
- Không tiết lộ thông tin IP/host nội bộ trong các mail response.
- Triển khai SPF (Sender Policy Framework), DKIM (DomainKeys Identified Mail) và DMARC.
- Giới hạn thông tin trong các thông báo lỗi (error messages).
- Dùng ACLs để giới hạn sử dụng một số lệnh SMTP. Bắt buộc xác thực trước khi gửi mail.
- Dùng TLS để mã hóa giao tiếp SMTP.
- Ghi log mọi truy cập và các lệnh đã dùng. Dùng firewall và Rate limiting (giới hạn tốc độ) để chống brute-force.
- Tắt tính năng open relay. Tắt các lệnh `EXPN`, `VRFY`, và `RCPT TO` hoặc chỉ cấp cho user xác thực.

**SMB Countermeasures:**

- Tắt dịch vụ SMB trên Web server và DNS server.
- Tắt Client for Microsoft Networks và File and Printer Sharing trên các máy bastion hosts lộ ra Internet.
- Sửa Registry: thêm `RestrictNullSessAccess = 1` tại đường dẫn `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters` để chặn truy cập nặc danh vào Named pipes và Shares.
- Bật Windows Firewall hoặc hệ thống bảo vệ endpoint tương đương.
- Cài đặt bản vá bảo mật mới nhất, dùng chính sách mật khẩu mạnh, phân quyền chặt chẽ.
- Giám sát hệ thống chủ động và kiểm toán log thường xuyên.
- Dùng VPN an toàn, dùng Next-Gen Firewalls (NGFWs) để phân tích hành vi file, dùng hệ thống cảm biến mối đe dọa toàn cầu (global threat sensors).
- Triển khai truyền dữ liệu ký số (digitally signed data).
- Chặn/tắt các cổng TCP 88, 139, 445 và UDP 88, 137, 138.
- Bật public profile settings trong tường lửa. Tắt SMB đối với các máy chủ Internet-facing.
- Nâng cấp lên cấu trúc SMBv3 trở lên (có mã hóa), tuyệt đối tránh dùng SMBv1. Cấu hình ACLs trên SMB shares. Áp dụng nguyên tắc Đặc quyền tối thiểu.

**DNS Countermeasures:**

- Restrict resolver access: Chỉ cho phép các host nội bộ truy cập để chống cache poisoning.
- Randomize source ports: Ngẫu nhiên hóa cổng nguồn thay vì mặc định dùng UDP 53. Ngẫu nhiên hóa Query IDs và thay đổi chữ hoa/thường trong tên miền.
- Kiểm toán các DNS zones, cập nhật bản vá mới nhất cho BIND/Microsoft DNS.
- Giám sát hành vi nameservers để phát hiện bất thường.
- Restrict DNS zone transfers: Chỉ cho phép slave nameserver IP cụ thể được zone transfer. Tắt đối với host không tin cậy.
- Tách biệt server đảm nhiệm chức năng authoritative và chức năng resolver.
- Dùng máy chủ DNS bị cô lập chuyên dụng, không dùng chung với máy chủ Web.
- Disable DNS recursion: Tắt truy vấn đệ quy để tránh khuếch đại tấn công (amplification attacks).
- Đóng cổng không dùng, dùng VPN, bật Xác thực 2 yếu tố (2FA), dùng khóa thay đổi DNS (DNS change lock).
- Triển khai DNSSEC để bảo vệ bằng chữ ký số. Dùng Premium DNS registration để giấu host info (HINFO).
- Mã hóa truy vấn bằng DoH (DNS-over-HTTPS) hoặc DoT (DNS-over-TLS).
- Bật log, giám sát bất thường bằng hệ thống tự động, cấu hình Rate limiting.
- Split DNS architecture: Dùng kiến trúc DNS phân tách (Internal DNS và External DNS). Cung cấp tối thiểu thông tin DNS.
- Không xuất bản private IP ra public DNS. Dùng thông tin admin tiêu chuẩn khi đăng ký tên miền để tránh bị social engineering. Xóa các file zone và bản ghi rác/cũ.
- Chặn các truy vấn `version.bind` bằng ACLs. Sử dụng file `/etc/hosts` cho môi trường dev/staging thay vì cấu hình lên DNS. Deploy DNS Firewalls để chặn truy vấn độc hại.
