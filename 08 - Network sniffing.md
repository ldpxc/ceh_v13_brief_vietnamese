## 1. Ghi nhận gói tin (Packet Sniffing) [Trang 1269]

Ghi nhận gói tin là quá trình giám sát và bắt giữ toàn bộ các gói dữ liệu đi qua một mạng cụ thể bằng ứng dụng phần mềm hoặc thiết bị phần cứng.

- Kẻ tấn công có thể cấu hình card mạng (NIC) trên máy của chúng sang chế độ **promiscuous (promiscuous mode)**. Chế độ này vô hiệu hóa bộ lọc mặc định của NIC, buộc nó phải lắng nghe và chấp nhận mọi dữ liệu truyền trên phân đoạn mạng của nó thay vì chỉ nhận các gói tin dành riêng cho mình.
- Quá trình này cho phép quan sát và truy cập toàn bộ lưu lượng mạng từ một điểm duy nhất, giúp kẻ tấn công thu thập các thông tin nhạy cảm ở dạng bản rõ (cleartext) như mật khẩu (Telnet, FTP), email, cấu hình router, truy vấn DNS, syslog, và các phiên trò chuyện.

**Quá trình kẻ tấn công sử dụng Sniffer để hack mạng (How an Attacker Hacks the Network Using Sniffers) [Trang 1275 - 1278]**
Các bước kẻ tấn công thường thực hiện:

1. **Bước 1:** Kẻ tấn công kết nối máy tính hoặc laptop của mình vào một trong các cổng trên switch để truy cập mạng.
2. **Bước 2:** Sử dụng các công cụ khám phá mạng (network discovery tools) để tìm hiểu topology (sơ đồ) mạng và các thông tin liên quan.
3. **Bước 3:** Phân tích topology mạng để xác định máy tính của nạn nhân (mục tiêu).
4. **Bước 4:** Sử dụng kỹ thuật ARP spoofing để gửi các thông điệp ARP giả mạo.
5. **Bước 5:** Chuyển hướng (divert) toàn bộ lưu lượng từ máy nạn nhân sang máy của kẻ tấn công (Thiết lập tấn tấn công Man-in-the-Middle - MITM).
6. **Bước 6:** Đọc toàn bộ các gói dữ liệu được gửi và nhận bởi nạn nhân, từ đó trích xuất thông tin nhạy cảm như mật khẩu, tên người dùng, chi tiết thẻ tín dụng và mã PIN.

**Sniffing ở Tầng Liên kết dữ liệu (Data Link Layer) của Mô hình OSI**

- Mô hình OSI được thiết kế sao cho các tầng hoạt động độc lập với nhau.
- Tầng liên kết dữ liệu (Data Link Layer - Layer 2) là nơi các gói dữ liệu được mã hóa và giải mã thành các bit.
- Các trình nghe lén (Sniffers) hoạt động ở chính tầng Data Link này và có thể bắt các gói tin ngay tại đây. Do các tầng OSI độc lập, nếu một sniffer nghe lén dữ liệu ở tầng Data Link, các tầng OSI cao hơn (Network, Transport, Application...) sẽ hoàn toàn không nhận thức được việc dữ liệu đang bị nghe lén.

## 2. Các loại môi trường Ethernet [Trang 1270 - 1271]

- **Ethernet chia sẻ (Shared Ethernet)**: Mọi host được kết nối trên một bus đơn (sử dụng hub) và phải cạnh tranh băng thông. Hub truyền dữ liệu đến tất cả các cổng; do đó, việc chỉ cần đặt NIC ở chế độ promiscuous sẽ giúp bắt được mọi gói tin rất dễ dàng. Phương pháp sniffing trong môi trường này mang tính thụ động và rất khó bị phát hiện.
- **Ethernet chuyển mạch (Switched Ethernet)**: Các host kết nối thông qua switch thay vì hub. Switch duy trì một bảng CAM (Content Addressable Memory) để ánh xạ địa chỉ MAC với cổng vật lý tương ứng. Nó chỉ gửi gói tin đến đúng máy đích. Do đó, việc đặt NIC ở chế độ promiscuous không còn hiệu quả trực tiếp, nhưng kẻ tấn công vẫn có thể dùng các phương pháp chủ động để đánh lừa switch.

**Bảng CAM và Cách thức hoạt động (CAM Table & How it works) [Trang 1286 - 1289]:**

- **Bảng CAM (Content Addressable Memory):** Là bảng động có kích thước cố định bên trong switch. Nó lưu trữ địa chỉ MAC của các thiết bị gắn liền với các cổng vật lý tương ứng cùng với tham số VLAN. Switch sử dụng bảng này để tra cứu địa chỉ MAC đích và chuyển tiếp dữ liệu đến đúng máy cần nhận, giúp switch an toàn hơn hub.
- **Cách thức hoạt động:**
  - Khi Máy A muốn giao tiếp với Máy B, nó gửi một yêu cầu ARP broadcast chứa IP của B, MAC và IP của A.
  - Switch nhận yêu cầu, cập nhật MAC của A và cổng tương ứng vào bảng CAM (nếu chưa có), sau đó phát sóng (broadcast) yêu cầu này ra toàn mạng.
  - Máy B nhận diện IP của mình, gửi lại ARP reply kèm MAC của B. Switch ghi nhận MAC của B cùng cổng của nó vào bảng CAM.
  - Lúc này, kết nối điểm-điểm được thiết lập. Lưu lượng từ A đến B chỉ đi qua đúng cổng của B, Máy C không thể nhìn thấy lưu lượng này.
- **Điều gì xảy ra khi Bảng CAM bị đầy?** Bảng CAM có kích thước giới hạn. Kẻ tấn công sử dụng MAC Flooding để bơm hàng loạt địa chỉ MAC giả vào switch. Khi bảng CAM đầy, switch sẽ chuyển sang chế độ học tập (learning mode) / fail-open mode, khiến nó hoạt động giống như một hub: phát sóng mọi lưu lượng đến tất cả các cổng. Nhờ đó, kẻ tấn công có thể bắt được gói tin của nạn nhân.

## 3. Các kiểu sniffing (Types of Sniffing) [Trang 1273 - 1274]

- **Passive sniffing (Sniffing thụ động)**: Kẻ tấn công không gửi thêm bất kỳ gói tin nào, chỉ việc lắng nghe và giám sát các gói tin. Thường được áp dụng cho môi trường hub (common collision domains). Phương pháp này mang lại lợi thế tàng hình (stealth) cực cao vì không để lại dấu vết mạng.
  - Kẻ tấn công sử dụng các phương pháp sniffing thụ động sau để giành quyền kiểm soát mạng mục tiêu:
    - **Compromising physical security (Xâm phạm an ninh vật lý):** Kẻ tấn công bước vào tổ chức với một chiếc laptop, cắm trực tiếp vào mạng và chụp lại các thông tin nhạy cảm.
    - **Using a Trojan horse (Sử dụng Trojan):** Kẻ tấn công cài đặt Trojan (có tích hợp sẵn tính năng sniffing) lên máy nạn nhân để thỏa hiệp, sau đó cài đặt packet sniffer và tiến hành nghe lén.
- **Active sniffing (Sniffing chủ động)**: Áp dụng cho mạng chuyển mạch (switch-based network). Kẻ tấn công phải tìm kiếm hoặc thu hút lưu lượng bằng cách chủ động tiêm (inject) dữ liệu vào mạng. Các kỹ thuật bao gồm: MAC flooding, DNS poisoning, ARP poisoning, DHCP attacks, Switch port stealing, và Spoofing attacks.

## 4. Các giao thức dễ bị sniffing [Trang 1276 - 1277]

Lý do chính kẻ tấn công nhắm vào các giao thức này là để đánh cắp mật khẩu. Các giao thức truyền tải dữ liệu dưới dạng văn bản thuần túy (cleartext) hoặc có mã hóa yếu bao gồm:

- **Telnet và Rlogin**: Gửi thao tác bàn phím (keystrokes) và mật khẩu ở dạng không mã hóa.
- **HTTP**: Phiên bản mặc định truyền dữ liệu người dùng qua mạng dưới dạng plaintext.
- **SNMP (v1 và v2)**: Giao thức quản lý thiết bị mạng, không cung cấp bảo mật mạnh, truyền dữ liệu cleartext.
- **SMTP, POP, IMAP**: Các giao thức liên quan đến email, truyền tin nhắn và thông tin đăng nhập mà không được mã hóa bảo vệ.
- **NNTP, FTP, TFTP**: Thiếu vắng các cơ chế mã hóa hoặc xác thực an toàn, dễ dàng bị công cụ như hashcat đánh cắp.

## 5. Phương pháp sniffing cho mạng chuyển mạch (Switched Network)

**MAC Flooding** [Trang 1271, 1289 - 1291]:

- Tại lớp 2 (Layer 2), kẻ tấn công lợi dụng việc bộ nhớ của switch có giới hạn để gửi hàng loạt địa chỉ MAC nguồn giả mạo. Khi bảng CAM (CAM table) bị đầy, switch không thể theo dõi tiếp và sẽ chuyển sang chế độ mở lỗi (fail-open mode). Lúc này, switch hành xử như một hub, quảng bá (broadcast) mọi gói tin ra tất cả các cổng, cho phép kẻ tấn công bắt được lưu lượng.
- Công cụ: Kẻ tấn công dùng tiện ích `macof` (thuộc bộ `dsniff`) có khả năng gửi tới 131,000 mục MAC giả mỗi phút.

**MAC Spoofing / MAC Duplicating** [Trang 1327 - 1331]:

- Kẻ tấn công nghe lén mạng, lấy địa chỉ MAC của một máy khách hợp lệ đang kết nối và mạo danh (spoof) chính địa chỉ MAC đó trên máy của mình. Nếu thành công, kẻ tấn công sẽ nhận được mọi lưu lượng dành cho nạn nhân và có thể vượt qua tính năng lọc MAC (MAC filtering) trên các Access Point không dây.
- Trên Windows: Người dùng có thể đổi địa chỉ MAC trong cài đặt (Network and Internet -> Ethernet Properties -> Advanced tab -> Network Address) hoặc bằng cách chỉnh sửa Windows Registry tại đường dẫn: `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}`. Tại đây, tạo một giá trị chuỗi (String value) mới tên là `NetworkAddress` và nhập địa chỉ MAC mới. [Trang 1329]
- Công cụ: MAC Address Changer, SMAC, TMAC, Change MAC Address, Mac Changer, AMC.
- Phòng ngừa: Sử dụng DHCP snooping binding table, Dynamic ARP Inspection, IP Source Guard, cấu hình Port Security trên switch, hoặc các chuẩn mã hóa như WPA3 và IEEE 802.1X.
  - **Retrieval of MAC Address (Truy xuất địa chỉ MAC):** Luôn truy xuất địa chỉ MAC trực tiếp từ card mạng (NIC) thay vì truy xuất từ Hệ điều hành (OS).
  - **AAA (Authentication, Authorization, and Accounting):** Sử dụng cơ chế máy chủ AAA để lọc các địa chỉ MAC.
  - **Network Access Control (NAC):** Sử dụng hệ thống NAC để thực thi các chính sách bảo mật trên thiết bị truy cập mạng. Nó có thể kiểm tra các dấu hiệu MAC spoofing để ngăn chặn truy cập trái phép.
  - **Rate Limiting and Traffic Analysis (Giới hạn tốc độ và phân tích lưu lượng):** Áp dụng trên thiết bị mạng để giúp giảm nhẹ hậu quả của MAC flooding.
  - **Regular Network Audits (Kiểm toán mạng thường xuyên):** Thường xuyên kiểm toán mạng để tìm các thiết bị lạ, các luồng lưu lượng bất thường nhằm giảm thiểu rủi ro bị khai thác.

**Các lệnh Cấu hình Port Security trên Switch Cisco (Để chống MAC Spoofing/Flooding) [Trang 1296 - 1298]:**

- `interface <interface_id>`: Vào chế độ cấu hình giao diện.
- `switchport mode access`: Đặt cổng ở chế độ access (không thể cấu hình port security ở chế độ trunk/dynamic).
- `switchport port-security`: Kích hoạt port security.
- `switchport port-security maximum <1-3072>`: Giới hạn số lượng MAC an toàn tối đa cho phép trên cổng (Mặc định là 1).
- `switchport port-security violation {restrict | shutdown}`: Định nghĩa hành động khi có vi phạm. `restrict` sẽ chặn dữ liệu từ MAC lạ và gửi cảnh báo SNMP, `shutdown` sẽ tắt hẳn cổng.
- `switchport port-security mac-address sticky`: Kích hoạt tính năng "sticky", cho phép switch tự động học các địa chỉ MAC đang kết nối và ghi thẳng vào cấu hình đang chạy (running config).
- `switchport port-security limit rate invalid-source-mac`: Thiết lập giới hạn tỷ lệ (rate limit) cho các gói tin xấu.
- `switchport port-security mac-address <mac_address>`: Nhập thủ công một địa chỉ MAC an toàn cho giao diện.
- `show port-security address` (hoặc `show port-security address interface <interface_id>`): Lệnh kiểm tra và xác minh cấu hình port security.
- `switchport port-security aging time <phút>`: Đặt thời gian lão hóa (aging time) cho cổng an toàn (Ví dụ: aging time 2).
- `switchport port-security aging type inactivity`: Thiết lập loại lão hóa địa chỉ MAC an toàn là không hoạt động (inactivity).
- `snmp-server enable traps port-security trap-rate <số>`: Kiểm soát tốc độ tạo cảnh báo SNMP trap (Ví dụ: trap-rate 5).

**ARP Spoofing / ARP Poisoning** [Trang 1271, 1314 - 1326]:

- **Quá trình lấy địa chỉ MAC sử dụng ARP (The process of obtaining the MAC address using ARP):**
  - Máy nguồn tạo một gói tin yêu cầu ARP chứa địa chỉ MAC nguồn, IP nguồn và IP đích, sau đó gửi nó đến switch.
  - Khi nhận được gói tin, switch đọc địa chỉ MAC nguồn và tìm kiếm địa chỉ này trong bảng CAM của nó.
  - Switch cập nhật các mục nhập mới. Nếu không tìm thấy mục nhập nào, switch sẽ thêm địa chỉ MAC và cổng nhận tương ứng vào bảng CAM, sau đó phát sóng (broadcast) gói tin yêu cầu ARP vào mạng.
  - Mỗi thiết bị trong mạng nhận được gói tin yêu cầu ARP phát sóng và so sánh IP đích trong gói tin với IP của chính nó.
  - Chỉ hệ thống có IP khớp với IP đích mới trả lời bằng một gói tin ARP reply.
  - Thông điệp ARP reply sau đó được đọc bởi switch. Switch thêm mục nhập vào bảng MAC của nó và chuyển tiếp thông điệp đến máy đích (tức là máy đã gửi yêu cầu ARP ban đầu).
  - Hơn nữa, máy này cập nhật IP và MAC của máy đích vào bảng ARP của nó, và bây giờ quá trình giao tiếp có thể diễn ra.
- Bởi vì giao thức ARP không giữ trạng thái (stateless) và không xác thực, một máy tính hoàn toàn có thể gửi gói ARP reply ngay cả khi không hề có ai hỏi.
- Kẻ tấn công gửi các gói ARP giả (forged) để liên kết địa chỉ MAC của chúng với địa chỉ IP của một host khác (thường là Default Gateway). Máy nạn nhân sẽ lưu mục sai lệch này vào bộ nhớ đệm (ARP cache), khiến toàn bộ lưu lượng bị chuyển hướng sang máy kẻ tấn công. Kỹ thuật này mở đường cho tấn công MITM (Man-in-the-Middle), DoS, VoIP Call Tapping và Session Hijacking.

**Các mối đe dọa từ ARP Poisoning [Trang 1315 - 1316]:**

- **Packet Sniffing:** Nghe lén toàn bộ lưu lượng mạng.
- **Session Hijacking:** Đánh cắp thông tin phiên hợp lệ để giành quyền truy cập trái phép.
- **VoIP Call Tapping:** Sử dụng port mirroring để bắt và ghi âm các cuộc gọi VoIP dựa theo địa chỉ MAC.
- **Manipulating Data (Thao túng dữ liệu):** Sửa đổi dữ liệu trên đường truyền hoặc chặn lưu lượng.
- **Man-in-the-Middle Attack (MITM):** Kẻ tấn công đứng giữa nạn nhân và server để chặn bắt dữ liệu.
- **Data Interception:** Đánh chặn IP, MAC và VLAN trong mạng.
- **Connection Hijacking:** Chiếm quyền kiểm soát hoàn toàn kết nối của client.
- **Connection Resetting:** Buộc mục tiêu phải xóa ARP entry bằng cách thay đổi thông tin định tuyến sai, tạo DoS.
- **Stealing Passwords:** Đánh cắp tên người dùng và mật khẩu.
- **DoS Attack:** Gắn nhiều địa chỉ IP vào một địa chỉ MAC duy nhất, làm quá tải lưu lượng mục tiêu.
- Công cụ: `arpspoof`, Habu, `bettercap`, `Ettercap`, RITM, ARP Spoofer, `larp`.
  - **Cú pháp lệnh arpspoof:** `arpspoof -i [Interface] -t [Target Host]`
  - **Tính năng của Habu:** Là một toolkit hacking cung cấp nhiều lệnh để thực hiện các cuộc tấn công như: ARP poisoning và sniffing, DHCP discovery và starvation, Nhận diện Subdomain, Sao chép chứng chỉ (Certificate cloning), Phân tích TCP (ISN, flags), Kiểm tra Username trên mạng xã hội, và Nhận diện công nghệ Web. [Trang 1317 - 1318]
- Phòng ngừa: Triển khai Dynamic ARP Inspection (DAI), tính năng này kiểm tra tính hợp lệ của cặp IP-MAC dựa vào cơ sở dữ liệu DHCP snooping binding table. Nếu nhận thấy ARP reply không khớp, switch sẽ loại bỏ (discard) gói tin đó.
  - **Lập bản đồ tĩnh (Static Mapping):** Nếu các hệ thống máy chủ trong mạng sử dụng địa chỉ IP tĩnh, DHCP snooping sẽ không khả thi. Trong tình huống này, quản trị viên phải thực hiện ánh xạ tĩnh (static mapping) liên kết địa chỉ IP với địa chỉ MAC trên VLAN để ngăn chặn tấn công.
  - **Sử dụng các kịch bản tùy chỉnh (Custom Scripts):** Quản trị viên có thể triển khai phần mềm chạy các kịch bản tùy chỉnh để giám sát bảng ARP. Kịch bản này so sánh bảng ARP hiện tại với danh sách các cặp MAC/IP đã biết. Nếu có sự không khớp (mismatch), switch sẽ loại bỏ gói tin.

**Cấu hình Dynamic ARP Inspection (DAI) trên Switch Cisco [Trang 1320 - 1324]:**

- DAI phụ thuộc vào bảng DHCP snooping binding table để đối chiếu IP-MAC. Do đó, phải bật DHCP Snooping trước.
- Lệnh cấu hình:
  - `ip arp inspection vlan 10` (Bật kiểm tra ARP trên VLAN 10).
  - `show ip arp inspection` (Kiểm tra trạng thái DAI, xem thống kê các gói tin Forwarded / Dropped để phát hiện nếu đang bị tấn công).
  - **Để đạt được mức độ bảo mật cao hơn nữa, bạn có thể bật một hoặc nhiều kiểm tra xác thực bổ sung. Để làm điều này, hãy thực thi lệnh** `ip arp inspection validate` **theo sau là loại địa chỉ (address type).**
- Phát hiện: Capsa Portable Network Analyzer, Wireshark, OpUtils, netspionage, NetProbe, ARP-GUARD.

**ICMP Router Discovery Protocol (IRDP) Spoofing** [Trang 1332 - 1333]:

- Giao thức IRDP cho phép host phát hiện IP của các router đang hoạt động trên subnet. Vì không yêu cầu xác thực, kẻ tấn công có thể gửi đi các thông báo quảng bá router giả mạo (spoofed router advertisement). Chúng thiết lập mức độ ưu tiên (preference level) và thời gian sống (lifetime) cao để buộc nạn nhân chọn router giả mạo đó làm đường dẫn mặc định (default route). Kỹ thuật này cho phép MitM, DoS và passive sniffing.
- Phòng ngừa: Vô hiệu hóa IRDP trên các máy chủ.

## 6. VLAN Hopping [Trang 1334 - 1335]

Kỹ thuật này cho phép kẻ tấn công vượt qua các giới hạn phân đoạn mạng (network segmentation controls) để truy cập trái phép vào các tài nguyên nằm ở các VLAN khác. Có 2 phương pháp chính:

- **Switch Spoofing** [Trang 1334]:
  - Kẻ tấn công kết nối một switch giả (rogue switch) vào mạng và đánh lừa switch hợp lệ để thiết lập một đường trục (trunk link). Cuộc tấn công chỉ thành công khi giao diện của switch hợp lệ đang được cấu hình ở chế độ `dynamic auto`, `dynamic desirable`, hoặc `trunk`.
  - **Lệnh phòng ngừa Switch Spoofing (Cisco) [Trang 1341]:**
    - `switchport mode access` (Cấu hình cứng thành cổng truy cập).
    - `switchport mode nonegotiate` (Vô hiệu hóa hoàn toàn DTP để cấm tự đàm phán trunk).
- **Double Tagging** [Trang 1335]:
  - Kẻ tấn công chèn và sửa 2 thẻ 802.1Q (outer/inner tag) vào trong frame Ethernet. Thẻ ngoài (outer tag) là native VLAN của kẻ tấn công, thẻ trong (inner tag) là VLAN đích. Khi switch đầu tiên nhận được, nó sẽ gỡ bỏ thẻ ngoài (do trùng với native VLAN) và chuyển tiếp frame mang thẻ trong tới các cổng trunk, cho phép kẻ tấn công tiếp cận VLAN không mong muốn. Khai thác này chỉ có tác dụng nếu cổng switch được cấu hình dùng native VLANs.
  - **Lệnh phòng ngừa Double Tagging (Cisco) [Trang 1341]:**
    - `switchport access vlan <unused_id>` (Đảm bảo VLAN mặc định là VLAN không sử dụng).
    - `switchport trunk native vlan 999` (Đổi native VLAN trên các cổng trunk sang một ID không dùng).
    - `vlan dot1q tag native` (Bắt buộc phải đánh tag cho mọi native VLAN).
    - **Các biện pháp phòng ngừa Double Tagging bổ sung:**
      - Use Private VLANs: Cấu hình Private VLANs để cô lập các cổng với nhau trên cùng một VLAN.
      - Regularly Audit and Monitor VLAN Configurations: Thực hiện kiểm toán thường xuyên hệ thống VLAN và cấu hình switch để đảm bảo tuân thủ chính sách bảo mật.

## 7. STP Attack (Tấn công Spanning Tree Protocol) [Trang 1336 - 1337]

- Giao thức STP dùng để loại bỏ vòng lặp mạng (loops) bằng cách bầu chọn ra một "root bridge" dựa trên thông điệp BPDU. Mặc định, giá trị ưu tiên của cầu nối (Bridge Priority) là 32769.
- Kẻ tấn công cắm một rogue switch vào mạng và cấu hình mức priority thấp hơn bất kỳ switch nào khác (ví dụ Priority = 0). Điều này khiến rogue switch lập tức chiếm vị trí root bridge, ép mọi lưu lượng mạng phải định tuyến đi qua máy của kẻ tấn công để bề dễ bề nghe lén.
- **Phòng ngừa** [Trang 1343 - 1344]:
  - **BPDU Guard**: Nếu cổng truy cập nhận được BPDU, nó sẽ lập tức bị khóa (đưa vào trạng thái errdisable).
  - **Root Guard**: Bảo vệ vị trí root bridge, nếu nhận được BPDU có mức ưu việt hơn, nó sẽ đưa cổng đó vào trạng thái loop inconsistent để chặn quyền cướp root.
  - **Loop Guard / UDLD (Unidirectional Link Detection)**: Phát hiện liên kết lỗi và chống lại các vòng lặp định tuyến do sự cố chuyển đổi STP.

**Các lệnh cấu hình phòng ngừa STP Attack (Cisco) [Trang 1343 - 1344]:**

- Bật BPDU Guard: `spanning-tree portfast bpduguard` (Cấu hình ở interface level).
- Bật Root Guard: `spanning-tree guard root` (Cấu hình ở interface level).
- Bật Loop Guard: `spanning-tree guard loop`.
- Bật UDLD: `udld { enable | disable | aggressive }`.
  - **Các biện pháp phòng ngừa STP Attack bổ sung:**
    - Deploy PortFast: Áp dụng PortFast cho tất cả các cổng truy cập (access ports) để giảm thời gian chờ đợi (listening) và học (learning) trạng thái STP. Tuy nhiên, phải đảm bảo BPDU Guard được bật kèm theo.
    - Regularly update and patch network devices: Thường xuyên cập nhật phần mềm/firmware cho thiết bị mạng.
    - Restrict network access: Giới hạn quyền truy cập vật lý vào các cổng mạng và thiết bị để ngăn chặn thay đổi cấu hình trái phép.
    - Network segmentation: Phân đoạn mạng để giới hạn phạm vi tấn công STP bằng cách chia các miền quảng bá (broadcast domains) lớn thành các đoạn nhỏ, dễ quản lý hơn.

## 8. Thiết bị phân tích giao thức phần cứng (Hardware Protocol Analyzers / Sniffers) [Trang 1279 - 1280]

Thiết bị phân tích giao thức phần cứng là công cụ chụp và diễn dịch các tín hiệu đi qua mạng mà không làm thay đổi phân đoạn lưu lượng. Chúng có khả năng chụp dữ liệu lớn không bị rớt gói tin và theo dõi chính xác các sự kiện ở mức vật lý.

- **Xgig 1000 32/128 G FC & 25/50/100 GE Analyzer**: Là nền tảng phần cứng cung cấp các tính năng chụp và phân tích nội tuyến, không xâm nhập (inline, non-intrusive capture) và chèn lỗi nội tuyến (inline jamming). Hỗ trợ các tính năng vượt trội ở tầng vật lý OSI như tự động đàm phán (auto negotiation), đào tạo liên kết (link training) và sửa lỗi chuyển tiếp (forward error correction - FEC).
- **SierraNet M1288**: Nền tảng kiểm tra Ethernet và Fiber Channel (fiber channel fabrics analyzer), cung cấp khả năng tạo, chụp và phân tích lưu lượng với bộ đệm ghi lên đến 128G/256G, cấp phát bộ nhớ động.
- _(Bổ sung thêm các công cụ từ nguồn)_: PTW60, P5551A PCIe 5.0 Protocol Exerciser, Voyager M4x, N2X N5540A Agilent Protocol Analyzer.

## 9. SPAN port [Trang 1281]

SPAN (Switched Port Analyzer), còn gọi là port mirroring (phản chiếu cổng), là một tính năng của switch Cisco giám sát lưu lượng trên một hoặc nhiều cổng. Nếu kẻ tấn công kết nối vào cổng SPAN, chúng có thể thu được toàn bộ bản sao gói tin (mirrored) truyền qua switch và đe dọa/thỏa hiệp toàn bộ mạng.

## 10. Nghe lén đường dây (Wiretapping / Telephone Tapping) [Trang 1282 - 1283]

Wiretapping là hành vi bên thứ ba giám sát các cuộc gọi điện thoại hoặc Internet bằng thiết bị phần cứng/phần mềm với mục đích mờ ám.

**Các phương pháp:**

- Ghi âm đường dây chính thức (The official tapping) hoặc không chính thức (The unofficial tapping).
- Ghi âm cuộc gọi (Recording the conversation).
- Direct line wiretap (Nghe lén đường dây trực tiếp).
- Radio wiretap (Nghe lén qua sóng radio).

**Phân loại:**

- **Tapping kiểu chủ động (Active wiretapping)**: Là hình thức tấn công MITM. Kẻ tấn công không chỉ giám sát, ghi lại mà còn sửa đổi hoặc tiêm (inject) dữ liệu vào luồng giao tiếp.
- **Tapping kiểu thụ động (Passive wiretapping)**: Là hành vi snooping hoặc eavesdropping. Kẻ tấn công chỉ quan sát luồng dữ liệu để đánh cắp mật khẩu hoặc thông tin khác.

_(Bổ sung từ nguồn)_ **Đánh chặn hợp pháp (Lawful Interception - LI)** [Trang 1282-1283]: Thực thi bởi cơ quan pháp luật (LEAs) thông qua nhà cung cấp dịch vụ (Telco/ISP) sử dụng hệ thống E-Detective (ED) và Centralized Management Server (CMS) để giám sát các hoạt động bất hợp pháp.

## 11. Switch Port Stealing và MAC Flooding [Trang 1290 - 1292]

- **MAC Flooding** [Trang 1290]: Làm tràn bảng CAM bằng địa chỉ MAC giả, ép switch hoạt động như một hub (fail-open mode) để dễ dàng bắt gói tin.
  - Ví dụ lệnh công cụ: Kẻ tấn công sử dụng `macof -i eth0 -n 10` (một phần của bộ `dsniff`) để gửi khoảng 131.000 địa chỉ MAC và IP giả ngẫu nhiên mỗi phút.
- **Switch port stealing (Đánh cắp cổng switch)** [Trang 1292]: Sử dụng MAC flooding kết hợp gửi các gói ARP giả mạo (gratuitous ARP) lấy MAC của nạn nhân làm nguồn và MAC kẻ tấn công làm đích. Quá trình này tạo ra điều kiện tranh chấp (race condition), khiến switch cập nhật MAC của nạn nhân vào cổng của kẻ tấn công, từ đó kẻ tấn công chiếm giữ port và nhận mọi dữ liệu của nạn nhân.
  - **Ví dụ các bước thực hiện Đánh cắp cổng switch (Switch port stealing steps):**
    1. Máy của kẻ tấn công chạy một sniffer, chuyển card mạng (NIC) sang chế độ promiscuous.
    2. Host A (10.0.0.1) muốn giao tiếp với Host B (10.0.0.2). Vì vậy, Host A gửi một yêu cầu ARP.
    3. Switch phát sóng (broadcasts) yêu cầu ARP này đến tất cả các máy trong mạng.
    4. Trước khi Host B (máy mục tiêu) kịp trả lời yêu cầu ARP, kẻ tấn công sẽ phản hồi bằng một thông điệp ARP reply chứa địa chỉ IP và MAC giả mạo ("Tôi là 10.0.0.2, và MAC của tôi là MAC_C"). Kẻ tấn công có thể đạt được điều này bằng cách tung ra một cuộc tấn công DoS vào Host B, làm nó chậm lại.
    5. Lúc này, ARP cache trong switch sẽ ghi nhận cặp MAC và IP bị giả mạo.
    6. Địa chỉ MAC giả mạo của Host B được kết nối với cổng của máy kẻ tấn công (Port C), qua đó cập nhật bảng CAM của switch. Một kết nối được thiết lập giữa Host A và máy kẻ tấn công.
    7. Bây giờ, hệ thống sẽ chuyển tiếp tất cả các gói tin hướng tới Host B sang Host C (máy kẻ tấn công).
    8. Do đó, kẻ tấn công có thể nghe lén (sniff) các gói tin được gửi tới Host B.

**Các thông điệp và Định dạng gói tin DHCP (DHCP Request/Reply Messages & Packet Format) [Trang 1300 - 1302]:**

Quá trình giao tiếp DHCP sử dụng nhiều loại tin nhắn (IPv4/IPv6):

- **DHCPDiscover / Solicit:** Client phát sóng để tìm máy chủ DHCP.
- **DHCPOffer / Advertise:** Máy chủ gửi lại cấu hình IP đề xuất cho client.
- **DHCPRequest / Request, Confirm, Renew, Rebind:** Client phản hồi yêu cầu nhận tham số được cấp, hoặc xin gia hạn IP.
- **DHCPAck / Reply:** Máy chủ xác nhận và chính thức cấp IP cho client.
- **DHCPRelease / Release:** Client báo máy chủ thu hồi IP, hủy lease.
- **DHCPDecline / Decline:** Client thông báo IP được cấp đã có máy khác sử dụng.
- **DHCPInform / Information Request:** Client (đã có IP) chỉ xin máy chủ cấp thêm các tham số cấu hình cục bộ (như DNS, Gateway).
- **DHCPNAK:** Máy chủ từ chối yêu cầu của client (do IP sai subnet hoặc hết hạn).

**Cấu trúc trường gói tin IPv4 DHCP (IPv4 DHCP Packet Format):**

- **Opcode (1 byte):** 1 = Message từ client, 2 = Message từ server.
- **Transaction ID (XID) (4 bytes):** Số ngẫu nhiên client tạo ra để khớp request với reply.
- **Client IP Address (CIADDR) (4 bytes):** Dùng khi client đã có IP và đang phản hồi.
- **Your IP Address (YIADDR) (4 bytes):** IP do DHCP server cấp cho client.
- **Client Hardware Address (CHADDR) (16 bytes):** Địa chỉ MAC của client.

## 12. Tấn công DHCP (DHCP Attacks) [Trang 1303 - 1309]

- **DHCP starvation (Tấn công cạn kiệt DHCP)** [Trang 1303]: Kẻ tấn công gửi số lượng lớn các request chứa MAC giả mạo (spoofed MACs) tới DHCP server để làm cạn kiệt (exhaust) pool địa chỉ IP. Kết quả là server không thể cấp cấu hình cho các client mới, gây ra từ chối dịch vụ (DoS).
  - Công cụ: Yersinia, `dhcpStarvation.py`, Metasploit, Hyenae, DHCPig, Gobbler.
  - **Yersinia:** Là một công cụ mạng được thiết kế để lợi dụng các điểm yếu trong các giao thức mạng khác nhau như DHCP. Nó đóng vai trò như một framework vững chắc để phân tích và kiểm tra các hệ thống, mạng lưới đã được triển khai.
  - Phòng ngừa [Trang 1307]: Bật Port security (lệnh `switchport port-security`) để giới hạn MAC; dùng DHCP filtering.
- **Rogue DHCP server attack (Tấn công máy chủ DHCP giả mạo)** [Trang 1305]: Là dạng tấn công MITM. Kẻ tấn công dựng một DHCP server giả. Do server giả này trả gói (DHCPOFFER) về trước server hợp lệ, client sẽ lấy cấu hình từ nó. Kẻ tấn công có thể gán default gateway hoặc máy chủ DNS độc hại cho client để điều hướng lưu lượng.
  - Hạn chế [Trang 1306]: Bật DHCP Snooping, thiết lập cổng nối tới server hợp lệ là Trusted, và đánh dấu interface kết nối tới rogue DHCP là Untrusted để chặn tin nhắn.

**Các lệnh cấu hình bảo vệ DHCP trên Switch Cisco & Juniper [Trang 1307 - 1311]:**

- **Bật DHCP Snooping (Cisco):** `ip dhcp snooping` (bật toàn cầu). `ip dhcp snooping vlan <số vlan>` (bật trên VLAN cụ thể). `ip dhcp snooping trust` (cấu hình cổng kết nối tới DHCP server thật là cổng đáng tin cậy). `ip dhcp snooping limit rate <số>` (giới hạn gói tin DHCP mỗi giây để chống DoS/Starvation).
  - `no ip dhcp snooping information option`: Lệnh bổ sung dùng để vô hiệu hóa việc chèn và xóa trường option-82 trong các gói tin DHCP. [Trang 1309]
- **MAC Limiting trên Switch Juniper (Chống Starvation):** `set interface ge-0/0/1 mac-limit 3 action drop` (Giới hạn tối đa 3 địa chỉ MAC trên giao diện, nếu vượt quá sẽ drop gói tin).
- **Bật DHCP Filtering toàn cầu cho switch (Juniper):**
  - `config`
  - `<IP address> dhcp filtering`
  - `exit`
  - `exit`
- **DHCP Filtering (Juniper):** `config -> interface 0/11 -> <IP address> dhcp filtering trust` (Chỉ định cổng tin cậy nhận gói DHCP).
  - **Các lệnh kiểm tra trạng thái DHCP (Show Commands):**
    - `show ip dhcp snooping`: Lệnh trên switch Cisco để hiển thị tất cả các VLAN đang bật tính năng DHCP snooping.
    - `show ethernet-switching table`: Lệnh trên switch Juniper để xác minh quá trình giới hạn MAC (MAC limiting process).
    - `show <IP address> dhcp filtering`: Lệnh trên switch Juniper để xem cấu hình DHCP filtering.
  - Công cụ: `mitm6`, Ettercap, Gobbler.

## 13. Các kỹ thuật DNS poisoning [Trang 1345 - 1353]

Mục đích là thay thế địa chỉ IP hợp pháp tại DNS level bằng IP độc hại để chuyển hướng nạn nhân.

- **Intranet DNS spoofing** [Trang 1347]: Kết hợp với kỹ thuật ARP poisoning trên mạng cục bộ (LAN switch) để chặn và thay đổi các phản hồi DNS từ router trước khi gửi cho client.
- **Internet DNS spoofing** [Trang 1349]: Gọi là Remote DNS poisoning. Kẻ tấn công dựng rogue DNS server và dùng Trojan lây nhiễm vào máy nạn nhân để thay đổi cài đặt IP DNS cục bộ trỏ về server độc hại.
- **Proxy server DNS poisoning** [Trang 1350]: Kẻ tấn công gửi Trojan để thay đổi cấu hình proxy server trong trình duyệt Internet của người dùng (ví dụ: Internet Explorer) trỏ về proxy của kẻ tấn công.
- **DNS cache poisoning** [Trang 1351-1352]: Thêm hoặc sửa bản ghi DNS giả (forged DNS records) trực tiếp trên bộ nhớ đệm (cache) của resolver.
  - _(Bổ sung)_ **SAD DNS attack**: Biến thể mới, kẻ tấn công tiêm mã độc vào bộ đệm bằng cách khai thác các kênh phụ (side channels) và phần mềm DNS cũ như `dnsmasq`, `unbound`.
- Công cụ [Trang 1352-1353]: DerpNSpoof, deserter, PolarDNS, Ettercap, Evilgrade, DNS Goisoner.
  **Danh sách các biện pháp phòng ngừa DNS Spoofing chi tiết [Trang 1354 - 1355]:**
- Triển khai Domain Name System Security Extensions (DNSSEC).
- Sử dụng Secure Socket Layer (SSL) để bảo mật lưu lượng.
- Giải quyết mọi truy vấn DNS về một máy chủ DNS cục bộ.
- Chặn (Block) các yêu cầu DNS gửi ra máy chủ bên ngoài (external servers).
- Cấu hình firewall để hạn chế việc tra cứu DNS bên ngoài.
- Triển khai Hệ thống phát hiện xâm nhập (IDS) và cấu hình chính xác.
- Đổi cổng ngẫu nhiên (random source port) trên DNS resolver cho mỗi truy vấn ra ngoài.
- Giới hạn dịch vụ đệ quy DNS (DNS recusing service) cho người dùng được ủy quyền.
- Sử dụng giới hạn tần suất yêu cầu đối với các tên miền không tồn tại (NXDOMAIN rate limiting).
- Bảo mật các máy tính nội bộ.
- Sử dụng các bảng ARP và IP tĩnh.
- Sử dụng mã hóa Secure Shell (SSH).
- Không cho phép lưu lượng đầu ra dùng UDP port 53 làm cổng nguồn mặc định.
- Kiểm toán máy chủ DNS thường xuyên để loại bỏ lỗ hổng.
- Ngẫu nhiên hóa IP đích, IP nguồn và cả ID truy vấn (Query IDs).
- Ngẫu nhiên hóa chữ hoa/chữ thường trong tên truy vấn.
- Sử dụng Public Key Infrastructure (PKI) để bảo vệ server.
- Giới hạn chuyển vùng (DNS zone transfers) chỉ với các IP được ủy quyền.
- Sử dụng DNS-over-HTTPS (DoH) hoặc DNS-over-TLS (DoT).
- Sử dụng các công cụ phát hiện sniffing.
- Không mở các tệp tin đáng ngờ.
- Luôn sử dụng các trang web proxy đáng tin cậy.
- Nếu tổ chức tự xử lý resolver riêng, nó cần được giữ riêng tư và bảo vệ tốt.
- Sử dụng mã hóa 0x20 (0x20 encoding) và DNS cookies như một lớp bảo mật bổ sung cho thông điệp DNS.
- Giảm thời gian chờ (timeout period) đối với các truy vấn chưa hoàn thành để ngăn chặn tấn công SAD DNS.
- Cập nhật máy chủ DNS với các bản vá mới nhất để ngăn ngừa vi phạm.
- Sử dụng khóa RNDC (Remote Name Daemon Control) nếu các phản hồi được thực hiện trên cổng 53.
- Đảm bảo rằng quá trình phân giải tệp “Hosts” bị vô hiệu hóa trên cả máy khách và máy chủ.
- Cấu hình STUB zones cho các tên miền được truy cập thường xuyên.
- Triển khai các chính sách mật khẩu mạnh mẽ cho người dùng quản lý các bản ghi DNS.
- Cấu hình ACLs (Access Control Lists) trên máy chủ DNS để chỉ cho phép các truy vấn từ các nguồn đáng tin cậy.
- Triển khai giải pháp tường lửa DNS (DNS firewall) hoặc đăng ký dịch vụ DNS bảo vệ để lọc lưu lượng.

## 14. Công cụ sniffing / DNS sniffing [Trang 1357 - 1364]

- **Wireshark** [Trang 1357]: Chụp gói tin tương tác trên mạng, thường dùng cùng trình điều khiển WinPcap. Hỗ trợ tính năng "Follow TCP Stream" giúp kẻ tấn công xem trực tiếp mật khẩu dưới dạng văn bản thuần túy (cleartext).
  - **Chi tiết cách thực hiện Follow TCP Stream:** Để xem luồng TCP, chọn một gói TCP trong danh sách gói tin, sau đó vào menu **Analyze -> Follow -> TCP Stream**. Công cụ sẽ hiển thị nội dung luồng theo đúng trình tự xuất hiện trên mạng và có thể hiển thị dữ liệu bắt được dưới dạng ASCII, EBCDIC, hex dump, C array hoặc raw.

**Bảng Bộ lọc trong Wireshark (Display Filters)** [Trang 1360-1361]:

| Giám sát / Lọc                                                            | Bộ lọc / Ví dụ lọc                                                                                 |
| ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| Giám sát cổng (ví dụ port 23) và IP máy                                   | `tcp.port == 23` <br> `ip.addr == 192.168.1.100` <br> `ip.addr == 192.168.1.100 && tcp.port == 23` |
| Lọc theo nhiều địa chỉ                                                    | `ip.addr == 10.0.0.4 or ip.addr == 10.0.0.5`                                                       |
| Lọc theo địa chỉ IP                                                       | `ip.addr == 10.0.0.4`                                                                              |
| Bộ lọc khác (với kích thước frame)                                        | `ip.dst == 10.0.1.50 && frame.pkt_len > 400`                                                       |
| Hiển thị tất cả TCP reset                                                 | `tcp.flags.reset == 1`                                                                             |
| Đặt bộ lọc cho giá trị hex                                                | `udp contains 33:27:58`                                                                            |
| Hiển thị tất cả HTTP GET requests                                         | `http.request`                                                                                     |
| Hiển thị tất cả retransmissions trong trace                               | `tcp.analysis.retransmission`                                                                      |
| Hiển thị tất cả TCP packets chứa từ khóa traffic                          | `tcp contains "traffic"`                                                                           |
| Loại trừ ARP, ICMP, DNS hoặc các giao thức khác                           | `!(arp or icmp or dns)`                                                                            |
| Lọc mọi gói TCP có nguồn hoặc đích là cổng 4000                           | `tcp.port == 4000`                                                                                 |
| Hiển thị SMTP (port 25) và ICMP                                           | `tcp.port eq 25 or icmp`                                                                           |
| Hiển thị traffic LAN giữa workstation và server                           | `ip.src==192.168.0.0/16 and ip.dst==192.168.0.0/16`                                                |
| Lọc theo giao thức (ví dụ: SIP) và loại bỏ các địa chỉ IP không mong muốn | `ip.src != xxx.xxx.xxx.xxx && ip.dst != xxx.xxx.xxx.xxx && sip`                                    |

> _Ghi chú:_ Các lệnh lọc đã được chuẩn hóa lại đúng như giáo trình (ví dụ lệnh lọc độ dài frame là `frame.pkt_len > 400`, lệnh lọc hex là `udp contains <hex>`).

**Công cụ sniffing phổ biến khác** [Trang 1362-1364]:

- **Capsa Portable Network Analyzer**: Phân tích, chẩn đoán, chụp và giám sát lưu lượng dễ sử dụng.
- **Omnipeek**: Có khả năng hiển thị bản đồ Google Map (Google Maps plug-in) để xác định vị trí thực tế của tất cả các IP công cộng từ các gói bị bắt.
- _(Bổ sung)_ Các công cụ khác: RITA, Observer Analyzer, PRTG Network Monitor, Network Performance Monitor, Xplico.

## 15. Biện pháp chống sniffing (Defend Against Sniffing) [Trang 1366 - 1368]

**Danh sách các biện pháp phòng ngừa Sniffing chi tiết (Defend Against Sniffing) [Trang 1366 - 1368]:**

- Giới hạn quyền truy cập vật lý vào hạ tầng mạng để kẻ tấn công không thể cắm thiết bị nghe lén.
- Sử dụng mã hóa đầu-cuối (end-to-end encryption) để bảo vệ thông tin mật.
- Thêm vĩnh viễn MAC của gateway vào bộ đệm ARP cache.
- Sử dụng IP và bảng ARP tĩnh để ngăn chặn thêm các ARP spoofed entries.
- Tắt phát sóng định danh mạng (network identification broadcasts) và hạn chế mạng với user được phép.
- Sử dụng IPv6 thay vì IPv4 (vì IPsec là bắt buộc ở IPv6).
- Sử dụng SSH thay vì Telnet, SCP thay vì FTP, và SSL cho email.
- Sử dụng HTTPS thay vì HTTP, SFTP thay vì FTP.
- Sử dụng Switch thay vì Hub.
- Sử dụng PGP, S/MIME, VPN, IPSec, SSL/TLS, SSH và mật khẩu dùng 1 lần (OTPs).
- Sử dụng POP2/POP3 an toàn; dùng SNMPv3 (thay vì v1/v2) để quản lý thiết bị.
- Mã hóa mạnh luồng Wi-Fi bằng WPA2 hoặc WPA3.
- Lấy MAC trực tiếp từ NIC thay vì qua hệ điều hành (chống MAC spoofing).
- Sử dụng các công cụ để phát hiện xem có NIC nào đang chạy ở promiscuous mode không.
- Sử dụng ACLs để chỉ cấp phép truy cập cho các dải IP tin cậy.
- Đổi mật khẩu mặc định thành mật khẩu phức tạp.
- Tránh phát sóng SSIDs của mạng Wi-Fi và tránh truy cập Wi-Fi mở/không bảo mật.
- Triển khai lọc MAC trên Router.
- Sử dụng VLANs để chia nhỏ mạng, giới hạn không gian hoạt động của sniffer.
- Sử dụng VPN để tạo hầm an toàn cho việc truyền dữ liệu.
- Giám sát bất thường mạng qua IDS/IPS và thường xuyên audit log lưu lượng.

## 16. Cách phát hiện Sniffing (How to Detect Sniffing) [Trang 1369]

Để phát hiện các hoạt động nghe lén trên mạng, có thể sử dụng 3 hướng tiếp cận chính:

- **Chạy Hệ thống phát hiện xâm nhập (Run IDS):** Quản trị viên chạy IDS để xem địa chỉ MAC của bất kỳ máy nào có bị thay đổi không (Ví dụ: địa chỉ MAC của router). IDS có thể cảnh báo quản trị viên về các hoạt động đáng ngờ, chẳng hạn như sniffing hoặc MAC spoofing.
- **Kiểm tra các thiết bị đang chạy ở chế độ Promiscuous (Check the Devices Running in Promiscuous Mode):** Chế độ promiscuous cho phép thiết bị mạng chặn và đọc toàn bộ một gói tin mạng khi nó đến. Cần phải kiểm tra xem máy nào đang chạy ở chế độ này, vì chế độ này cho phép mọi gói tin đi qua mà không cần xác thực địa chỉ đích.
- **Chạy các công cụ mạng (Run Network Tools):** Chạy các công cụ mạng như Capsa Portable Network Analyzer để giám sát mạng nhằm phát hiện các gói tin lạ (ví dụ: gói tin chứa địa chỉ bị giả mạo). Các công cụ này cho phép thu thập, tổng hợp, tập trung và phân tích dữ liệu lưu lượng truy cập qua nhiều công nghệ và tài nguyên mạng khác nhau.

### Các phương pháp kỹ thuật phát hiện cụ thể (Sniffer Detection Techniques)

- **Ping Method (Phương pháp Ping)** [Trang 1370 - 1371]:
  - Để phát hiện, người ta gửi một yêu cầu ping đến máy tính bị nghi ngờ với đúng địa chỉ IP của nó nhưng kèm theo một địa chỉ MAC không chính xác (incorrect MAC address).
  - Adapter Ethernet thông thường sẽ từ chối gói tin này vì địa chỉ MAC không khớp.
  - Tuy nhiên, nếu máy nghi ngờ đang chạy sniffer ở chế độ promiscuous, nó sẽ phản hồi lại gói tin ping đó vì nó không từ chối các gói tin mang địa chỉ MAC khác. Việc nhận được phản hồi này sẽ giúp định danh chính xác sniffer trên mạng.
- **DNS Method (Phương pháp DNS)** [Trang 1370 - 1371]:
  - Hầu hết các sniffer đều tự động thực hiện tra cứu DNS ngược (reverse DNS lookups) để xác định tên máy tính dựa trên địa chỉ IP mà nó bắt được.
  - Quá trình tra cứu ngược này làm gia tăng lưu lượng mạng. Do đó, một máy tính tạo ra lưu lượng tra cứu reverse DNS thì rất có khả năng máy đó đang chạy một sniffer.
  - Cách thực hiện cục bộ: Cấu hình máy dò tìm ở chế độ promiscuous, sau đó gửi một yêu cầu ICMP tới một địa chỉ IP không tồn tại (non-existing IP address) và theo dõi phản hồi. Nếu hệ thống nhận được phản hồi, bạn có thể xác định được máy nào đang trả lời các truy vấn reverse DNS trên mạng cục bộ.
- **ARP Method (Phương pháp ARP)** [Trang 1370, 1372]:
  - Kỹ thuật này gửi một gói ARP non-broadcast (không quảng bá) đến tất cả các nút trong mạng.
  - Chỉ có nút nào đang chạy ở chế độ promiscuous mới lưu (cache) địa chỉ ARP cục bộ này.
  - Sau đó, phát một thông báo ping quảng bá (broadcast) trên mạng với IP cục bộ nhưng mang một địa chỉ MAC khác. Lúc này, chỉ có nút đã lưu MAC address từ trước (máy đang chạy promiscuous) mới có khả năng phản hồi yêu cầu ping đó.
  - Các máy tính khác còn lại trên mạng sẽ gửi một đầu dò ARP (ARP probe) để cố gắng xác định nguồn gốc của yêu cầu ping, từ đó giúp phát hiện ra nút nào đang chạy sniffer.

### Công cụ phát hiện Promiscuous Mode (Promiscuous Detection Tools) [Trang 1373 - 1375]

- **Nmap** [Trang 1373]:
  - Sử dụng kịch bản NSE của Nmap để kiểm tra xem một hệ thống trên mạng Ethernet cục bộ có đặt card mạng ở chế độ promiscuous hay không.
  - Cú pháp lệnh: `nmap --script=sniffer-detect [Target IP Address/Range of IP addresses]`.
- **NetScanTools Pro** [Trang 1373 - 1375]:
  - Phần mềm này bao gồm công cụ Promiscuous Mode Scanner dùng để quét mạng con (subnet) nhằm tìm kiếm các giao diện mạng đang lắng nghe mọi gói tin Ethernet ở chế độ promiscuous.
  - Các chuyên gia bảo mật sử dụng NetScanTools Pro để quét subnet bằng các gói ARP đã được sửa đổi, từ đó xác định thiết bị nào đang phản hồi lại với từng loại gói ARP. Tích hợp hiển thị rõ phân tích thiết bị nào ở trạng thái "Promiscuous Mode" hoặc "Maybe" (Có thể).
