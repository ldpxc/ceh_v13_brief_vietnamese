### CEHv13 - Module 03 - Scanning Networks

## Giới thiệu

**Phân loại Quét mạng (Types of Scanning) [Trang 284 - 285]:**

- **Port Scanning (Quét cổng):** Liệt kê các cổng và dịch vụ đang mở. Quá trình này kết nối hoặc thăm dò các cổng TCP/UDP của hệ thống mục tiêu để xem các dịch vụ có đang ở trạng thái lắng nghe (listening) hay không.
- **Network Scanning (Quét mạng):** Quy trình xác định các máy chủ (hosts) đang hoạt động và địa chỉ IP của chúng trên mạng để chuẩn bị tấn công hoặc đánh giá bảo mật.
- **Vulnerability Scanning (Quét lỗ hổng):** Phương pháp kiểm tra xem hệ thống có thể bị khai thác hay không bằng cách xác định các điểm yếu/lỗ hổng đã biết thông qua cơ sở dữ liệu lỗ hổng.

Mục đích của việc quét mạng là khám phá các kênh liên lạc có thể bị khai thác, thăm dò càng nhiều cổng lắng nghe (listeners) càng tốt và theo dõi những cổng phản hồi hoặc hữu ích cho nhu cầu cụ thể của kẻ tấn công. Trong giai đoạn quét của một cuộc tấn công, kẻ tấn công cố gắng tìm ra nhiều cách khác nhau để xâm nhập vào hệ thống mục tiêu. Kẻ tấn công cũng cố gắng khám phá thêm thông tin về hệ thống mục tiêu để xác định sự hiện diện của bất kỳ lỗ hổng cấu hình nào, từ đó sử dụng các thông tin thu được để phát triển chiến lược tấn công.

Quét mạng không chỉ dùng để nhận diện địa chỉ IP và cổng mở. Nó còn là bước thu thập thông tin chiến lược để xây dựng bản đồ mạng, đánh giá kỹ thuật phòng thủ hiện có và xác định lỗ hổng yếu nhất trong chuỗi phòng thủ. Một cuộc quét hiệu quả phải cho biết cả trạng thái của host, tính khả dụng của dịch vụ và bề mặt tấn công của hệ thống đích.

**Mục tiêu của Quét mạng (Objectives of Network Scanning) [Trang 284 - 285]:**

- Phát hiện các live hosts, địa chỉ IP và các cổng đang mở trên mạng.
- Khám phá Hệ điều hành (OS) và kiến trúc hệ thống của mục tiêu (còn gọi là OS fingerprinting).
- Khám phá các dịch vụ đang chạy/lắng nghe trên hệ thống mục tiêu để tìm ra lỗ hổng có thể bị khai thác.
- Xác định các ứng dụng cụ thể hoặc phiên bản của một dịch vụ cụ thể.
- Nhận diện các lỗ hổng trên bất kỳ hệ thống mạng nào.
- Vẽ sơ đồ cấu trúc liên kết mạng (Network topology), bao gồm thiết bị, router, switch và sự kết nối giữa chúng.
- Khai thác thông tin thiết bị và lớp mạng để xác định vị trí của tường lửa, VPN, DMZ và các điểm yếu trong kiến trúc.
- Sử dụng các cổng đang mở, kẻ tấn công sẽ xác định phương thức tốt nhất để xâm nhập vào hệ thống.
- Thông qua OS fingerprinting, kẻ tấn công có thể xây dựng chiến lược tấn công dựa trên các lỗ hổng của Hệ điều hành đó.
- Việc khám phá các dịch vụ cung cấp cho kẻ tấn công dấu hiệu về các lỗ hổng (dựa trên dịch vụ) có thể bị khai thác để giành quyền truy cập vào hệ thống đích.
- Xác định các lỗ hổng trên bất kỳ hệ thống mạng nào giúp kẻ tấn công xâm phạm hệ thống hoặc mạng mục tiêu thông qua các mã khai thác (exploits) đa dạng.

### 1. TCP Communication Flags (Cờ giao tiếp TCP) - Trang 286-287

Tiêu đề TCP chứa 6 cờ kiểm soát (mỗi cờ kích thước 1 bit) để quản lý kết nối giữa các host:

- **`SYN` (Synchronize):** Báo hiệu việc truyền một số thứ tự (sequence number) mới. Cờ này đại diện cho việc thiết lập kết nối ban đầu (bắt tay 3 bước - three-way handshake).
- **`ACK` (Acknowledgement):** Xác nhận đã nhận được đường truyền và xác định số thứ tự dự kiến tiếp theo. Được đặt trên mọi phân đoạn sau gói `SYN` ban đầu.
- **`FIN` (Finish):** Đặt thành "1" để thông báo đóng kết nối một cách nhẹ nhàng, báo hiệu không có thêm dữ liệu nào được gửi đến hệ thống từ xa nữa.
- **`RST` (Reset):** Buộc chấm dứt liên lạc. Đặt thành "1" khi có lỗi trong kết nối hiện tại để hủy bỏ kết nối. Kẻ tấn công thường dùng cờ này để quét các cổng mở.
- **`PSH` (Push):** Ép chuyển giao dữ liệu ngay lập tức. Báo cho hệ thống từ xa biết cần chuyển ngay dữ liệu đang đệm cho ứng dụng nhận.
- **`URG` (Urgent):** Đánh dấu dữ liệu là ưu tiên (gửi ngoài luồng - out-of-band). Hướng dẫn hệ thống xử lý dữ liệu chứa trong gói càng sớm càng tốt, tạm dừng các quá trình xử lý dữ liệu khác.
- **Lưu ý về quét SYN:** Quét SYN chỉ cần gửi gói `SYN` đến cổng mục tiêu và chờ phản hồi `SYN/ACK` hoặc `RST`. Do không hoàn tất quá trình bắt tay 3 bước, phương pháp này thường ít bị ghi log và khó bị phát hiện hơn so với quét TCP Connect. Các cờ khác như `URG`, `PSH` thường không cần dùng trong quét SYN truyền thống.
- **Lưu ý:** Quá trình quét SYN chủ yếu giải quyết ba cờ: SYN, ACK và RST. Bạn có thể sử dụng ba cờ này để thu thập thông tin bất hợp pháp từ các máy chủ trong quá trình liệt kê (enumeration).

### Cơ chế Thiết lập và Chấm dứt phiên TCP (TCP Session Establishment & Termination) (Trang 288-289)

- **Cơ chế bắt tay 3 bước (Three-way handshake):**
  - Để khởi tạo kết nối, máy nguồn gửi một gói `SYN` tới máy đích.
  - Khi nhận được gói `SYN`, máy đích phản hồi bằng cách gửi lại một gói `SYN/ACK`.
  - Máy nguồn gửi một gói `ACK` để xác nhận đã nhận được gói `SYN/ACK`. Kết nối lúc này chuyển sang trạng thái "OPEN".
- **Chấm dứt phiên (Session termination):**
  - Sau khi truyền xong dữ liệu, người gửi gửi yêu cầu chấm dứt kết nối tới người nhận thông qua gói `FIN` (hoặc `RST`).
  - Người nhận xác nhận yêu cầu bằng cách gửi một gói `ACK` cho người gửi, sau đó tự gửi đi một gói `FIN` của chính nó để kết thúc hoàn toàn kết nối.
  - **Giao thức TCP duy trì các kết nối stateful cho tất cả các giao thức hướng kết nối (connection-oriented) trên Internet và hoạt động tương tự như giao tiếp điện thoại thông thường:** nhấc ống nghe, nghe thấy âm báo quay số, bấm số và chuông sẽ reo ở đầu bên kia cho đến khi có người nhấc máy và nói "Xin chào".
  - _(Chi tiết chấm dứt phiên):_ Khi nhận được yêu cầu chấm dứt kết nối (FIN hoặc RST), người nhận xác nhận yêu cầu bằng cách gửi lại gói ACK cho người gửi, và cuối cùng tự gửi đi gói FIN của chính nó. Sau đó, hệ thống sẽ chấm dứt hoàn toàn kết nối đã thiết lập.

### 2. Công cụ quét và tạo gói

- **Nmap (Trang 290):** Là công cụ quét mạng và bảo mật ("Network Mapper") dùng để khám phá mạng và hacking. Nó gửi các gói tin đặc biệt để khám phá host, cổng, dịch vụ, hệ điều hành (OS), và thực hiện ping sweeps.
  - Nmap hỗ trợ nhiều chế độ quét như SYN scan, ACK scan, UDP scan, SCTP scan, IP protocol scan và IPv6 scan. Nó cũng cung cấp khả năng fingerprint OS, phát hiện dịch vụ, hỗ trợ `NSE` để viết script tự động hóa và thực hiện quét ẩn danh thông qua decoy, fragmentation, spoofing.
- **Metasploit (Trang 298):** Dự án mã nguồn mở dùng để kiểm thử xâm nhập. Tự động hóa quá trình khám phá và khai thác, thu thập bằng chứng và quét cổng mở.
  - Metasploit có các module auxiliary scanning để quét host, quét cổng và kiểm tra lỗ hổng. Nó dễ dàng tích hợp với Nmap bằng cách nhập kết quả quét (`db_import`) để lập kế hoạch khai thác tiếp theo.
- **NetScanTools Pro (Trang 299):** Công cụ điều tra dùng để khắc phục sự cố, giám sát và phát hiện thiết bị trên mạng (địa chỉ IPv4/IPv6, hostnames, tên miền, email).
  - Nó bao gồm nhiều tiện ích mạng như Ping, Traceroute, DNS lookup, NetBIOS query, SNMP walk và port scan. Những tính năng này giúp phân tích mạng chi tiết hơn so với các lệnh quét đơn thuần.
- **Colasoft Packet Builder (Trang 393-394):** Công cụ tạo gói tin (Packet Crafting Tool) cho phép kẻ tấn công tạo các gói TCP tùy chỉnh để quét mục tiêu nằm sau tường lửa.
  - Công cụ này giúp thay đổi các trường header ở mức byte, thêm checksum sai, phân mảnh gói và tạo các gói malformed để thử nghiệm khả năng xử lý của IDS/Firewall.

* **Nmap:** Quản trị viên mạng có thể sử dụng Nmap để kiểm kê mạng, quản lý lịch nâng cấp dịch vụ và theo dõi thời gian hoạt động. Kẻ tấn công sử dụng Nmap để trích xuất thông tin như host đang hoạt động, cổng mở, dịch vụ (tên và phiên bản ứng dụng), loại bộ lọc gói/tường lửa, chi tiết MAC và Hệ điều hành. Cú pháp: `# nmap <options> <Target IP address>`
* **Metasploit:** Cung cấp thông tin về các lỗ hổng bảo mật và hỗ trợ kiểm thử xâm nhập cũng như phát triển chữ ký IDS. Ưu điểm lớn nhất của framework này là cách tiếp cận mô-đun (modular approach), cho phép kết hợp bất kỳ mã khai thác (exploit) nào với bất kỳ payload nào.
* **NetScanTools Pro:** Giúp kẻ tấn công tự động hoặc thủ công liệt kê các địa chỉ IPv4/IPv6, hostnames, tên miền, địa chỉ email và URL. Công cụ này kết hợp nhiều tiện ích mạng được phân loại theo chức năng: active, passive, DNS, và local computer.

**Công cụ Hping3 (Trang 292-297):**
Hping3 là công cụ quét mạng và tạo gói tin qua dòng lệnh, hỗ trợ TCP, UDP, ICMP và raw-IP. Các lệnh phổ biến:

- `hping3 -1 10.0.0.25`: Thực hiện ICMP ping sweep (Trang 294).
- `hping3 -A 10.0.0.25 -p 80`: Thực hiện ACK scan trên port 80 để dò tìm tường lửa (Trang 294).
- `hping3 -2 10.0.0.25 -p 80`: Thực hiện UDP scan trên port 80 (Trang 294).
- `hping3 192.168.1.103 -Q -p 139`: Thu thập Initial Sequence Number (số thứ tự ban đầu) (Trang 294).
- `hping3 -S 72.14.207.99 -p 80 --tcp-timestamp`: Bật tùy chọn tcp-timestamp để đoán thời gian cập nhật và thời gian hoạt động của máy chủ (Trang 295).
- `hping3 -8 50-60 -S 10.0.0.25 -V`: Thực hiện SYN scan trên dải port từ 50-60 (Trang 295).
- `hping3 -F -P -U 10.0.0.25 -p 80`: Thực hiện scan với các cờ FIN, PSH và URG trên port 80 (Trang 295).
- `hping3 -1 10.0.1.x --rand-dest -I eth0`: Quét toàn subnet để tìm host sống bằng cách gửi ICMP request ngẫu nhiên (Trang 295).
- `hping3 -9 HTTP -I eth0`: Chế độ lắng nghe (listen mode), chặn mọi lưu lượng có chứa chữ ký HTTP (Trang 295).
- `hping3 -S 192.168.1.1 -a 192.168.1.254 -p 22 --flood`: Thực hiện TCP SYN flood tới nạn nhân bằng IP giả mạo (Trang 296).
- **Tích hợp AI vào Hping3 (Hping Scan with AI):** Kẻ tấn công có thể sử dụng các công cụ AI (như ChatGPT) để tự động hóa việc tạo lệnh Hping3. Ví dụ các prompt (Trang 296-299):
  - `"Use Hping3 to perform ICMP scanning on the target IP address 10.10.1.11 and stop after 10 iterations"` -> AI sẽ tạo ra lệnh `hping3 --icmp --count 10 10.10.1.11`.
  - `"Run an hping3 ACK scan on port 80 of target IP 10.10.1.11"` -> AI sẽ tạo ra lệnh `sudo hping3 --ack -p 80 10.10.1.11`.

_(Bổ sung thêm một số công cụ quét khác theo giáo trình):_ `sx` (mã nguồn mở trên GitHub), `RustScan` (quét cực nhanh), `MegaPing`, `PRTG Network Monitor`.

### 3. Kỹ thuật quét để phát hiện host (Host Discovery Techniques) - Trang 301-311

Việc quét host là bước đầu tiên trong quá trình quét mạng (Network Scanning), được coi là nhiệm vụ chính yếu để tránh lãng phí thời gian quét mọi cổng trên mọi hệ thống không phản hồi. Nó cung cấp trạng thái chính xác của các hệ thống "còn sống" trong mạng.

- **Vô hiệu hóa quét cổng:** Dùng lệnh `nmap -sn` để chỉ phát hiện host (host discovery only) mà không quét cổng (Trang 302).
- **Quét ARP (ARP ping scan):** Chỉ dùng trong mạng nội bộ (local only) IPv4. Nó gửi yêu cầu ARP để ánh xạ IP tới địa chỉ MAC trong mạng, cực kì hiệu quả và vượt qua được các tường lửa nghiêm ngặt. Lệnh: `nmap -sn -PR 192.168.1.69` (Trang 301-302).
  - **Ưu điểm của quét ARP (ARP Ping Scan):**
    - Được coi là hiệu quả và chính xác hơn các kỹ thuật khám phá host khác.
    - Tự động xử lý các yêu cầu ARP, truyền lại và hết hạn (timeout) theo quyết định riêng.
    - Hữu ích cho việc khám phá hệ thống khi cần quét các không gian địa chỉ lớn.
    - Có thể hiển thị thời gian phản hồi hoặc độ trễ của một thiết bị đối với gói tin ARP.
  - _(Chi tiết về cơ chế ARP Ping Scan)_: Trong hầu hết các mạng, có rất nhiều địa chỉ IP không được sử dụng tại một thời điểm nhất định (đặc biệt ở dải IP private). Khi kẻ tấn công cố gắng gửi các gói IP (như ICMP echo) đến mục tiêu, Hệ điều hành phải xác định địa chỉ đích phần cứng (MAC/ARP) tương ứng. Nếu đích không phản hồi ARP, OS gốc sẽ từ bỏ việc gửi ping. Bằng cách dùng trực tiếp ARP request probes, nếu nhận được bất kỳ phản hồi ARP nào, kẻ tấn công biết chắc chắn host đó đang "sống". Lưu ý: Lệnh `-sn` sẽ vô hiệu hóa quét cổng, nhưng vì Nmap dùng ARP ping scan làm mặc định trong mạng LAN, muốn tắt ARP scan để ép dùng loại ping khác, ta phải dùng cờ `--disable-arp-ping`.
- **UDP ping scan:** Gửi định dạng gói UDP để vượt qua các tường lửa chỉ lọc TCP. Lệnh: `nmap -sn -PU` (Trang 303-304).
  - _(Chi tiết UDP Ping Scan)_: Cổng mặc định mà Nmap sử dụng cho quét UDP ping là **40,125**. Cổng rất không phổ biến này được dùng làm mặc định để gửi các gói UDP tới đích, và có thể thay đổi bằng cấu hình `DEFAULT_UDP_PROBE_PORT_SPEC` khi biên dịch Nmap. Nếu mục tiêu ngoại tuyến, các thông báo lỗi như host/network unreachable hoặc TTL exceeded sẽ được trả về.
  - _Ưu điểm:_ UDP ping có khả năng phát hiện các hệ thống nằm sau tường lửa cấu hình lọc TCP nghiêm ngặt (bỏ quên lưu lượng UDP).
- **ICMP Echo ping scan:** Gửi các yêu cầu ICMP ECHO. Nmap sử dụng tùy chọn `-PE` (hoặc `-P`). Bạn có thể tăng số lượng ping song song với cơ chế `-L` và điều chỉnh khoảng thời gian timeout với `-T` (Trang 304-306).
  - _(Chi tiết ICMP ECHO Ping Scan)_: Do ICMP không có khái niệm trừu tượng về cổng (port abstraction), quét ICMP khác với quét cổng. Lệnh này hoạt động hiệu quả trên máy UNIX/Linux và BSD vì ngăn xếp TCP/IP của chúng phản hồi các yêu cầu ICMP echo gửi đến địa chỉ broadcast. Tuy nhiên, kỹ thuật này không hoạt động trên mạng dựa trên Windows vì ngăn xếp TCP/IP của Windows không trả lời các probe ICMP hướng đến địa chỉ broadcast.
- **ICMP Timestamp ping:** Lấy thông tin thời gian hiện tại từ máy mục tiêu, hữu ích khi quản trị viên chặn các gói ICMP Echo truyền thống. Lệnh: `nmap -sn -PP` (Trang 307).
- **ICMP Address mask ping:** Gửi truy vấn mask để lấy giá trị subnet mask từ đích. Lệnh: `nmap -sn -PM` (Trang 308).
  - _(Chi tiết Ping Sweep)_: Khi một hệ thống ping, nó gửi một gói đơn duy nhất. Gói này chứa **64 byte** (56 byte dữ liệu và 8 byte thông tin protocol header). Kẻ tấn công sử dụng các công cụ tính subnet mask để xác định số lượng host có trong mạng con, sau đó dùng ping sweep để tạo bảng kiểm kê (inventory) các hệ thống đang sống.
  - _(Chi tiết ICMP Timestamp ping)_: Việc phản hồi từ máy đích là có điều kiện, nó có thể phản hồi hoặc không phụ thuộc vào cấu hình của quản trị viên ở đầu máy đích. Thường được sử dụng để đồng bộ hóa thời gian.
  - _(Chi tiết ICMP Address mask ping)_: Tương tự như timestamp ping, phản hồi mask từ đích là có điều kiện. Phương pháp này rất hiệu quả khi quản trị viên đã chặn các gói ICMP Echo truyền thống.
- **TCP SYN ping:** Khởi tạo bắt tay 3 bước bằng gói `SYN` trống. Cực kỳ stealthy (ẩn danh) vì nó phát hiện máy ONLINE mà không tạo kết nối TCP đầy đủ (không bị ghi log lại). Lệnh: `nmap -sn -PS` (Trang 309).
- **TCP ACK ping:** Gửi thẳng một gói TCP `ACK` trống (mặc định dùng port 80). Tối đa hóa khả năng vượt tường lửa stateful vì phần lớn tường lửa chỉ tập trung chặn các gói `SYN` mở kết nối. Lệnh: `nmap -sn -PA` (Trang 309-310).
- **IP protocol ping:** Gửi nhiều loại probe với các giao thức IP khác nhau (mặc định: ICMP, IGMP, IP-in-IP). Bất kỳ phản hồi nào cũng cho biết host trực tuyến. Lệnh: `nmap -sn -PO` (Trang 310-311).
  - _(Chi tiết TCP SYN/ACK ping)_: Trong TCP SYN Ping, cổng 80 được sử dụng làm cổng đích mặc định. Kẻ tấn công có thể chỉ định một dải các cổng mà không cần khoảng trắng giữa -PS và số cổng (ví dụ: `nmap -sn -PS22-25,80,113,1050,35000`). Ưu điểm là có thể quét song song nhiều máy mà không bị lỗi time-out. Đối với TCP ACK Ping, cả gói SYN và ACK đều có thể tối đa hóa cơ hội vượt tường lửa, tuy nhiên do firewalls thường được cấu hình để chặn các gói SYN ping (vì quá phổ biến), nên probe bằng ACK sẽ vượt qua các rule set của firewall dễ dàng hơn.
  - _(Chi tiết IP protocol ping)_: Nmap gửi các gói IP với header của bất kỳ số giao thức nào được chỉ định. Nếu không chỉ định, nhiều gói IP cho ICMP (giao thức 1), IGMP (giao thức 2) và IP-in-IP (giao thức 4) sẽ được gửi theo mặc định. Có thể cấu hình các giao thức mặc định này bằng cách thay đổi `DEFAULT_PROTO_PROBE_PORT_SPEC` trong file `nmap.h` lúc biên dịch.
- **Phát hiện Host bằng AI (Host Discovery with AI) (Trang 312-314):** Kẻ tấn công sử dụng ChatGPT để viết script hoặc tạo chuỗi lệnh quét thông minh.
  - _Ví dụ Prompt 1:_ `"Scan the target network 10.10.1.0/24 for active hosts and place only the IP addresses into a file scan1.txt"` -> AI sinh ra chuỗi lệnh pipeline: `nmap -sn 10.10.1.0/24 -oG - | awk '/Up$/{print $2}' > scan1.txt`.
  - _Ví dụ Prompt 2:_ `"Run a fast but comprehensive Nmap scan against scan1.txt with low verbosity and write the results to scan2.txt"` -> AI sinh ra lệnh: `nmap -T4 -iL scan1.txt -oN scan2.txt -v0`.

### 4. Công cụ ping sweep và Kỹ năng mở rộng (Trang 316-317)

Các công cụ ping sweep gửi đồng loạt nhiều ICMP ECHO đến một dải IP để tìm host đang hoạt động. Các công cụ đề cập trong tài liệu gốc:

- **Angry IP Scanner:** Là công cụ quét cổng và địa chỉ IP sử dụng phương pháp đa luồng (multithreaded) để tăng tốc độ. Nó ping từng IP, tùy chọn phân giải hostname, xác định MAC và quét cổng. Thông qua các plugin, công cụ này thu thập thêm thông tin NetBIOS (tên máy tính, tên workgroup, người dùng Windows đang đăng nhập), nhận diện web server và hỗ trợ lưu kết quả dưới các định dạng CSV, TXT, XML hoặc danh sách IP-Port.
- **SolarWinds Engineer’s Toolset**
- **NetScanTools Pro**
- **Colasoft Ping Tool**
- **Advanced IP Scanner**
- **OpUtils**

_(Bổ sung thông tin ngoài nguồn - Extra tools & knowledge):_

- **Superscan:** Một bộ quét và xử lý cổng TCP mạnh mẽ của Foundstone (McAfee) thường chạy trên hệ điều hành Windows.
- **Pinkie:** Bộ xử lý sự cố tổng hợp cho Windows bao gồm Ping quét, rà quét mạng và kiểm tra host.
- **Quét Nmap qua TOR:** Sử dụng Nmap qua proxychains để che giấu danh tính và IP quét. Khi quét qua TOR/Proxychains, bạn không thể sử dụng scan ẩn danh (SYN scan) kiểu gửi gói rời rạc mà mặc định phải ép kết nối bằng gói tin đầy đủ `-sT` (Ví dụ: `proxychains nmap -sT -PN -p 80 <target>`).

## 1. Port và phát hiện dịch vụ (Ports and Services)

_(Lưu ý: Bảng dưới đây cung cấp thông tin các port quan trọng được trích xuất từ tài liệu "Reserved ports table" và các ví dụ quét thực tế)._

### Các port quan trọng (Trang 319 - 321):

- **20/21 (TCP)**: FTP data transfer / FTP command
- **22 (TCP)**: SSH (Secure Shell)
- **23 (TCP)**: Telnet
- **25 (TCP)**: SMTP (Email server)
- **53 (TCP/UDP)**: DNS (Domain name server)
- **67/68 (UDP)**: DHCP (bootps server / bootpc client)
- **69 (UDP)**: TFTP (Trivial File Transfer Protocol)
- **80 (TCP/UDP)**: HTTP (WWW)
- **110 (TCP)**: POP3 (PostOffice V.3)
- **123 (UDP)**: NTP (Network Time Protocol)
- **135 (TCP)**: MS RPC (Microsoft Windows RPC - dựa trên kết quả quét)
- **137–139 (TCP/UDP)**: NetBIOS (Name Service, Datagram Service, Session Service)
- **143 (TCP/UDP)**: IMAP (Internet Message Access Protocol)
- **161/162 (UDP)**: SNMP / SNMP-trap
- **389 (TCP/UDP)**: LDAP (dựa trên kết quả quét)
- **443 (TCP)**: HTTPS (dựa trên kết quả quét)
- **445 (TCP)**: SMB (Microsoft DS / kerberos-ds)
- **500 (UDP)**: ISAKMP/IKE (Internet Security Association and Key Management Protocol)
- **514 (UDP/TCP)**: Syslog / shell
- **1433 (TCP/UDP)**: MSSQL (Microsoft SQL Server)
- **3389 (TCP)**: RDP (ms-wbt-server - dựa trên kết quả quét)
- **5060 (TCP/UDP)**: SIP (Session Initiation Protocol)

_(Thông tin ngoài nguồn: Port 3306 TCP (MySQL) phổ biến trong thực tế mạng nhưng không xuất hiện trong bảng mã cổng của tài liệu Module 03 này; Dịch vụ định nghĩa cổng thường tuân theo chuẩn IANA: Well-known 0-1023, Registered 1024-49151, Dynamic 49152-65535)_.

---

## 2. Các kiểu quét cổng (Port Scan Types)

Tài liệu phân loại các kỹ thuật quét cổng dựa trên cách thao tác với các cờ TCP và giao thức:

- **TCP Connect / Full open scan (Trang 323 - 325):** Là phương pháp quét đáng tin cậy, gọi hàm hệ thống `connect()` để hoàn tất quá trình bắt tay 3 bước (three-way handshake). Nếu cổng mở, quá trình bắt tay thành công và gửi gói `ACK`, sau đó đóng lại bằng `RST`. Rất dễ bị phát hiện và bị ghi log. Lệnh Nmap: `nmap -sT` (Thêm `-v` để tăng mức độ chi tiết).
- **Stealth / Half-open (SYN) scan (Trang 325 - 326):** Chỉ gửi gói `SYN`. Nếu cổng mở, mục tiêu phản hồi `SYN/ACK`, kẻ tấn công lập tức gửi `RST` để ngắt kết nối trước khi hoàn tất handshake. Giúp ẩn danh, vượt qua quy tắc tường lửa và cơ chế ghi log. Lệnh Nmap: `nmap -sS`.
  - _(Chi tiết TCP Connect/Full Open Scan)_: Nếu hệ thống dùng hàm gọi `connect()` một cách tuyến tính cho từng cổng thì sẽ tốn rất nhiều thời gian nếu kết nối chậm. Kẻ tấn công có thể tăng tốc quét bằng cách dùng nhiều socket song song. Tính năng non-blocking I/O cho phép kẻ tấn công đặt thời gian chờ (time-out) ngắn và theo dõi tất cả các socket cùng lúc. Nhược điểm: Quét dễ bị phát hiện, dễ bị lọc và hệ thống đích sẽ ghi log kết nối. Không yêu cầu đặc quyền superuser.
  - _(Chi tiết Stealth/Half-open Scan)_: Phương pháp này cũng triển khai cơ chế bắt tay 3 bước, nhưng ở giai đoạn cuối, nó kiểm tra các gói tin xâm nhập giao diện và lập tức ngắt kết nối trước khi kích hoạt quy trình khởi tạo mới của cổng đích. Nhược điểm: Cần đặc quyền root (superuser access) để tạo các gói tin SYN thô (raw packets).
- **Inverse TCP flag scan (Trang 327):** Gửi các gói TCP với cờ được thiết lập không chuẩn (hoặc không có cờ) để né IDS. Nếu cổng mở, sẽ không có phản hồi; nếu đóng, trả về `RST/ACK`. Nhược điểm: Hoạt động dựa trên chuẩn BSD, không hiệu quả trên Windows (Windows bỏ qua chuẩn này nên tất cả các cổng đều sẽ hiển thị mở).
  - **Xmas scan (Trang 328 - 329):** Bật đồng thời các cờ `FIN`, `URG`, `PSH`. Lệnh: `nmap -sX`. _(Tương tự, `-sF` là FIN scan, `-sN` là NULL scan không bật cờ nào)_.
  - **TCP Maimon scan (Trang 330):** Gửi gói với cờ `FIN` và `ACK`. Nếu cổng đóng, trả về `RST`; nếu cổng mở trên hệ thống chuẩn BSD, gói tin sẽ bị loại bỏ (không có phản hồi). Lệnh: `nmap -sM`.
    - _(Chi tiết Inverse TCP Flag Scan)_: Ưu điểm là tránh được nhiều loại IDS và hệ thống ghi log, cực kỳ ẩn danh. Nhược điểm là yêu cầu truy cập raw socket (cần quyền superuser) và chủ yếu chỉ hiệu quả với các hệ thống sử dụng ngăn xếp TCP/IP có nguồn gốc từ chuẩn BSD (không hiệu quả với máy chủ Microsoft Windows).
    - _(Chi tiết Xmas Scan)_: Khi bật tất cả các cờ, một số hệ thống sẽ bị treo; do đó, các cờ thường được cấu hình theo mẫu vô nghĩa là URG-PSH-FIN. Phương pháp "Transmitting Packets": Bạn có thể khởi tạo tất cả các cờ khi truyền gói tin. Nếu hệ thống đích chấp nhận gói tin mà không gửi phản hồi, nghĩa là cổng đang mở.
- **ACK flag probe scan (Trang 331 - 333):** Gửi gói `ACK` và kiểm tra thông tin header trả về (TTL hoặc trường Window) của gói `RST` để ước lượng trạng thái cổng (mở/đóng). Kỹ thuật này cũng dùng để kiểm tra hệ thống lọc của firewall (stateful firewall). Lệnh Nmap: `nmap -sA` hoặc `nmap -sW`.
  - **TTL-Based ACK Flag Probe scanning:** Gửi hàng ngàn gói ACK tới các cổng TCP khác nhau. Nếu giá trị TTL của gói RST trả về nhỏ hơn giá trị ranh giới là 64, thì cổng đó đang **mở**.
  - **Window-Based ACK Flag Probe scanning:** Phân tích trường window của gói RST trả về. Nếu giá trị cửa sổ (window value) khác không (non-zero), thì cổng đó đang **mở**.
  - **Kiểm tra hệ thống lọc (Checking the Filtering Systems):** Gửi gói ACK với số sequence ngẫu nhiên. Nếu **không có phản hồi**, cổng đó đã bị lọc (có stateful firewall chặn lại). Nếu nhận được phản hồi **RST**, cổng đó không bị lọc (không có firewall).
    - _Ưu điểm:_ Loại quét này có thể né tránh IDS trong hầu hết các trường hợp.
    - _Nhược điểm:_ Cực kỳ chậm và chỉ có thể khai thác các hệ điều hành cũ có ngăn xếp TCP/IP bắt nguồn từ chuẩn BSD mang lỗ hổng.
- **IDLE / IPID Header scan (Trang 334 - 336):** Quét hoàn toàn ẩn danh bằng cách gửi địa chỉ nguồn giả (spoofed IP). Kẻ tấn công dùng một máy trạm rảnh rỗi (zombie) làm trung gian và dựa vào sự gia tăng của số định danh IP (IPID) trên máy zombie để suy ra trạng thái cổng của mục tiêu. Lệnh Nmap: `nmap -sI <Zombie IP> <Target IP>`.
  - **Quy trình thực hiện IDLE Scan (3 bước):**
    1. **Bước 1:** Gửi gói SYN+ACK tới máy Zombie để thăm dò số IPID hiện tại của nó (Ví dụ: IPID = X). Máy Zombie sẽ phản hồi bằng gói RST chứa IPID.
    2. **Bước 2:** Gửi gói SYN tới cổng của mục tiêu nhưng giả mạo địa chỉ IP nguồn là của máy Zombie.
       - _Nếu cổng mục tiêu MỞ:_ Mục tiêu gửi gói SYN+ACK cho Zombie. Do Zombie không khởi tạo kết nối này, nó sẽ phản hồi bằng một gói RST, làm số IPID của nó tăng thêm 1 (thành X + 1).
       - _Nếu cổng mục tiêu ĐÓNG:_ Mục tiêu phản hồi gói RST cho Zombie. Zombie sẽ bỏ qua gói RST này và vẫn nằm im, số IPID không thay đổi.
    3. **Bước 3:** Kẻ tấn công gửi lại một gói SYN+ACK khác cho Zombie để thăm dò lại IPID. Nếu IPID tăng 2 bước (X + 2), cổng mục tiêu đang MỞ. Nếu IPID chỉ tăng 1 bước (X + 1), cổng mục tiêu ĐÓNG.
- **UDP scan (Trang 337 - 338):** Không có bắt tay 3 bước, chỉ gửi datagram tới cổng UDP. Nếu không có phản hồi, cổng có thể mở hoặc bị lọc. Nếu nhận được lỗi ICMP port unreachable (Type 3), cổng đó đóng. Rất chậm do cơ chế giới hạn tỷ lệ phản hồi lỗi ICMP của mục tiêu. Lệnh Nmap: `nmap -sU`.
- **SSDP / UPnP scan (Trang 343):** SSDP điều khiển giao tiếp cho tính năng Universal Plug and Play (UPnP). Kẻ tấn công sử dụng công cụ khám phá UPnP SSDP M-SEARCH để quét và phát hiện các lỗ hổng UPnP, từ đó tung đòn tấn công tràn bộ đệm hoặc DoS.
- **UDP RECVFROM() và WRITE() Scanning (Trang 339):** Trên Linux, người dùng không có quyền root (non-root) có thể sử dụng kỹ thuật này. Các công cụ như Netcat thực hiện hàm `recvfrom()` trên các socket UDP không chặn; nếu nhận được lỗi `EAGAIN` hoặc `ECONNREFUSED` thì có thể suy ra trạng thái cổng.
  - _(Chi tiết UDP RECVFROM() và WRITE() Scanning)_: Trên Linux, hàm gọi `write()` vào một cổng đóng thường sẽ thất bại. Các máy quét (như Netcat hoặc pscan.c) thực hiện `recvfrom()` trên socket UDP non-blocking và thường nhận lại mã lỗi `EAGAIN (Try Again, errno 13)` nếu không có lỗi ICMP, hoặc nhận `ECONNREFUSED (Connection refused, errno 111)` nếu cổng đóng. Người dùng có quyền root cũng có thể dùng cờ `-l` (lamer UDP scan) để ép thực thi tiến trình này.
  - _Ưu/Nhược điểm của UDP Scan:_ Ưu điểm là ít rườm rà hơn so với TCP vì không phải chịu chi phí của quá trình bắt tay (handshake). Hơn nữa, vì hệ điều hành dựa trên Microsoft không thường triển khai giới hạn tốc độ ICMP, máy quét này hoạt động cực kỳ hiệu quả trên các thiết bị Windows. Nhược điểm là nó chỉ cung cấp trạng thái cổng; muốn biết phiên bản ứng dụng thì phải dùng thêm `-sV` hoặc `-O`. Quét UDP cũng đòi hỏi quyền truy cập đặc quyền (privileged access).
- **SCTP INIT Scan (Trang 339 - 340):** Giao thức SCTP hoạt động tương tự TCP/UDP (dùng cho VoIP, SS7). INIT scan tương đương với TCP SYN scan. Kẻ tấn công gửi đoạn (chunk) INIT; nếu cổng mở, nó trả về INIT+ACK; nếu cổng đóng, nó trả về ABORT. Lệnh Nmap: `nmap -sY`.
  - _Ưu điểm:_ INIT scan có thể phân biệt rõ ràng giữa các cổng ở trạng thái open (mở), closed (đóng) và filtered (bị lọc).
- **SCTP COOKIE ECHO Scan (Trang 341 - 342):** Kẻ tấn công gửi trực tiếp gói COOKIE ECHO. Nếu cổng mở, nó sẽ âm thầm hủy (drop) gói và không phản hồi. Nếu cổng đóng, nó trả về ABORT. Kỹ thuật này giúp vượt qua các tường lửa non-stateful. Lệnh Nmap: `nmap -sZ`.
  - _Ưu điểm:_ Quét cổng không dễ bị phát hiện (conspicuous) như quét INIT.
  - _Nhược điểm:_ Không thể phân biệt rõ ràng giữa các cổng đang mở và bị lọc, nó hiển thị đầu ra là open|filtered trong cả hai trường hợp.
- **List Scan (Trang 343 - 344):** Chỉ liệt kê danh sách IP/Names và thực hiện phân giải DNS ngược (reverse DNS resolution) mà không hề gửi bất kỳ gói ping nào tới host mục tiêu. Lệnh Nmap: `nmap -sL`.
  - _Ưu điểm:_ Có thể thực hiện kiểm tra tính hợp lệ (sanity check) tốt. Phát hiện các địa chỉ IP bị định nghĩa sai trong dòng lệnh hoặc tệp tùy chọn, qua đó sửa chữa các lỗi để chạy các quá trình quét mục tiêu đang hoạt động một cách chính xác.
- **IPv6 Scan (Trang 344 - 345):** Mạng IPv6 có không gian địa chỉ khổng lồ (128 bits) nên quét quét truyền thống bất khả thi. Nmap hỗ trợ quét các mục tiêu IPv6 xác định bằng lệnh: `nmap -6 <target>`.
  - Quét mạng IPv6 khó khăn và phức tạp hơn so với IPv4 do không gian địa chỉ lớn (2^64 địa chỉ trong một subnet). Nếu kẻ tấn công thỏa hiệp được một host trong subnet, chúng có thể thăm dò địa chỉ multicast cục bộ "all hosts" nếu các host có số thứ tự tuần tự hoặc sử dụng một lược đồ chung.
  - _(Chi tiết IPv6 Scan)_: Nếu kẻ tấn công có thể thỏa hiệp được một host trong mạng con IPv6, họ có thể thăm dò địa chỉ multicast cục bộ (link local multicast address) "all hosts" nếu số hiệu host được đánh theo tuần tự hoặc dùng một lược đồ tiêu chuẩn nào đó. Việc quét IPV6 gặp khó do nhiều công cụ quét mạng vẫn chưa hỗ trợ tính năng ping sweeps trên mạng IPv6.
- **Quét cổng bằng AI (Port Scanning with AI) (Trang 346 - 351):** Kẻ tấn công dùng ChatGPT để tự động hóa quét cổng trên Nmap và Metasploit.
  - _Ví dụ Prompt Nmap:_ `"Use Nmap to scan for open ports and services against a list of IP addresses in scan1.txt and copy only the port, service and version information... to a new file called scan3.txt"` -> AI xuất lệnh kết hợp `awk`/`grep` phức tạp.
  - _Ví dụ Prompt Metasploit:_ `"Use Metasploit to discover open ports on the IP address 10.10.1.22"` -> AI xuất chuỗi cấu hình: `msfconsole -q -x "use auxiliary/scanner/portscan/tcp; set RHOSTS 10.10.1.22; run; exit"`.

---

## 3. Ví dụ Nâng cao (Trang 381)

Trong tài liệu, kỹ thuật kết hợp dưới đây được ứng dụng ở phần Packet Fragmentation (Phân mảnh gói tin) để vượt qua IDS/Firewall:

**Lệnh:** `nmap -sS -T4 -A -f -v 10.10.1.11`

- **`-sS`**: Quét tàng hình (Stealth SYN scan).
- **`-T4`**: Tùy chọn Timing (Tăng tốc độ quét lên mức 4).
- **`-A`**: Tùy chọn quét toàn diện (bao gồm OS fingerprinting / phát hiện hệ điều hành, version detection, traceroute và Nmap scripts).
- **`-f`**: Phân mảnh gói tin IP (Fragment packets) thành các gói nhỏ hơn (mỗi gói thường 8 bytes IP headers), khiến các bộ lọc gói và IDS gặp khó khăn trong việc bắt giữ và phân tích dấu hiệu nhận dạng.
- **`-v`**: Tăng mức độ hiển thị thông báo tiến trình (verbose).

_=> Cú pháp này phân mảnh các gói SYN scan trong khi vẫn thực hiện dò tìm OS và dịch vụ, giúp tránh các cảnh báo dương tính giả hoặc né các luật lọc gói cơ bản của tường lửa._

### 1. Phản hồi quét (Scan Responses)

Dựa vào cách các cổng phản hồi lại các gói tin thăm dò, Nmap xác định trạng thái của cổng. Dưới đây là chi tiết phản hồi theo tài liệu:

| Loại quét (Flag)      | Cổng Mở (Open)                            | Cổng Đóng (Closed)                     | Bị lọc (Filtered / Firewall)                                      | Không bị lọc (Unfiltered) | Tham chiếu |
| :-------------------- | :---------------------------------------- | :------------------------------------- | :---------------------------------------------------------------- | :------------------------ | :--------- |
| **-sT** (TCP Connect) | SYN/ACK (sau đó ACK rồi RST)              | RST                                    | Không phản hồi / ICMP unreachable                                 |                           |            |
| **-sS** (Stealth/SYN) | SYN/ACK (sau đó gửi RST)                  | RST                                    | Không phản hồi / ICMP unreachable                                 |                           |            |
| **-sA** (ACK Probe)   | Trả về RST (Xem TTL hoặc Window size > 0) | Trả về RST (Window size = 0)           | Không phản hồi / ICMP unreachable                                 | Trả về RST                |            |
| **-sI** (IDLE scan)   | IPID của Zombie tăng 2 bước (+2)          | IPID của Zombie tăng 1 bước (+1)       | Trạng thái IPID thay đổi không rõ ràng                            |                           |            |
| **-sU** (UDP scan)    | Không phản hồi (hoặc trả về dữ liệu UDP)  | ICMP port unreachable (type 3, code 3) | ICMP unreachable lỗi khác (code 1, 2, 9, 10, 13) / Không phản hồi |                           |            |
| **-sN** (NULL scan)   | Không phản hồi                            | RST / ACK                              | ICMP unreachable                                                  |                           |            |
| **-sF** (FIN scan)    | Không phản hồi                            | RST / ACK                              | ICMP unreachable                                                  |                           |            |
| **-sX** (XMAS scan)   | Không phản hồi                            | RST / ACK                              | ICMP unreachable                                                  |                           |            |
| **-sM** (TCP Maimon)  | Không phản hồi (gói tin bị drop)          | RST                                    | ICMP unreachable                                                  |                           |            |

---

### 2. Các kiểu quét Nmap (Nmap Scan Types)

| Switch  | Mô tả (Description)                                                              |
| ------- | -------------------------------------------------------------------------------- |
| **-sA** | ACK flag probe scan (Kiểm tra tường lửa stateful).                               |
| **-sF** | FIN scan (Gửi cờ FIN, né IDS trên hệ thống UNIX).                                |
| **-sI** | IDLE (Zombie) scan (Quét ẩn danh qua máy trung gian).                            |
| **-sL** | List scan (Chỉ liệt kê IP/Name qua reverse DNS, không ping).                     |
| **-sN** | NULL scan (Không bật cờ TCP nào).                                                |
| **-sn** | Ping Sweep / Disable port scan (Chỉ phát hiện host, thay thế cho lệnh `-sP` cũ). |
| **-sS** | SYN (Stealth / Half-open) scan.                                                  |
| **-sT** | TCP Connect / Full Open scan.                                                    |
| **-sU** | UDP scan.                                                                        |
| **-sW** | Window-based ACK flag probe scan.                                                |
| **-sX** | XMAS scan (Bật cờ FIN, URG, PSH).                                                |
| **-sY** | SCTP INIT scan.                                                                  |
| **-sZ** | SCTP COOKIE ECHO scan.                                                           |

_(Lưu ý ngoài nguồn: `-sO` (Protocol scan) và `-sR` (RPC scan) là các lệnh chuẩn của Nmap, nhưng không được giải thích chi tiết dưới dạng switch trong tài liệu Module 03 này)._

---

### 3. Phát hiện Host / Các kiểu Ping (Host Discovery / Ping Types)

| Switch  | Mô tả (Description)                                        |
| ------- | ---------------------------------------------------------- |
| **-PE** | ICMP Echo ping (Thay thế cho `-PI` ở các bản cũ).          |
| **-PS** | TCP SYN ping (Mặc định cổng 80).                           |
| **-PA** | TCP ACK ping (Thay thế cho `-PT` ở bản cũ).                |
| **-PO** | IP Protocol ping (Gửi đa giao thức: ICMP, IGMP, IP-in-IP). |
| **-PU** | UDP ping scan (Mặc định cổng 40125).                       |
| **-PP** | ICMP Timestamp ping.                                       |
| **-PM** | ICMP Address Mask ping.                                    |
| **-PR** | ARP Ping scan (Dùng cho mạng LAN nội bộ IPv4).             |

---

### 4. Tùy chọn xuất file & Mẫu thời gian (Output Options & Timing)

**Output Options (Tùy chọn xuất file):**

- **`-oN`**: Xuất ra file văn bản chuẩn (Normal text output).
- **`-oG`**: Xuất ra định dạng Grepable (Dễ dàng lọc bằng lệnh awk/grep).
- **`-oX`**: Xuất ra định dạng XML.
- **`-oA`**: Xuất ra cả 3 định dạng trên cùng lúc.

**Timing Templates (Tốc độ quét):**
Tài liệu nhắc đến tùy chọn `-T` để chỉnh mức độ quyết liệt của thời gian quét từ cao xuống thấp nhằm vượt qua các mạng bị lọc gắt gao. Cụ thể, lệnh `-T4` được giải thích là "aggressive" (mạnh/nhanh) giúp tăng tốc độ và hiệu suất quét.
_(Lưu ý ngoài nguồn: Các mô tả chi tiết T0 (Paranoid), T1 (Sneaky), T2 (Polite), T3 (Normal), T4 (Aggressive), T5 (Insane) là chuẩn của phần mềm Nmap, nhưng không được liệt kê thành bảng định nghĩa trong giáo trình này)._

### Các kỹ thuật giảm thời gian quét Nmap (Nmap Scan Time Reduction Techniques) (Trang 355-356)

- **Bỏ qua các bài kiểm tra không quan trọng (Omit Non-critical Tests):** Tránh quét chuyên sâu (`-sC`, `-sV`, `-O`, `--traceroute`) nếu không cần thiết; Tắt phân giải DNS (`-n`) để tiết kiệm thời gian.
- **Tối ưu hóa tham số thời gian (Optimize Timing Parameters):** Sử dụng các tùy chọn `-T` (T0 đến T5) để điều chỉnh mức độ quyết liệt của thời gian.
- **Tách biệt và tối ưu hóa quét UDP (Separate and Optimize UDP Scans):** Quét TCP và UDP riêng biệt vì UDP chậm hơn nhiều và chịu ảnh hưởng nặng bởi giới hạn tỷ lệ lỗi ICMP (ICMP error rate-limiting).
- **Thực thi đồng thời nhiều phiên bản Nmap (Execute Concurrent Nmap Instances):** Chia nhỏ dải mạng lớn thành nhiều nhóm và chạy Nmap song song để tăng tốc độ tổng thể.
- **Quét từ vị trí mạng thuận lợi (Scan from a Favorable Network Location):** Quét từ bên trong mạng cục bộ (nếu có thể) để bỏ qua độ trễ do rà quét qua tường lửa ngoại vi.
- **Tăng băng thông và sức mạnh CPU (Increase Available Bandwidth and CPU Time).**
  - _(Chi tiết các Kỹ thuật giảm thời gian quét Nmap - Nmap Scan Time Reduction Techniques)_:
    - **Bỏ qua các bài kiểm tra không quan trọng (Omit Non-critical Tests):** Tránh quét chuyên sâu nếu chỉ cần thông tin tối thiểu. Giới hạn số lượng cổng quét, bỏ qua ping sweep (-sn) nếu đã biết chắc host đang online. Tránh các loại quét nâng cao (-sC, -sV, -O, --traceroute). Tắt phân giải DNS (dùng -n).
    - **Tối ưu hóa tham số thời gian (Optimize Timing Parameters):** Điều chỉnh -T từ cao xuống thấp để quét nhanh các mạng bị lọc mạnh.
    - **Tách biệt và tối ưu hóa quét UDP:** Nhiều dịch vụ dễ tổn thương dùng UDP nên cần phải quét, nhưng UDP bị ảnh hưởng nặng nề bởi giới hạn tỷ lệ lỗi ICMP, do đó phải quét riêng biệt với TCP.
    - **Nâng cấp Nmap:** Luôn dùng phiên bản nâng cấp vì chứa nhiều bản sửa lỗi và thuật toán tối ưu.
    - **Chạy các phiên bản Nmap song song (Concurrent Instances):** Chia hệ thống thành nhiều nhóm nhỏ và quét đồng thời.
    - **Quét từ vị trí mạng thuận lợi:** Quét từ bên trong mạng nội bộ (nếu có thể) để bỏ qua độ trễ do rà quét qua tường lửa ngoại vi (defense-in-depth). Quét ngoại vi chỉ bắt buộc khi cần kiểm tra tường lửa.
    - **Tăng băng thông và sức mạnh CPU:** Nmap tự có thuật toán kiểm soát tắc nghẽn để tránh flood mạng, nên băng thông/CPU càng cao quét càng nhanh.

---

### 5. Hping3 Scan & Mode Switches

Hping3 là công cụ tạo gói tin và quét mạng qua giao diện dòng lệnh.

- **`-1`** (ICMP mode): ICMP ping. Ví dụ: `hping3 -1 10.0.0.25`
- **`-2`** (UDP mode): Quét UDP. Ví dụ: `hping3 -2 10.0.0.25 -p 80`
- **`-8`** (Scan mode): Quét một dải cổng. Ví dụ: `hping3 -8 50-60 -S 10.0.0.25 -V`
- **`-9`** (Listen mode): Lắng nghe lưu lượng theo chữ ký (signature). Ví dụ: `hping3 -9 HTTP -I eth0`
- **`--flood`**: Gửi gói tin nhanh nhất có thể (không hiển thị trả lời), thường dùng để mô phỏng DoS/SYN Flood. Ví dụ: `hping3 -S 192.168.1.1 -a 192.168.1.254 -p 22 --flood`
- **`-Q`**: Thu thập sequence number TCP (TCP ISN) để phân tích. Ví dụ: `hping3 192.168.1.103 -Q -p 139`

**Hping3 TCP Flag Switches (Cờ TCP):**

- **`-F`**: Set FIN flag.
- **`-S`**: Set SYN flag.
- **`-R`**: Set RST flag. _(Ngoài nguồn: Chuẩn của hping3 nhưng không ghi chú trong text này)_
- **`-P`**: Set PSH flag.
- **`-A`**: Set ACK flag.
- **`-U`**: Set URG flag.
- **`-X`**: Set Xmas flags. _(Ngoài nguồn: Hping3 sử dụng `-F -P -U` kết hợp để quét Xmas, thay vì dùng 1 switch `-X`. Ví dụ trong nguồn: `hping3 -F -P -U 10.0.0.25 -p 80`)_

---

### 6. Phát hiện OS và Banner Grabbing (OS Discovery & Service Version)

- **Phát hiện phiên bản dịch vụ (Service version discovery):** Dùng lệnh `nmap -sV`. Kỹ thuật này truy vấn cơ sở dữ liệu `nmap-service-probes` để nhận diện các dịch vụ và phiên bản ứng dụng đang chạy.
- **Banner grabbing chủ động (Active banner grabbing):** Gửi các gói tin TCP thiết kế đặc biệt tới đích và so sánh phản hồi với cơ sở dữ liệu để tìm ra hệ điều hành.
- **Phát hiện OS bằng TTL và TCP Window Size:** Bằng cách bắt gói tin phản hồi đầu tiên (qua Wireshark), ta có thể xác định hệ điều hành dựa vào giá trị TTL:
  - **Linux:** 64 (Window size: 5840)
  - **FreeBSD:** 64 (Window size: 65535)
  - **OpenBSD:** 255 (Window size: 16384)
  - **Windows:** 128 (Window size: 65,535 bytes to 1 Gigabyte)
  - **Cisco Routers:** 255 (Window size: 4128)
  - **Solaris:** 255 (Window size: 8760)
  - **AIX:** 255 (Window size: 16384)
- **Phát hiện OS với Nmap:** Sử dụng lệnh `nmap -O`.
- **Sử dụng Nmap Scripting Engine (NSE) cho OS:** Bật bằng tùy chọn `-sC` hoặc `--script`. Ví dụ sử dụng giao thức SMB: `nmap --script smb-os-discovery.nse 10.10.1.22`.
- **OS Discovery bằng Unicornscan:** Có thể xác định hệ điều hành của máy mục tiêu bằng cách quan sát giá trị TTL trong kết quả quét. Cú pháp: `#unicornscan <target IP address>`. Ví dụ: Nếu giá trị ttl thu được sau khi quét là 128, hệ điều hành có khả năng cao là Microsoft Windows.
- **IPv6 Fingerprinting:** Quét OS trên nền mạng IPv6 dùng lệnh: `nmap -6 -O <target>`.
- **Active Banner Grabbing (Bắt cờ chủ động):** Gửi các gói TCP được thiết kế đặc biệt (malformed packets) đến host mục tiêu. Vì mỗi hệ điều hành (OS) có cách triển khai ngăn xếp TCP/IP khác nhau, phản hồi nhận được (như ISN, cờ TCP) sẽ là duy nhất, giúp xác định OS.
  - **Test 1:** Gửi gói TCP với cờ SYN và ECN-Echo được bật tới một cổng TCP mở.
  - **Test 2:** Gửi gói TCP không có cờ nào được bật (gói NULL) tới một cổng TCP mở.
  - **Test 3:** Gửi gói TCP với các cờ URG, PSH, SYN và FIN được bật tới một cổng TCP mở.
  - **Test 4:** Gửi gói TCP với cờ ACK được bật tới một cổng TCP mở.
  - **Test 5:** Gửi gói TCP với cờ SYN được bật tới một cổng TCP đóng.
  - **Test 6:** Gửi gói TCP với cờ ACK được bật tới một cổng TCP đóng.
  - **Test 7:** Gửi gói TCP với các cờ URG, PSH và FIN được bật tới một cổng TCP đóng.
  - **Test 8 PU (Port Unreachable):** Gửi một gói UDP tới một cổng UDP đóng. Mục tiêu là trích xuất thông báo "ICMP port unreachable" từ máy đích.
  - **Test 9 TSeq (TCP Sequence ability test):** Gửi sáu gói TCP với cờ SYN được bật tới một cổng TCP mở. Thử nghiệm này nhằm xác định các mẫu tạo chuỗi của số thứ tự khởi tạo TCP (TCP ISN), số định danh IP (IPID) và dấu thời gian TCP.
- **Passive Banner Grabbing (Bắt cờ thụ động):** Kẻ tấn công không gửi trực tiếp gói tin dò tìm, mà dùng công cụ đánh hơi (sniffing) để bắt các gói tin đang truyền. Bốn khu vực trong gói tin giúp xác định OS gồm: TTL (Time To Live), Window Size, DF (Don't Fragment) bit, và TOS (Type of Service).
  - **Banner grabbing từ thông báo lỗi (Error messages):** Cung cấp thông tin như loại máy chủ, loại OS và các công cụ SSL được máy chủ từ xa sử dụng.
  - **Đánh hơi lưu lượng mạng (Sniffing the network traffic):** Bắt và phân tích các gói tin từ mục tiêu giúp kẻ tấn công xác định OS được sử dụng.
  - **Banner grabbing từ phần mở rộng trang (Page extensions):** Tìm kiếm phần mở rộng trong URL để hỗ trợ xác định phiên bản ứng dụng (Ví dụ: `.aspx` cho thấy hệ thống dùng máy chủ IIS và nền tảng Windows).
  - _(Chi tiết OS Discovery / Banner Grabbing)_: Có hai phương pháp để lấy banner (banner grabbing): Thứ nhất, phát hiện banner ngay khi cố gắng kết nối tới dịch vụ (như máy chủ FTP). Thứ hai, tải xuống tệp nhị phân file/bin/ls để kiểm tra kiến trúc hệ thống. Một kỹ thuật nâng cao khác phụ thuộc vào "stack querying" (truy vấn ngăn xếp), phân tích phản hồi đối với các yêu cầu kết nối TCP. Ngoài ra, phân tích Số thứ tự ban đầu (ISN - Initial sequence number) sẽ tìm ra các điểm khác biệt trong bộ tạo số ngẫu nhiên của ngăn xếp TCP.
  - _(Chi tiết Active Banner Grabbing)_: Dựa trên nguyên lý mỗi ngăn xếp IP của OS có một cách độc nhất để phản hồi với các gói TCP được thiết kế đặc biệt (do cách vendor triển khai TCP/IP khác nhau). Các mẫu số thứ tự có thể được nhóm lại thành: 64K truyền thống (nhiều hệ thống UNIX cũ), tăng ngẫu nhiên (Solaris mới, IRIX, FreeBSD), hoặc ngẫu nhiên thực sự (Linux 2.0.\*, OpenVMS). Windows sử dụng mô hình "phụ thuộc thời gian" trong đó ISN được tăng một lượng cố định.
  - _(Chi tiết Passive Banner Grabbing)_: Kỹ thuật này không chỉ giới hạn ở 4 vùng cơ bản (TTL, Window Size, DF, TOS). TTL cung cấp dấu vết (ví dụ: máy đích Linux có TTL ban đầu là 64, nếu bắt được gói TTL 45, nghĩa là gói đã đi qua 19 hops, điều này có thể chứng minh bằng cách dùng traceroute). Kích thước Window (Window Size) của FreeBSD và Solaris có xu hướng duy trì ổn định trong suốt phiên, nhưng Cisco routers và Windows NT lại thay đổi liên tục. Bit DF hữu ích để nhận dạng số ít các hệ thống không sử dụng cờ DF (như SCO hoặc OpenBSD). TOS thường mang tính ứng dụng/phiên kết nối hơn là đặc trưng cho OS. Passive fingerprinting giúp kẻ tấn công (ví dụ: người dùng yêu cầu trang web và phân tích dấu vết sniffer) ẩn danh hoàn toàn, vượt qua các công cụ IDS và giúp xác định cả tường lửa proxy từ xa (do proxy tự thiết lập lại kết nối).
- **OS Discovery bằng IPv6 Fingerprinting:** Nmap sử dụng công cụ phát hiện OS riêng biệt cho IPv6 bằng cách gửi khoảng 18 probes (như Sequence generation, ICMPv6 echo, Node Information Query, Neighbor Solicitation...) để lấy dấu vân tay IPv6.
  - _(Các kỹ thuật khác):_
    - **IPv6 Fingerprinting:** Tương tự như IPv4, nhưng IPv6 có công cụ nhận diện OS riêng biệt. Nmap sẽ gửi gần 18 gói thăm dò (probes) theo trình tự sau để xác định OS: Sequence generation (S1–S6), ICMPv6 echo (IE1), ICMPv6 echo (IE2), Node Information Query (NI), Neighbor Solicitation (NS), UDP (U1), TCP explicit congestion notification (TECN), TCP (T2–T7).
- **Khám phá OS và Service Version bằng AI (AI-powered Discovery):** Kẻ tấn công dùng ChatGPT để tự động hóa trích xuất OS, MAC và Service Version.
  - _Ví dụ Prompt:_ `"Use Nmap to scan open ports, MAC details, services running on open ports with their versions on target IP 10.10.1.11"` -> AI xuất lệnh: `nmap -sV --reason -v -sT 10.10.1.11`.
- **Tự động hóa toàn bộ bằng Custom Script và AI:** Kẻ tấn công yêu cầu ChatGPT viết Bash Script tự động hóa toàn bộ quy trình (Host discovery -> Port scan -> Service/OS detection). Ví dụ lệnh chuỗi: `nmap -sP 10.10.1.0/24 -oG - | awk ... > live_hosts.txt && nmap -iL live_hosts.txt -sV -oA scan_results` (Trang 358-360, 368-377).

---

### 7. Quét vượt qua tường lửa (Scanning beyond firewall)

Mặc dù IDS/Tường lửa ngăn chặn các lưu lượng độc hại, kẻ tấn công có 11 kỹ thuật để lẩn tránh và quét mạng thành công:

1. **Packet Fragmentation (Phân mảnh gói tin):** Chia nhỏ IP header để bộ lọc không đọc được toàn bộ ý đồ. Nmap sử dụng lệnh: `nmap -sS -T4 -A -f -v <target>`.
2. **Source Routing:** Chỉ định đường đi lỏng lẻo hoặc nghiêm ngặt cho gói tin qua các router cụ thể để né các node chứa tường lửa.
3. **Source Port Manipulation (Thao túng cổng nguồn):** Lợi dụng việc tường lửa thường cấu hình cho phép dữ liệu từ các cổng quen thuộc (như port 80, 53, 20). Nmap dùng tùy chọn `-g` hoặc `--source-port`.
4. **IP Address Decoy (Mồi nhử IP):** Tạo ra hàng loạt IP giả mạo quét cùng lúc với IP thật để làm nhiễu log tường lửa. Lệnh Nmap: `nmap -D RND:10 <target>` hoặc chỉ định IP cụ thể.
   - Có thể sử dụng tùy chọn `ME` để định vị trí IP thật của bạn trong danh sách các IP mồi nhử. Ví dụ: `nmap -D decoy1,decoy2,ME... [target]`. Lệnh này đặt IP thật ở vị trí thứ 3. Nếu không chỉ định `ME`, Nmap sẽ tự động chèn IP thật của bạn vào một vị trí ngẫu nhiên bất kỳ.
5. **IP Address Spoofing (Giả mạo địa chỉ IP):** Thay đổi địa chỉ IP nguồn để có vẻ như gói tin đến từ một người dùng hợp pháp khác. Hping3 được dùng bằng lệnh: `hping3 www.certifiedhacker.com -a 7.7.7.7`.
6. **MAC Address Spoofing (Giả mạo địa chỉ MAC):** Thay đổi địa chỉ MAC để vượt qua các tường lửa lọc MAC nội bộ. Lệnh Nmap: `nmap -sT -Pn --spoof-mac 0 <target>`.
   - Để giả mạo địa chỉ MAC theo một nhà cung cấp cụ thể, sử dụng lệnh: `nmap -sT -Pn --spoof-mac [Vendor] [Target IP]`.
7. **Creating Custom Packets (Tạo gói tin tùy chỉnh):** Sử dụng các công cụ như Colasoft Packet Builder hoặc NetScanTools Pro để tạo các gói tin ở cấp độ mã Hex/ASCII né chữ ký IDS.
   - **Ví dụ công cụ Colasoft Packet Builder có 3 giao diện hiển thị chính để thao tác:**
     - _Packet List:_ Hiển thị danh sách tất cả các gói tin đã được tạo lập.
     - _Hex Editor:_ Trình bày dữ liệu gói tin dưới dạng giá trị thập lục phân (hexadecimal) và ký tự ASCII để cho phép chỉnh sửa.
     - _Decode Editor:_ Cho phép chỉnh sửa các trường của gói tin (như length, byte order, offsets) trực tiếp qua các hộp thoại mà không cần nhớ vị trí hệ hex.
8. **Randomizing Host Order (Ngẫu nhiên hóa thứ tự Host):** Quét hàng ngàn IP theo một trật tự xáo trộn (thay vì tuần tự) để hệ thống giám sát không phát hiện ra mẫu quét. Lệnh: `nmap --randomize-hosts <target>`.
9. **Sending Bad Checksums (Gửi Checksum lỗi):** Gửi gói tin có checksum TCP/UDP sai. Nếu nhận được phản hồi, chứng tỏ IDS/Firewall đã bỏ qua việc kiểm tra tính toàn vẹn. Lệnh Nmap: `nmap --badsum <target>`.
10. **Proxy Servers:** Định tuyến lưu lượng qua các máy chủ trung gian để ẩn giấu IP thực sự của kẻ tấn công hoặc kết hợp Proxy Chaining (chuỗi proxy).
    - **Tại sao Kẻ tấn công sử dụng Proxy Servers?**
      - Che giấu nguồn thực sự của một cuộc rà quét và né tránh các hạn chế của IDS/firewall.
      - Che giấu địa chỉ IP nguồn để có thể hack mà không bị truy vết pháp lý.
      - Che giấu nguồn gốc thực sự của cuộc tấn công bằng cách mạo danh địa chỉ nguồn giả của proxy.
      - Truy cập từ xa vào mạng nội bộ (intranets) và các tài nguyên trang web thường bị giới hạn.
      - Đánh chặn tất cả các yêu cầu do một người dùng gửi và truyền chúng đến một đích thứ ba; do đó, nạn nhân sẽ chỉ có thể xác định được địa chỉ của máy chủ proxy.
      - Kết nối chuỗi nhiều máy chủ proxy để tránh bị phát hiện.
11. **Anonymizers:** Sử dụng các dịch vụ và phần mềm ẩn danh (VPN, Whonix, Tails, Psiphon, Tor) để mã hóa toàn bộ dữ liệu vượt qua hệ thống kiểm duyệt.

- **Các kỹ thuật kiểm tra và vượt qua tường lửa chuyên sâu (Trang 399-407):**
  - **Proxy Chaining (Chuỗi proxy):** Người dùng yêu cầu kết nối đi qua nhiều máy chủ proxy liên tiếp. Mỗi máy chủ sẽ tước bỏ thông tin định danh của người dùng trước khi chuyển cho proxy tiếp theo, khiến việc truy vết (traffic analysis) cực kỳ phức tạp.
  - **Công cụ Proxy (Proxy Tools):** Proxy Switcher, CyberGhost VPN, Burp Suite, Tor, Hotspot Shield, Proxifier, IPRoyal.
  - **Lý do sử dụng Anonymizers (Why Use an Anonymizer?):**
    - Đảm bảo quyền riêng tư bằng cách ẩn danh hoạt động lướt web.
    - Truy cập các nội dung/website bị chính phủ giới hạn.
    - Bảo vệ người dùng khỏi các cuộc tấn công trực tuyến (như pharming) bằng cách định tuyến lưu lượng qua máy chủ DNS được bảo vệ.
    - Vượt qua các quy tắc kiểm duyệt của IDS và tường lửa.
  - **Phân loại Anonymizers:**
    - _Networked Anonymizers:_ Chuyển thông tin qua một mạng lưới gồm nhiều máy tính trung gian. Ưu điểm là làm cho việc phân tích lưu lượng trở nên phức tạp. Nhược điểm là có nguy cơ xâm phạm bảo mật ở từng node.
    - _Single-Point Anonymizers:_ Chuyển thông tin qua một website/server duy nhất. Ưu điểm là ẩn được địa chỉ IP trực tiếp. Nhược điểm là khả năng chống lại phân tích lưu lượng tinh vi kém hơn.
  - **Một số công cụ ẩn danh và vượt kiểm duyệt nổi bật (Censorship Circumvention Tools):**
    - **Whonix:** Hệ điều hành desktop chạy trên máy ảo (Debian base), tự động định tuyến toàn bộ kết nối qua mạng Tor để ẩn danh và cung cấp lớp bảo vệ vững chắc chống rò rỉ IP/malware.
    - **AstrillVPN:** Phần mềm VPN giúp vượt kiểm duyệt Internet, truy cập các ứng dụng bị chặn theo vị trí địa lý, mã hóa dữ liệu mà không lưu nhật ký truy cập (logging).
    - **Tails:** Hệ điều hành Live OS chạy từ thẻ USB/SD. Cung cấp các công cụ mật mã hiện đại để mã hóa tệp, email và IM, lướt web ẩn danh hoàn toàn qua Tor và không để lại dấu vết trên máy tính sau khi tắt.

### 8. Kỹ thuật phát hiện IP Spoofing (IP Spoofing Detection Techniques) (Trang 414 - 417)

- **Thăm dò TTL trực tiếp (Direct TTL Probes):** Gửi một gói tin đến host bị nghi ngờ là IP giả mạo và so sánh TTL trả về với TTL của gói tin đang kiểm tra. Nếu không khớp hoặc thuộc giao thức khác, kẻ tấn công có thể đã giả mạo IP (Kỹ thuật này thành công khi kẻ tấn công và nạn nhân khác Subnet).
- **Dựa vào số định danh IP (IP Identification Number - IPID):** Người phòng thủ gửi gói probe đến source IP nghi ngờ và quan sát số IPID trả về. Vì IPID tăng dần theo mỗi gói tin được phát đi, nếu gói tin là hợp pháp, IPID phản hồi sẽ phải rất gần (lớn hơn một chút) so với IPID của gói đang kiểm tra. Nếu giá trị không sát nhau, tức là địa chỉ IP nguồn đã bị giả mạo. Phương pháp này hoạt động hiệu quả ngay cả khi hacker và mục tiêu ở cùng một Subnet.
- **Phương pháp kiểm soát luồng TCP (TCP Flow Control Method):** Lợi dụng nguyên tắc cửa sổ trượt (sliding window) của giao thức TCP, trong đó người gửi phải ngừng truyền dữ liệu khi kích thước cửa sổ (window size) bằng 0.
  - Kẻ tấn công gửi gói TCP giả mạo sẽ không bao giờ nhận được phản hồi SYN-ACK (do phản hồi đi về máy chủ thực) và hoàn toàn không biết thông tin về window size.
  - Nếu mục tiêu thấy dữ liệu lưu lượng vẫn tiếp tục được gửi đến ngay cả khi kích thước cửa sổ đã cạn kiệt, các gói tin đó rất có thể bị giả mạo.
  - Áp dụng trong Handshake: Mục tiêu có thể cố tình phản hồi gói SYN-ACK với window size thiết lập bằng 0. Nếu người gửi hợp pháp, họ sẽ chờ; nhưng kẻ giả mạo (không nhận được SYN-ACK) vẫn sẽ gửi gói ACK kèm theo dữ liệu. Điều này lập tức tố cáo đó là IP giả mạo.
- **Banner Grabbing Countermeasures (Phòng chống bắt cờ):**d):\*\* Lợi dụng kích thước cửa sổ trượt (sliding window). Kẻ tấn công gửi gói tin SYN giả mạo sẽ không nhận được SYN-ACK (vì gói này chạy về máy nạn nhân thật). Khi cửa sổ luồng (window size) đã hết, nếu dữ liệu vẫn tiếp tục được gửi tới, chứng tỏ gói tin đó là giả mạo.

### 9. Biện pháp phòng chống quét mạng (Network Scanning Countermeasures) (Trang 408 - 421)

- **Ping Sweep Countermeasures (Phòng chống Ping Sweep):**
  - Cấu hình Firewall/IDS/IPS (như Snort) để chặn các yêu cầu ICMP echo từ các nguồn lạ.
  - Sử dụng DMZ và chỉ cho phép các lệnh như ICMP ECHO_REPLY, HOST UNREACHABLE, và TIME EXCEEDED trong DMZ.
  - Giới hạn băng thông (Rate limiting) cho các gói ICMP; Giới hạn lưu lượng ICMP bằng ACL.
- **Port Scanning Countermeasures (Phòng chống quét cổng):**
  - Cấu hình IDS/Firewall phân tích sâu dữ liệu (Deep Packet Inspection) thay vì chỉ nhìn Header.
  - Đóng các cổng không sử dụng. Sử dụng rule set để chặn các port nguy hiểm (135–159, 445, 1080, v.v.).
  - Lọc bỏ inbound ICMP message types và outbound ICMP type-3.
  - Áp dụng "Port Knocking" để ẩn các cổng đang mở. Sử dụng IP ẩn qua NAT và VLAN.
- **Banner Grabbing Countermeasures (Phòng chống bắt cờ):**
  - Hiển thị Banner giả mạo (False banners) để lừa kẻ tấn công.
  - Sử dụng Server masking tools.
  - Tắt các header trả về không cần thiết. Trên Apache, đổi cấu hình trong `httpd.conf` (ví dụ: dùng module `mod_headers`, sửa `ServerTokens Prod`, `ServerSignature Off`).
  - Đánh lừa attacker bằng cách sửa giá trị `AlternateServerName`.
  - Ẩn/Sửa đuôi mở rộng file (`.asp` thành `.htm`) bằng các chỉ thị như `mod_negotiation` (Apache).
  - Sửa đổi giá trị **RemoveServerHeader** từ 0 thành 1 trong tệp cấu hình `UrlScan.ini` để ngăn việc tiết lộ phiên bản máy chủ.
  - Vô hiệu hóa các phương thức HTTP không sử dụng như Connect, Put, Delete, và Options trên các web application servers.
  - Xóa header `X-Powered-By` bằng cách sử dụng tùy chọn `customHeaders` trong phần `<system.webServer>` của tệp `web.config`.
  - Sử dụng Transport Layer Security (TLS) cho các dịch vụ để mã hóa thông tin banner trong quá trình bắt tay, gây khó khăn cho việc lấy cờ.
- **IP Spoofing Countermeasures (Phòng chống IP Spoofing):**
  - **Tránh các mối quan hệ tin cậy (Avoid Trust Relationships):** Không dựa vào xác thực bằng IP. Kẻ tấn công có thể giả mạo thành các host đáng tin cậy để gửi gói tin độc hại. Nên triển khai kiểm tra toàn bộ gói tin và thiết lập xác thực bằng mật khẩu đi kèm với xác thực dựa trên mối quan hệ tin cậy.
  - **Sử dụng Tường lửa và Cơ chế lọc (Use Firewalls and Filtering Mechanisms):** Lọc tất cả các gói tin đến và đi. Sử dụng Danh sách kiểm soát truy cập (ACLs) trên tường lửa để ngăn chặn các truy cập trái phép và rò rỉ thông tin nhạy cảm.
  - Di chuyển từ IPv4 sang IPv6 và triển khai biến đổi địa chỉ IPv6 động (dynamic IPv6 address variation) bằng trình tạo địa chỉ ngẫu nhiên.
  - Triển khai các cơ chế xác thực chứng chỉ số như xác thực chứng chỉ hai chiều (two-way auth certificate verification).
  - Sử dụng các thiết bị giảm nhẹ rủi ro chuyên dụng cho ứng dụng, chẳng hạn như **Behemoth scrubbers** để kiểm tra gói tin sâu ở tốc độ cao (khoảng 100 triệu packets/s).
  - Cấu hình router để xác minh các gói dữ liệu bằng chữ ký (lưu trữ data packet digests).
  - Cấu hình switch nội bộ lập bảng địa chỉ DHCP tĩnh để lọc lưu lượng giả mạo độc hại.
  - Tuyệt đối không sử dụng các cơ chế "Xác thực dựa trên IP" (IP-based authentication).
  - Sử dụng Số thứ tự khởi tạo ngẫu nhiên (Random Initial Sequence Numbers - ISNs) để tránh hacker đoán được kết nối.
  - _(Các biện pháp phòng chống Spoofing IP bổ sung)_:
    - Không tin cậy hệ thống xác thực dựa trên IP. Nếu gói tin được mặc định là "sạch" chỉ vì nó đến từ mạng được tin tưởng, mã độc sẽ dễ dàng lây nhiễm vào hệ thống. Giải pháp: Áp dụng xác thực mật khẩu kết hợp với xác thực mức độ tin cậy.
    - Nguy cơ từ chiều ra (Outgoing packets): Kẻ tấn công nội bộ (insider) có thể tuồn dữ liệu mật cho đối thủ. Hơn nữa, kẻ tấn công từ xa có thể cài cắm thành công các chương trình sniffing ẩn (hidden mode) trong mạng, tự động thu thập và gửi báo cáo ra ngoài mà tường lửa không báo động. Vậy nên việc lọc traffic đi ra (Egress) quan trọng không kém traffic đi vào (Ingress).
    - Sử dụng Số thứ tự khởi tạo ngẫu nhiên (Random ISNs): Do hầu hết các thiết bị cũ khởi tạo ISN dựa trên bộ đếm thời gian (timed counters), ISN có thể dễ dàng bị đoán trước. Hacker dựa vào ISN của phiên hiện tại để dự đoán ISN tiếp theo, từ đó thiết lập kết nối mã độc để đánh hơi traffic. Phải đảm bảo mọi ISN đều được sinh ngẫu nhiên hoàn toàn.
    - Sử dụng mã hóa mạnh (IPSec): IPSec là phương thức chống IP spoofing hiệu quả nhất vì nó cung cấp xác thực dữ liệu, tính toàn vẹn và tính bảo mật. Kẻ tấn công thường nhắm vào mục tiêu dễ xơi, nếu phải giải mã toàn bộ traffic được mã hóa bằng thuật toán mạnh, chúng sẽ bỏ cuộc và đi tìm mục tiêu khác.
  - Thực hiện Ingress Filtering (Lọc đầu vào - chặn gói tin đi vào mạng có Source IP không hợp lệ) và Egress Filtering (Lọc đầu ra - chặn gói tin đi ra khỏi mạng mang Source IP không nằm trong mạng nội bộ).
  - Sử dụng mã hóa mạnh (IPSec, TLS, SSH).
- **Công cụ phát hiện và phòng chống Scanning:** ExtraHop, Splunk Enterprise Security, Scanlogd, Vectra Detect, IBM Security QRadar XDR, Cynet 360 AutoXDR™.

_(Ghi chú cuối: Các thông tin về phần mềm giả mạo mạng Scapy, Komodia, Ettercap, Cain, công cụ G-zapper xóa cookie, và khái niệm MIB info hoàn toàn không xuất hiện trong tài liệu Module 03 (Scanning Networks) được cung cấp. Chúng có thể nằm ở các Module chuyên về Sniffing (Module 08) hoặc Enumeration (Module 04) của giáo trình CEH)._
