## IDS

**Chức năng chính của Hệ thống phát hiện xâm nhập (IDS):**

- Thu thập và phân tích thông tin bên trong máy tính hoặc mạng nhằm xác định truy cập trái phép và hành vi lạm dụng.
- IDS = bộ dò gói tin (packet sniffer) chặn các gói, thường là TCP/IP.
- Các gói được phân tích rồi lưu lại.
- Đánh giá lưu lượng và phát cảnh báo.

**Vị trí triển khai trong mạng:**

- Gần tường lửa (firewall, FW).
- Khi đặt bên trong, vị trí lý tưởng là gần vùng phi quân sự (DMZ).
- Thực hành tốt nhất là có một thiết bị ở ngoài tường lửa và một thiết bị bên trong, gần DMZ.

**Cách IDS hoạt động:**

- IDS có các cảm biến để phát hiện chữ ký độc hại (signature); IDS nâng cao còn bao gồm phân tích hành vi (behavioral analysis/activity).
- Nếu chữ ký khớp, IDS thực hiện các hành động đã định trước.
- Khi chữ ký khớp, cơ chế phát hiện dị thường (anomaly detection) có thể bị bỏ qua.
- Khi các gói vượt qua mọi kiểm tra, IDS sẽ chuyển tiếp lưu lượng về mạng.

**Cách IDS phát hiện xâm nhập**

- Nhận diện chữ ký (signature recognition) — phát hiện lạm dụng (misuse detection).
- Phát hiện dị thường (anomaly detection) — dựa trên đặc trưng hành vi.
- Phát hiện bất thường giao thức (protocol anomaly detection) — phát hiện sai lệch so với tiêu chuẩn giao thức đã thiết lập.

## Intrusion prevention system (IPS)

Hệ thống ngăn chặn xâm nhập (IPS) được coi là IDS chủ động (active IDS); chúng không chỉ phát hiện mà còn có khả năng ngăn chặn.

- Tạo cảnh báo khi phát hiện lưu lượng bất thường.
- Ghi nhật ký theo thời gian thực.
- Chặn và lọc lưu lượng độc hại.
- Phát hiện và loại bỏ mối đe dọa nhanh chóng.
- Nhận diện mối đe dọa chính xác để giảm các báo cáo dương tính giả (false positives).

Phân loại IPS:

- Dựa trên máy chủ (host-based).
- Dựa trên mạng (network-based).

## Network based IDS (NIDS)

- Là một "black box" đặt trên mạng ở chế độ promiscuous (promiscuous mode), lắng nghe các mẫu lưu lượng.
- Có thể phát hiện các sự kiện như DDoS (DDoS).

## Host based intrusion detection systems (HIDS)

- Cài đặt trên một máy chủ cụ thể.
- Không phổ biến do tiêu tốn nhiều tài nguyên.
- Có thể phát hiện nhiều thứ hơn NIDS, ví dụ như thay đổi tập tin.

## Types of IDS alerts

| Loại (Type)                     | Hành động (Action)  | Giải thích (Explanation)                        |
| ------------------------------- | ------------------- | ----------------------------------------------- |
| Dương tính thật (True positive) | Attack->Alert       | IDS phát cảnh báo khi có tấn công thực sự       |
| Dương tính giả (False positive) | No attack->Alert    | IDS phát cảnh báo khi thực tế không có tấn công |
| Âm tính giả (False negative)    | Attack->No Alert    | IDS không phát cảnh báo khi có tấn công         |
| Âm tính thật (True Negative)    | No attack->No Alert | IDS không phát cảnh báo khi không có tấn công   |

## Intrusion prevention system (IPS)

IPS được coi là IDS chủ động; chúng vừa có tính năng phát hiện, vừa có thể ngăn chặn.

- Tạo cảnh báo khi phát hiện lưu lượng bất thường.
- Ghi nhật ký thời gian thực.
- Chặn và lọc lưu lượng độc hại.
- Phát hiện và loại bỏ mối đe dọa nhanh chóng.
- Nhận diện mối đe dọa với độ chính xác cao nhằm giảm báo cáo dương tính giả.

Phân loại IPS:

- Dựa trên máy chủ (Host-based IPS).
- Dựa trên mạng (Network-based IPS).

## Firewall

- Được thiết kế để ngăn chặn truy cập trái phép.
- Đặt tại điểm nối hoặc cổng giữa hai mạng.
- Kiểm tra tất cả thông điệp vào và ra khỏi Internet.

**Kiến trúc tường lửa (FW architecture):**

- Bastion host:
  - Được thiết kế để bảo vệ mạng khỏi các cuộc tấn công. Hoạt động như bộ trung gian giữa vùng an toàn và vùng không an toàn.
  - Có hai giao diện — một công khai nối trực tiếp ra Internet, một riêng tư nối vào mạng nội bộ.
- Screened subnet (DMZ):
  - Tạo bằng cách dùng hai hoặc ba tường lửa có nhiều interface (multi-homed) phía sau một tường lửa lọc.
    - Multi-homed firewall - nút có nhiều NIC kết nối tới các đoạn mạng khác nhau.
- Demilitarized zone (vùng phi quân sự, DMZ):
  - Đặt ở vùng trung lập giữa mạng nội bộ an toàn và mạng ngoài không tin cậy. DMZ là vùng đệm giữa mạng nội bộ và Internet.

- **Các loại tường lửa:**
  - Theo cấu hình:
    - Tường lửa dựa trên mạng (Network-based firewall) — đặt ở ranh giới mạng để kiểm tra header gói và áp đặt các quy tắc bảo mật. Ví dụ: Cisco ASA, PA7500, Fortigate.
    - Tường lửa trên máy chủ (Host-based firewall) — chạy trên từng PC hoặc server, bảo vệ chống truy cập trái phép, trojan, worm, v.v.
  - Theo cơ chế hoạt động:
    - Packet-filtering firewall — so sánh gói với một tập tiêu chí trước khi chuyển tiếp (IP nguồn, IP đích, port, TCP/UDP flags, giao thức, hướng, interface).
    - Circuit-level gateway — xác thực bắt tay TCP (TCP three‑way handshake), hoạt động ở lớp session, kiểm soát truy cập dịch vụ và yêu cầu host.
    - Application-level firewall (Proxy) — tập trung ở lớp ứng dụng, phân tích dữ liệu ứng dụng, thường là proxy, có thể cho phép hoặc từ chối lưu lượng.
    - Stateful multi-layer inspection firewall — ghi nhớ trạng thái các kết nối, kết hợp tính năng của packet filtering và application inspection.
    - Application proxy — hữu ích cho việc ghi log, giảm tải mạng, thực hiện xác thực người dùng, bảo vệ các triển khai IP yếu hoặc lỗi.
    - Network address translation (NAT).
    - VPN firewall — dùng để kết nối WAN, mã hóa lưu lượng và kiểm tra tính toàn vẹn.
    - Next‑generation firewall (NGFW) — thực hiện deep packet inspection (DPI), nhận diện ứng dụng, tích hợp IPS, và khai thác thông tin đe dọa từ cloud.

| Firewall Type                      | OSI Layer | How It Works                       | CEH Keywords           |
| ---------------------------------- | --------- | ---------------------------------- | ---------------------- |
| Packet-Filtering Firewall          | L3 / L4   | Lọc dựa trên IP, port, protocol    | Stateless filtering    |
| Stateful Firewall                  | L3 / L4   | Theo dõi trạng thái kết nối        | Session awareness      |
| Circuit-Level Gateway              | L5        | Xác thực bắt tay TCP               | Session validation     |
| Application-Level Firewall (Proxy) | L7        | Kiểm tra dữ liệu ứng dụng          | Deep packet inspection |
| Next-Generation Firewall (NGFW)    | L3–L7     | DPI + IDS/IPS + nhận diện ứng dụng | Application awareness  |

## Phát hiện xâm nhập bằng quy tắc YARA

YARA là công cụ nghiên cứu mã độc dựa trên quy tắc (rule‑based):

- `condition` — điều kiện khi nào một quy tắc cho kết quả true với một file.
- `strings` — định nghĩa các chuỗi cần tìm trong file.
- `metadata` — phần thông tin chung trong quy tắc YARA.
- Công cụ tham khảo: yarGen.

## Công cụ IDS

- Snort — phân tích lưu lượng và ghi log gói.
- Suricata — IDS thời gian thực, có thể chạy inline như IPS, hỗ trợ network security monitoring và xử lý pcap offline.

## Công cụ IPS

- Trellix IPS — phát hiện botnet, worm và các cuộc dò tìm.
- Check Point Quantum IPS.
- McAfee IPS.

## IDS and Firewall evasion techniques

**Xác định mục tiêu (Identification):**

- Quét cổng (Port scanning).
- Firewalking — dùng giá trị TTL để xác định các ACL trên gateway và lập bản đồ mạng, hoạt động tương tự traceroute.
- Banner grabbing — thu thập thông tin banner dịch vụ.

**IP spoofing, source routing và fragmentation**

- IP address spoofing — giả mạo địa chỉ IP nguồn, tạo gói với địa chỉ nguồn giả mạo (có thể dùng `hping` để tạo gói).
- Source routing — chỉ định tuyến đường đi của gói qua các đoạn mạng khác, có thể tránh các thiết bị giám sát.
- Tiny fragments — tấn công bằng cách chia gói thành các mảnh rất nhỏ, buộc một số thông tin header TCP nằm trong mảnh tiếp theo.

**Bypassing FW/IDS using a proxy server**

- Từ thiết bị tới tường lửa: chỉ cần cấu hình proxy trên máy tính.

**ICMP tunneling**

- Cài đặt `ICMPTX` hoặc công cụ tương tự.
- Chèn lệnh hoặc payload vào phần dữ liệu của yêu cầu ICMP echo.
- IDS có thể cho rằng đó là lưu lượng hợp lệ và cho phép pass.

**Bypassing IDS/Firewall through ACK tunneling**

- Nhiều tường lửa không lọc gói ACK vì cho rằng chúng đến từ kết nối đã thiết lập.
  - Kẻ tấn công thiết lập kết nối hợp lệ.
  - Dùng `hping` tạo gói ACK.
  - Tường lửa có thể cho phép qua.

**HTTP tunneling**

- Tunnel lưu lượng qua TCP port 80 bằng công cụ như `chisel`.
- HTTP tunneling che giấu danh tính, vượt chặn và chia sẻ tài nguyên qua HTTP.

**SSH tunneling**

- Dùng OpenSSH (`OpenSSH`) để mã hóa và tunnel lưu lượng.
- Local port forwarding (LPF) để truy cập tài nguyên nội bộ.
- Remote port forwarding và dynamic port forwarding (SOCKS proxy) qua SSH.

**DNS tunneling**

- Tận dụng giới hạn UDP (vd. 255 byte) trong truy vấn DNS để nhúng dữ liệu độc hại vào các gói DNS.
- DNSSEC không phát hiện nội dung bị nhúng như vậy.
- Thường dùng để duy trì kết nối tới C2; công cụ: `iodine`, `dnscat2`.

**Hệ thống bên ngoài (External system)**

- Người dùng làm việc từ xa với laptop có quyền truy cập hệ thống.
- Kẻ tấn công đánh cắp lưu lượng, session ID hoặc cookie.
- Kẻ tấn công có thể truy cập mạng nội bộ công ty.
- Kẻ tấn công có thể kích hoạt lệnh `openURL()` khiến trình duyệt tải mã độc từ server của họ.

**MITM attacks**

- Kẻ tấn công thực hiện poisoning DNS server.
- Người dùng gửi yêu cầu đến `facebook.com` nhưng được chuyển tới server độc hại.
- Kẻ tấn công có thể tunnel lưu lượng HTTP của nạn nhân.

**Bypassing through content**

- Gửi nội dung chứa mã độc (macro, exe, com, bat, v.v.).
- Macro bypass exploit; tệp thực thi được tải về và chạy.

**XSS attack (Cross‑Site Scripting)**

- XSS xảy ra khi xử lý tham số đầu vào không an toàn.
- Chèn mã HTML/JS độc hại.
- Có thể dùng mã ASCII/HEX, mã hóa, và obfuscation để né lọc.

**Bypassing WAF**

- HTTP header spoofing — giả mạo header và cú pháp.
- Phát hiện blacklist — xác định các từ khóa bị blacklist (ví dụ SQL).
- Fuzzing/brute forcing — dùng wordlists.
- Lạm dụng cipher SSL/TLS — dùng `sslscan` để kiểm tra cipher.

**HTML smuggling**

- Đính kèm HTML5 chứa payload.
- Thông qua JavaScript và URL lure để lừa tải xuống nội dung độc hại.

**Windows BITS**

- Background Intelligent Transfer Service (BITS) dùng để phân phối cập nhật Windows.
- `bitsadmin` có thể tạo job để chuyển file (bị lạm dụng để truyền file độc hại) và tạo persistence.

**Các kỹ thuật né tránh khác**

- Insertion attack — làm rối IDS bằng cách buộc nó đọc các gói không hợp lệ.
- Evasion — IDS bỏ qua một số gói nhưng host đích vẫn chấp nhận chúng (vấn đề tại lớp IP/TCP và trạng thái kết nối).
- DoS — tiêu thụ tài nguyên để khiến thiết bị không thể xử lý cảnh báo.
- Obfuscation — chỉ đích nhận biết được nội dung, IDS không thể giải mã.
- False positive generation — tạo nhiều cảnh báo giả để che dấu cuộc tấn công thực sự.
- Session splicing — chia traffic thành nhiều gói nhỏ để IDS không khớp mẫu trước khi reconstruct session.
- Unicode evasion technique — nhiều biểu diễn cho cùng một ký tự (UTF‑16, UTF‑8), khiến lọc ký tự không nhất quán.
- Fragmentation attack — nếu MTU bị vượt, gói bị phân mảnh; kẻ tấn công lợi dụng để né lọc.
- Time to live (TTL) attacks — khai thác kiến thức về topology để khiến gói bị drop trước khi tới IDS.
- Urgent (URG) flag — TCP có con trỏ URG; một số IDS không xử lý chính xác tính năng này.
- Invalid RST packets — gửi RST với checksum không hợp lệ.
- Polymorphic shellcode — mã độc thay đổi biểu diễn để né signature-based NIDS.
- ASCII shellcode — chỉ dùng ký tự ASCII để né một số lọc.
- Application layer attacks — lợi dụng file media (ảnh, audio, video) và sai sót trong giải nén/compression.
- Desynchronization — gửi SYN trước khi kết nối thật được thiết lập hoặc dùng sequence numbers khác nhau để làm rối việc reconstruct.
- Domain Generation Algorithms (DGA) — tạo nhiều domain động để thay đổi nhanh điểm C2.

**NAC và né tránh bảo mật điểm cuối (endpoint security)**

Network Access Control (NAC):

- VLAN hopping — chiếm quyền truy cập Dynamic Trunking Protocol (DTP) để thay đổi chế độ switch; công cụ: `VLANPWN`.
- Dùng thiết bị đã xác thực (pre‑authenticated device) — lợi dụng thiết bị đã được cho phép (ví dụ Raspberry Pi) để smuggle gói vào mạng.

**Bypass endpoint security**

- Ghostwriting — thay đổi cấu trúc nhị phân mà không làm thay đổi chức năng để né AV (ghostwriting.sh).
- Application whitelisting bypass — DLL hijacking đặt DLL độc hại với tên hợp lệ.
- Dechaining macros — spawn qua ShellCOM, sử dụng VBA/XMLDOM để tải mã trong tiến trình Office.
- Clearing memory hooks — tìm DLL liên quan tới syscall, dùng `x64dbg` để xác định và ghi đè hook bộ nhớ.
- Process injection — chèn mã vào không gian tiến trình đang chạy (sử dụng API như `VirtualAllocEx()`, `WriteProcessMemory()`, `CreateRemoteThread()`).
- Living‑Off‑The‑Land binaries (LoL bins) — dùng công cụ sẵn có trên hệ thống; ví dụ dùng `rundll32` để thực thi payload.
- CPL side‑loading — giả mạo applet CPL để ẩn mã độc, dùng `CPLResourceRunner`.
- Sử dụng mẫu Metasploit (`msfvenom`) và kiểm tra tỉ lệ phát hiện bằng VirusTotal (`VirusTotal`).
- AMSI bypass — hạ cấp PowerShell, obfuscation hoặc khai thác lỗi để né AMSI (`AMSI`).
- Fast‑flux DNS — thay đổi nhanh IP và tên domain để né blacklist và che giấu C&C.
- Các kỹ thuật khác: shellcode encryption, giảm entropy nhị phân, thoát sandbox, tắt event tracing, giả mạo call stack, mã hóa beacon trong bộ nhớ.

**Công cụ né tránh IDS/Firewall**

- Traffic IQ Professional
- Colasoft Packet Builder

## Honeypots

- Ghi nhận truy cập cổng (log port access).
- Giám sát phím bấm (monitor keystrokes) trong môi trường giả lập.
- Cảnh báo sớm về chiến dịch tấn công.

**Các loại honeypots:**

- Low‑interaction — mô phỏng một số dịch vụ/các ứng dụng cơ bản (ví dụ tiny‑ssh‑honeypot, KFSensor, honeytrap).
- Medium‑interaction — mô phỏng hệ điều hành, ứng dụng và dịch vụ ở mức trung bình.
- High‑interaction — mô phỏng đầy đủ dịch vụ và ứng dụng của mạng mục tiêu.
- Pure honeypot — mô phỏng mạng sản xuất thực tế.
- Production honeypots — triển khai trong môi trường sản xuất, chỉ thu thập thông tin hạn chế (thường low‑interaction).
- Research honeypots — triển khai bởi các viện nghiên cứu.
- Malware honeypots — dùng để bẫy chiến dịch mã độc, giả lập API cũ/vulnerable (ví dụ SMBv1).
- Database honeypots, spam honeypots (open mail relays), email honeypots (email giả), spider honeypots (bẫy web crawlers).
- Honeynets — mạng gồm nhiều honeypot.

**Công cụ:**

- HoneyBOT (medium interaction)
- Blumira
- NeroSwarm

**Phát hiện honeypot:**

- Fingerprint dịch vụ đang chạy — dùng `nmap -sV -p 80 <ip>`.
- Phân tích thời gian phản hồi — đo độ trễ (ví dụ `nmap --scan-delay 1s --max-retries 5 <ip>`).
- Kiểm tra MAC để tìm các OUI bất thường — `arp-scan --interface=eth0 --localnet`.
- Liệt kê các port mở bất thường — `nmap -p <ports> <ip>`.
- Phân tích cấu hình hệ thống và metadata — kiểm tra cấu hình mặc định, banner lỗi thời, sự không nhất quán thông tin hệ thống.

**Phát hiện và vô hiệu hóa honeypot**

- Layer 7 tar pits — tương tự honeypot, làm chậm các nỗ lực trái phép (phát hiện qua độ trễ phản hồi).
- Layer 4 tar pits — thao tác TCP/IP stack để làm chậm sự lây lan của worm/backdoor (ví dụ đặt zero‑window để chặn dữ liệu).
- Layer 2 tar pits — bảo vệ chống tấn công trong cùng mạng.
- Honeypot chạy trên VMware — phát hiện qua MAC address.
- Honeyd — daemon honeypot, tạo phản hồi SMTP giả; có thể phát hiện bằng TCP fingerprinting dựa trên thời gian.
- Kiểm tra `/proc` (proc/mounts, proc/interrupts, proc/cmdline) khi honeypot chạy ở user‑mode UML.
- `snort_inline` — có khả năng thao tác gói (packet manipulation) và rewrite rules trong `iptables`.
- Bait and switch — chuyển hướng toàn bộ traffic tới honeypot.

**Công cụ phát hiện honeypot:**

- send safe honeypot hunter
