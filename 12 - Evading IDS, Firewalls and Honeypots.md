## 1. Khái niệm và Chức năng của IDS (Intrusion Detection System) [Trang 1625]

Hệ thống phát hiện xâm nhập (IDS) là một phần mềm hoặc thiết bị phần cứng được sử dụng để giám sát, phát hiện và bảo vệ mạng/hệ thống khỏi các hoạt động độc hại, và cảnh báo ngay lập tức cho nhân viên bảo mật. Có 2 loại là Passive IDS (chỉ phát hiện) và Active IDS (như IPS - vừa phát hiện vừa ngăn chặn).

**Chức năng chính của IDS:**

- Thu thập và phân tích thông tin từ bên trong máy tính hoặc mạng nhằm xác định các vi phạm chính sách bảo mật, bao gồm truy cập trái phép và hành vi lạm dụng (misuse).
- IDS được coi là một "bộ dò gói tin" (packet sniffer) chặn các gói dữ liệu di chuyển qua các phương tiện truyền thông và giao thức, thường là TCP/IP.
- Các gói tin được phân tích sau khi chúng bị bắt giữ.
- IDS đánh giá lưu lượng truy cập để tìm kiếm các dấu hiệu xâm nhập đáng ngờ và phát cảnh báo (alarm) khi phát hiện.

## 2. Vị trí triển khai IDS trong mạng [Trang 1626]

- Một trong những nơi phổ biến nhất để đặt IDS là gần tường lửa (firewall).
- Tùy thuộc vào lưu lượng, IDS có thể đặt bên ngoài hoặc bên trong tường lửa. Khi đặt bên trong, vị trí lý tưởng nhất là gần vùng phi quân sự (DMZ).
- Thực hành tốt nhất (Best practice): Sử dụng chiến lược phòng thủ theo lớp (layered defense) bằng cách triển khai một thiết bị IDS ở phía trước tường lửa (ngoài) và một thiết bị IDS khác ở phía sau tường lửa (trong mạng).

## 3. Cách IDS hoạt động [Trang 1626]

IDS giám sát và phát hiện xâm nhập theo thời gian thực qua các bước sau:

- IDS có các cảm biến (sensors) để nhận diện các chữ ký độc hại (malicious signatures) trong gói dữ liệu; một số IDS nâng cao bao gồm cả tính năng phát hiện hành vi (behavioral activity detection).
- Nếu chữ ký khớp (signature matches), IDS thực hiện các hành động đã định trước như: ngắt kết nối, chặn địa chỉ IP, loại bỏ gói tin (drop) và/hoặc phát cảnh báo cho quản trị viên.
- Khi chữ ký khớp, cơ chế phát hiện dị thường (anomaly detection) sẽ bị bỏ qua. Nếu không khớp, cảm biến mới tiếp tục phân tích các mẫu lưu lượng để tìm sự dị thường.
- Khi các gói tin vượt qua tất cả các khâu kiểm tra, IDS sẽ chuyển tiếp (forward) lưu lượng đó vào mạng.

## 4. Cách IDS phát hiện xâm nhập [Trang 1629 - 1630]

IDS sử dụng 3 phương pháp chính để phát hiện xâm nhập:

- **Nhận diện chữ ký (Signature recognition) hay Phát hiện lạm dụng (Misuse detection)** [Trang 1629 - 1630]: Tạo các mô hình xâm nhập và so sánh lưu lượng đến/đi với chữ ký nhị phân của các cuộc tấn công đã biết bằng phương pháp khớp mẫu (pattern-matching).
  - _Hạn chế:_ Yêu cầu lượng lớn dữ liệu chữ ký, tốn băng thông và có thể tạo cảnh báo giả (false positive). Kẻ tấn công chỉ cần thay đổi 1 bit mã (như với virus URSNIF, VIRLOCK) là có thể làm vô hiệu hóa chữ ký.
- **Phát hiện dị thường (Anomaly detection) hay Phát hiện không sử dụng (Not-use detection)** [Trang 1630]: Phát hiện xâm nhập dựa trên các đặc trưng hành vi cố định của người dùng và thành phần hệ thống. Sự kiện bị coi là tấn công khi nó nằm ngoài ngưỡng chịu đựng (tolerance threshold) của lưu lượng bình thường. Khó khăn lớn nhất là việc xây dựng một mô hình sử dụng bình thường chính xác.
- **Phát hiện bất thường giao thức (Protocol anomaly detection)** [Trang 1630]: Phân tích lưu lượng để phát hiện sự sai lệch so với các tiêu chuẩn giao thức đã thiết lập (established protocol standards) hoặc mẫu hành vi dự kiến. Bao gồm 3 bước: Xây dựng hành vi cơ sở (Baseline behavior), Xác định dị thường (như cấu trúc gói lạ, sai trình tự) và Áp dụng quy tắc phát hiện (Detection rules).

## 5. Phân loại hệ thống IDS [Trang 1633 - 1634]

- **Network-Based IDS (NIDS)** [Trang 1633]: Kiểm tra từng gói tin đi vào mạng để tìm kiếm sự dị thường. NIDS chụp và kiểm tra toàn bộ lưu lượng, thường là một "hộp đen" (black box) đặt trên mạng ở chế độ hỗn tạp (promiscuous mode), lắng nghe các mẫu xâm nhập. Có thể phát hiện các cuộc tấn công từ chối dịch vụ (DoS/DDoS) và quét cổng.
- **Host-Based IDS (HIDS)** [Trang 1634]: Phân tích hành vi của một hệ thống cụ thể, cài đặt trên mọi thiết bị từ PC đến Server. HIDS đa năng hơn NIDS, đặc biệt hiệu quả trong việc phát hiện hoạt động trái phép từ nội bộ (insider) và sửa đổi tệp trái phép (file modification). Chúng không phổ biến do tiêu tốn nhiều tài nguyên hệ thống (overhead) để giám sát từng sự kiện.

## 6. Các loại cảnh báo IDS (Types of IDS alerts) [Trang 1635]

| Loại (Type)                         | Hành động (Action)    | Giải thích (Explanation)                                                                                                                 |
| ----------------------------------- | --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **Dương tính thật (True Positive)** | Attack -> Alert       | IDS phát cảnh báo khi có một cuộc tấn công thực sự đang diễn ra, hoặc trong các cuộc diễn tập khi bảo mật viên dùng tool hacker để test. |
| **Dương tính giả (False Positive)** | No attack -> Alert    | IDS phát cảnh báo khi thực tế không có tấn công, coi hoạt động hệ thống bình thường là xâm nhập. Làm người dùng lờn cảnh báo.            |
| **Âm tính giả (False Negative)**    | Attack -> No Alert    | IDS không phát cảnh báo khi có tấn công thực sự. Đây là tình trạng nguy hiểm nhất vì hệ thống phòng thủ bị qua mặt.                      |
| **Âm tính thật (True Negative)**    | No attack -> No Alert | IDS không phát cảnh báo khi hành vi là hợp lệ và được chấp nhận. Hệ thống đang hoạt động đúng như mong đợi.                              |

## 7. Hệ thống ngăn chặn xâm nhập (Intrusion Prevention System - IPS) [Trang 1627 - 1628]

Hệ thống ngăn chặn xâm nhập (IPS) được coi là IDS chủ động (active IDS); chúng không chỉ có khả năng phát hiện mà còn có thể tự động đưa ra quyết định để ngăn chặn xâm nhập. Khác với IDS thụ động, IPS được đặt nối tiếp (inline) trong mạng giữa nguồn và đích.

**Các hành động chính của IPS** [Trang 1627]:

- Tạo cảnh báo khi phát hiện lưu lượng bất thường.
- Ghi nhật ký hoạt động mạng theo thời gian thực (Real-time logs).
- Chặn (block) và lọc (filter) lưu lượng độc hại.
- Phát hiện và loại bỏ mối đe dọa một cách nhanh chóng.
- Nhận diện mối đe dọa với độ chính xác cao nhằm giảm thiểu các báo cáo dương tính giả (false positives).
- Có thể phát hiện các mỗi đe dọa nội bộ (insider threats).

**Ưu điểm của IPS so với IDS** [Trang 1628]: IPS có thể khóa và loại bỏ trực tiếp các gói bất hợp pháp, giúp ngăn chặn các cuộc tấn công trực tiếp bằng cách kiểm soát lượng lưu lượng truy cập mạng.

**Phân loại IPS** [Trang 1628]: Giống như IDS, IPS được chia làm 2 loại:

- Dựa trên máy chủ (Host-based IPS).
- Dựa trên mạng (Network-based IPS).

## 8. Tường lửa (Firewall) [Trang 1636 - 1637]

Tường lửa là một hệ thống dựa trên phần cứng và/hoặc phần mềm được đặt tại cổng mạng (network gateway).

- **Chức năng chính:** Được thiết kế để ngăn chặn quyền truy cập trái phép vào hoặc ra khỏi một mạng riêng (private network).
- **Vị trí:** Đặt tại điểm nối hoặc cổng (gateway) giữa hai mạng, thường là giữa mạng riêng và mạng công cộng (như Internet).
- **Cách thức hoạt động:** Kiểm tra tất cả các thông điệp/gói tin đi vào hoặc đi ra khỏi Intranet (mạng riêng) và chặn những thông điệp không đáp ứng các tiêu chí bảo mật đã chỉ định. Tường lửa có thể thiết lập cấu hình để giới hạn dịch vụ (chặn email spam, cho phép POP/SMTP), kiểm tra gói tin, và tạo log ghi nhận tất cả các nỗ lực truy cập.

## 9. Kiến trúc tường lửa (Firewall Architecture) [Trang 1638 - 1640]

Kiến trúc tường lửa bao gồm các thành phần sau:

- **Bastion host** [Trang 1638]:
  - Là một hệ thống máy tính được thiết kế và cấu hình để bảo vệ tài nguyên mạng khỏi các cuộc tấn công. Hoạt động như bộ trung gian (mediator) giữa mạng bên trong và bên ngoài.
  - Có hai giao diện (interfaces): một giao diện công khai nối trực tiếp ra Internet và một giao diện riêng tư nối vào mạng nội bộ (Intranet).
- **Screened subnet (Mạng con được sàng lọc)** [Trang 1638 - 1639]:
  - Là một mạng được bảo vệ, tạo ra bằng cách sử dụng tường lửa có 2 hoặc 3 giao diện (multi-homed) đứng sau một tường lửa sàng lọc. Thuật ngữ này thường dùng để chỉ DMZ.
  - Với tường lửa 3 giao diện: Giao diện 1 kết nối Internet, giao diện 2 kết nối DMZ, giao diện 3 kết nối Intranet. DMZ phản hồi các yêu cầu công khai và không có máy chủ nào bị truy cập bởi mạng riêng. Người dùng Internet không thể truy cập vùng riêng tư này.
- **Multi-homed Firewall (Tường lửa đa giao diện)** [Trang 1639]:
  - Là một nút (node) có nhiều card mạng (NIC) kết nối tới 2 hoặc nhiều mạng. Giúp phân chia hệ thống logic và vật lý dựa trên mục tiêu bảo mật. (Mô hình bảo vệ sâu nhất là back-to-back firewall).
- **Demilitarized zone (Vùng phi quân sự - DMZ)** [Trang 1639 - 1640]:
  - Là một mạng con (sub-network) nhỏ đặt ở vùng trung lập giữa mạng nội bộ an toàn của công ty và mạng ngoài không tin cậy (Internet).
  - DMZ đóng vai trò là vùng đệm (buffer) để ngăn truy cập trực tiếp vào các phần khác của mạng. Bất kỳ dịch vụ nào cung cấp cho người dùng bên ngoài (như email, web, FTP) đều được đặt trong DMZ. _(Lưu ý: Database servers chứa thông tin nhạy cảm không được đặt ở DMZ)._

## 10. Phân loại tường lửa (Types of Firewalls) [Trang 1641 - 1650]

### A. Dựa trên cấu hình (Based on Configuration) [Trang 1641 - 1643]

- **Tường lửa dựa trên mạng (Network-based firewall)** [Trang 1641 - 1642]:
  - Đặt ở ranh giới mạng (perimeter) để kiểm tra header gói tin và áp đặt quy tắc bảo mật. Bảo vệ toàn bộ mạng LAN. Ví dụ: Cisco Secure Firewall ASA, PA-7500, FortiGate 7121F.
  - _Ưu điểm:_ Bảo mật cao (có OS riêng), tốc độ xử lý nhanh, ít can thiệp mạng.
  - _Nhược điểm:_ Đắt tiền, khó cấu hình, tốn không gian và cáp nối.
- **Tường lửa trên máy chủ (Host-based firewall)** [Trang 1642 - 1643]:
  - Chạy trên từng cá nhân PC, thiết bị di động hoặc server. Bảo vệ chống truy cập trái phép, Trojan, email worms. Thích hợp cho người làm việc ngoài công ty. Ví dụ: Microsoft Defender, ZoneAlarm Pro, Norton Smart Firewall, McAfee.
  - _Ưu điểm:_ Rẻ hơn, lý tưởng cho cá nhân/gia đình, dễ cấu hình.
  - _Nhược điểm:_ Tiêu tốn tài nguyên hệ thống (RAM, CPU), khó gỡ cài đặt, không hợp cho môi trường cần tốc độ phản hồi nhanh.

### B. Dựa trên cơ chế hoạt động (Based on Working Mechanism) [Trang 1644 - 1650]

- **Packet-filtering firewall** [Trang 1644 - 1645]: So sánh gói tin với tập tiêu chí tĩnh để định tuyến (cho qua hoặc rớt). Các tiêu chí lọc bao gồm: IP nguồn, IP đích, cổng nguồn TCP/UDP, cổng đích TCP/UDP, TCP flag bits (SYN, ACK), giao thức, hướng, và interface.
- **Circuit-level gateway** [Trang 1645]: Hoạt động ở Lớp Session (Lớp 5 OSI). Không lọc gói tin riêng lẻ mà xác thực thông qua việc giám sát bắt tay TCP (TCP three‑way handshake). Chuyển tiếp dữ liệu nhưng ẩn thông tin mạng nội bộ.
- **Application-level firewall (Proxy)** [Trang 1646 - 1647]: Tập trung ở Lớp Application (Lớp 7 OSI). Phân tích nội dung và dữ liệu ứng dụng (lọc các lệnh cụ thể như HTTP POST/GET). Có 2 chế độ: Active (chủ động kiểm tra và chặn SQLi, XSS, cookie tampering) và Passive (như IDS, chỉ phát hiện).
- **Stateful multi-layer inspection firewall** [Trang 1647]: Kết hợp ưu điểm của 3 loại trên. Ghi nhớ trạng thái các kết nối đã đi qua trước đó, đánh giá tính hợp lệ của phiên ở Lớp Network và kiểm tra sâu nội dung ở Lớp Application. (Ví dụ: Cisco PIX).
- **Application proxy** [Trang 1648]: Máy chủ trung gian ảo (transparent). Nhận yêu cầu từ người dùng và thay mặt họ giao tiếp với Internet. Ưu điểm: Rất hữu ích cho việc ghi log, giảm tải mạng (nhờ caching), thực hiện xác thực cấp người dùng, và bảo vệ các triển khai IP yếu/lỗi.
- **Network address translation (NAT)** [Trang 1648 - 1649]: Chuyển đổi địa chỉ IP nội bộ sang IP công cộng (và ngược lại) để ẩn sơ đồ mạng nội bộ, ép lưu lượng qua một điểm nút thắt (choke point). Các sơ đồ: Cấp 1 IP tĩnh, Cấp phát động, hoặc PAT (Port Address Translation).
- **VPN firewall** [Trang 1650]: Dùng để kết nối WAN an toàn qua Internet. Thực hiện đóng gói (encapsulation), mã hóa lưu lượng và kiểm tra tính toàn vẹn bên ngoài vòng kiểm tra gói tin.
- **Next‑generation firewall (NGFW)** [Trang 1650 - 1651]: Giải pháp bảo mật tinh vi thực hiện Deep Packet Inspection (DPI) (kiểm tra gói tin sâu), nhận diện ứng dụng, tích hợp tính năng IPS, chống malware và tận dụng thông tin tình báo đe dọa từ Cloud để chặn Zero-day và APT.

Bảng Tóm tắt Tường lửa dựa trên Lớp OSI (OSI Layer Summary) [Trang 1644, 1665]
_(Bổ sung từ bảng CEH Keywords của người dùng và giáo trình)_

| Firewall Type                          | OSI Layer                     | How It Works (Cách hoạt động)                         | CEH Keywords           |
| -------------------------------------- | ----------------------------- | ----------------------------------------------------- | ---------------------- |
| **Packet-Filtering Firewall**          | L3 (Network) / L4 (Transport) | Lọc dựa trên IP, port, TCP flags, protocol.           | Stateless filtering    |
| **Stateful Firewall**                  | L3 / L4                       | Theo dõi và ghi nhớ trạng thái kết nối (state table). | Session awareness      |
| **Circuit-Level Gateway**              | L5 (Session)                  | Xác thực tính hợp lệ của quá trình bắt tay TCP.       | Session validation     |
| **Application-Level Firewall (Proxy)** | L7 (Application)              | Kiểm tra nội dung dữ liệu ứng dụng cụ thể.            | Deep packet inspection |
| **Next-Generation Firewall (NGFW)**    | L3–L7                         | Đa lớp: DPI + Tích hợp IDS/IPS + Nhận diện ứng dụng.  | Application awareness  |

## 11. Hạn chế của Tường lửa (Firewall Limitations) [Trang 1651 - 1652]

- Có thể hạn chế quyền truy cập Internet và các dịch vụ hữu ích (như FTP, Telnet).
- Không thể ngăn chặn các cuộc tấn công từ bên trong (internal attacks) hoặc backdoor do nhân viên bất mãn tạo ra.
- Tạo thành một điểm tắc nghẽn (bottleneck) và điểm ngắm duy nhất nếu mọi kết nối đều đi qua nó.
- Không bảo vệ được trước Social Engineering và các cuộc tấn công hướng dữ liệu (vd: nạn nhân tự bấm vào link độc hại trong email).
- Không bảo vệ được nếu các thiết bị ngoại vi (USB, laptop cá nhân) đã nhiễm mã độc được cắm trực tiếp vào mạng nội bộ.
- Không ngăn chặn được tất cả các virus Zero-day, không thể thay thế phần mềm Antivirus, và không thể phân tích các lưu lượng đã bị mã hóa đường hầm (tunneled traffic).

## 12. Phát hiện xâm nhập bằng quy tắc YARA (Intrusion Detection using YARA Rules) [Trang 1653 - 1655]

YARA là một công cụ nghiên cứu mã độc đa nền tảng (Windows, macOS, Linux) cho phép các nhà phân tích bảo mật phát hiện và phân loại malware/mã độc thông qua phương pháp tiếp cận dựa trên quy tắc (rule-based). Nó phân tích các mẫu văn bản hoặc mã nhị phân (hex) cụ thể trong tệp.

Cú pháp của một quy tắc YARA bắt đầu bằng từ `rule` kèm theo tên quy tắc và bao gồm 3 phần logic chính:

- **`metadata` (meta)**: Là phần chứa thông tin chung (như mô tả, mức độ đe dọa, tác giả) mà nhà phân tích sử dụng để định danh các tệp thu thập được bởi quy tắc cụ thể đó.
- **`strings` (strings)**: Cung cấp ý nghĩa cho phần điều kiện bằng cách định nghĩa tất cả các chuỗi cần tìm trong tệp. YARA hỗ trợ các loại chuỗi: chuỗi thập lục phân (hexadecimal), văn bản thuần túy (text strings), và biểu thức chính quy (regular expressions).
- **`condition` (condition)**: Các biểu thức Boolean xác định điều kiện logic/Khi nào thì kết quả trả về là `true` để kết luận tệp đó là mã độc.

**Công cụ tham khảo: yarGen** [Trang 1654 - 1655]

- **yarGen** (Mã nguồn: `https://github.com`) là công cụ dùng để tự động tạo ra các quy tắc YARA.
- Hoạt động dựa trên nguyên tắc: trích xuất các chuỗi từ các tệp malware đã biết, đồng thời loại bỏ các chuỗi hợp pháp (bằng cách đối chiếu với kho cơ sở dữ liệu các tệp tin an toàn - goodware strings/opcode database dạng ZIP).
- Được cài đặt thông qua Python (`pip install -r requirements.txt`) và hỗ trợ mạnh mẽ cho các nhà phân tích tự động hóa việc viết quy tắc YARA.

## 13. Công cụ IDS (Intrusion Detection Tools) [Trang 1657 - 1662]

Các công cụ này giúp đọc gói tin mạng, tái tạo phiên người dùng và phát hiện dấu hiệu tấn công:

- **Snort** [Trang 1657 - 1660]: Hệ thống IDS mạng mã nguồn mở, thực hiện phân tích lưu lượng thời gian thực và ghi log gói tin trên mạng IP. Có khả năng phân tích giao thức và tìm kiếm/so khớp nội dung để phát hiện buffer overflows, stealth port scans và OS fingerprinting.
  - Sử dụng thư viện `libpcap` (UNIX/Linux) hoặc `Winpcap` (Windows).
  - **Quy tắc Snort (Snort Rules):** Ngôn ngữ cấu hình linh hoạt viết trên một dòng duy nhất, gồm 2 phần là Rule header (xác định hành động alert, log, pass, IP, Port) và Rule options (chứa thông báo cảnh báo).
- **Suricata** [Trang 1661 - 1662]: Công cụ phát hiện mối đe dọa mạng mạnh mẽ với khả năng chạy IDS thời gian thực, có thể chạy inline như một IPS (Intrusion Prevention System). Hỗ trợ giám sát an ninh mạng (NSM) và xử lý gói tin pcap offline (ngoại tuyến). Hỗ trợ ngôn ngữ mã lệnh Lua và xuất dữ liệu ra YAML/JSON để tích hợp dễ dàng với SIEM.
- _(Bổ sung từ nguồn)_ **Các công cụ IDS khác** [Trang 1662]: Juniper Network’s IDP system, Samhain HIDS, OSSEC, Zeek, Cisco Secure IPS.

## 14. Công cụ IPS (Intrusion Prevention Tools) [Trang 1663 - 1664]

- **Trellix IPS** [Trang 1663 - 1664]: Giúp chuyên gia bảo mật phát hiện các mạng botnet tàng hình, worm và các cuộc tấn công dò thám/thu thập thông tin (reconnaissance attacks) từ sớm. Nó tổng hợp dữ liệu luồng (flow data) từ switch/router và phân tích hành vi để tương quan các mẫu bất thường.
- _(Bổ sung từ nguồn)_ **Các công cụ IPS khác** [Trang 1664]: Check Point Quantum IPS, Atomic OSSEC, McAfee Host Intrusion Prevention for Desktops, Secure IPS (NGIPS), Palo Alto Advanced Threat Prevention.

## 15. Kỹ thuật né tránh IDS và Tường lửa (IDS and Firewall Evasion Techniques) [Trang 1668 - 1708]

### Xác định mục tiêu (IDS/Firewall Identification) [Trang 1669 - 1671]

- **Quét cổng (Port scanning):** Kẻ tấn công quét các cổng mở để tìm lỗ hổng phiên bản dịch vụ. Vài firewall sẽ tự "khai báo" danh tính khi bị quét (Ví dụ: ManageEngine lắng nghe trên UDP 514/1514; Snort IDS lắng nghe trên TCP 80 và UDP 53).
- **Firewalking:** Kỹ thuật dùng giá trị TTL (Time-to-Live) để xác định các bộ lọc ACL trên gateway và lập bản đồ mạng (hoạt động tương tự traceroute). Kẻ tấn công gửi gói TCP/UDP với giá trị TTL lớn hơn 1 hop so với tường lửa mục tiêu để xem phản hồi ICMP error. Công cụ: Script `firewalk` của Nmap.
- **Banner grabbing:** Thu thập thông báo dịch vụ để nhận diện nhà cung cấp và phiên bản firmware của tường lửa/IDS. Thường thực hiện trên các dịch vụ FTP, Telnet, web server. (Ví dụ lệnh: `telnet mail.targetcompany.org 25`).

### IP spoofing, source routing và fragmentation [Trang 1672 - 1674]

- **IP address spoofing (Giả mạo IP)** [Trang 1672]: Giả mạo địa chỉ IP nguồn để ẩn danh và đóng giả làm một nguồn được tin cậy (trusted host) để lọt qua firewall. Kẻ tấn công sử dụng các công cụ như `hping` để tạo các gói tin tùy chỉnh với IP nguồn giả mạo.
- **Source routing (Định tuyến nguồn)** [Trang 1673]: Kẻ gửi gói tin sẽ tự chỉ định tuyến đường đi (route) của gói tin đó qua các đoạn mạng ít được bảo mật hoặc chưa cài đặt IDS. Cho phép kẻ tấn công né tránh các nút kiểm duyệt. Chia làm 2 loại: loose source routing (chỉ định vài điểm phải đi qua) và strict source routing (chỉ định chính xác mọi điểm).
- **Tiny fragments (Phân mảnh nhỏ)** [Trang 1674]: Tấn công bằng cách chia nhỏ các gói tin TCP ra thành các mảnh cực nhỏ, buộc một số thông tin quan trọng của header TCP phải nằm ở mảnh tiếp theo. Firewall/IDS thường chỉ kiểm tra header ở mảnh đầu tiên, nên nếu mảnh đầu lọt qua, các mảnh chứa mã độc phía sau cũng sẽ trót lọt.

### Bypassing FW/IDS using a proxy server (Né tránh qua proxy) [Trang 1677]

- Giúp truy cập các dịch vụ bị chặn. Trên Windows, người dùng có thể lách luật từ thiết bị tới tường lửa bằng cách: Vào Control Panel -> Internet Options -> LAN settings. Cấu hình IP và Port proxy, và chọn mục "Bypass proxy server for local addresses".

### ICMP tunneling (Tạo hầm ICMP) [Trang 1678 - 1679]

- Lợi dụng việc ICMP ít bị chặn do được dùng cho Ping và Traceroute.
- Kẻ tấn công cài đặt công cụ `ICMPTX` trên hệ thống.
- Họ chèn các lệnh của máy khách hoặc payload độc hại vào phần dữ liệu (data portion) của gói ICMP Echo.
- IDS/Firewall thường không kiểm tra phần dữ liệu của ICMP, cho rằng đó là lưu lượng hợp lệ nên cho phép đi qua mạng mà không đánh chặn.

### Bypassing IDS/Firewall through ACK tunneling [Trang 1680 - 1681]

- Nhiều tường lửa tập trung lọc gói SYN (khởi tạo) và nới lỏng việc lọc các gói ACK vì cho rằng chúng thuộc về một kết nối đã được thiết lập hợp lệ trước đó.
- Kẻ tấn công thiết lập một kết nối TCP hợp lệ.
- Sử dụng các công cụ như `hping` hoặc `nping`, kẻ tấn công chế tạo các gói ACK mang theo payload độc hại.
- Tường lửa không kiểm tra kỹ sẽ cho phép các gói này đi qua, giúp né tránh phát hiện của IDS.

### HTTP tunneling (Tạo hầm HTTP) [Trang 1682 - 1687]

- Tunnel/đóng gói lưu lượng (như FTP) vào bên trong TCP port 80 (HTTP) vì cổng này thường luôn được tường lửa mở.
- HTTP tunneling giúp che giấu danh tính, vượt chặn và chia sẻ tài nguyên qua HTTP.
- Công cụ: `chisel`, HTTPort, HTTHost, Tunna. HTTPort hỗ trợ cấu hình SSL/CONNECT mode hoặc chạy qua một remote host bảo mật bên ngoài để mã hóa toàn bộ dữ liệu.

### SSH tunneling (Tạo hầm SSH) [Trang 1688 - 1691]

- Sử dụng các công cụ như OpenSSH (`OpenSSH`) hoặc Bitvise SSH Client để mã hóa và đóng gói toàn bộ lưu lượng (thường là không mã hóa như FTP) gửi tới một máy từ xa nhằm né các trạm kiểm duyệt.
- **Local port forwarding (LPF):** Chuyển tiếp cổng cục bộ ra máy từ xa để truy cập tài nguyên nội bộ không được mở ra bên ngoài mạng.
- **Remote port forwarding (RPF):** Mở dịch vụ nội bộ cục bộ ra ngoài qua hầm SSH.
- **Dynamic port forwarding (DPF):** Tạo một proxy SOCKS linh hoạt qua SSH, giúp định tuyến và truy cập mọi loại lưu lượng mạng mà không bị IDS phát hiện.

### DNS tunneling (Tạo hầm DNS) [Trang 1692 - 1693]

- Giao thức DNS sử dụng UDP và có giới hạn 255 byte cho các truy vấn gửi ra ngoài (outbound queries). Kẻ tấn công lợi dụng không gian nhỏ này để nhúng dữ liệu độc hại dạng chuỗi (text/hex) vào gói DNS.
- Hệ thống DNSSEC (dù bảo mật) cũng không thể phát hiện được nội dung bị nhúng lén lút như vậy.
- Kỹ thuật này được mã độc dùng để duy trì kết nối ẩn với máy chủ Command & Control (C2). Công cụ: `iodine`, `dnscat2`.

### Hệ thống bên ngoài (External system) [Trang 1694 - 1695]

- Người dùng (nhân viên) làm việc từ xa hoặc dùng máy tính cá nhân ở nhà có quyền truy cập hệ thống nội bộ công ty.
- Kẻ tấn công "nghe lén" (sniff) lưu lượng người dùng và đánh cắp session ID hoặc cookie.
- Sử dụng thông tin này, kẻ tấn công dễ dàng truy cập mạng nội bộ công ty xuyên qua firewall/IDS và chiếm lấy Windows ID của tiến trình đang chạy.
- Sau đó, kẻ tấn công kích hoạt lệnh `openURL()` tới cửa sổ trình duyệt đó, ép nó tải mã độc nhúng từ web server của kẻ tấn công và thực thi trên máy nạn nhân.

### MITM attacks (Tấn công trung gian) [Trang 1696 - 1697]

- Kẻ tấn công thực hiện đầu độc máy chủ DNS (DNS server poisoning) của công ty để sửa đổi IP trả về.
- Khi người dùng mạng nội bộ gửi yêu cầu hợp lệ (ví dụ: `facebook.com`), truy vấn bị lừa và trả về IP chuyển hướng tới server độc hại của kẻ tấn công.
- Từ đây, kẻ tấn công đóng vai trò trung gian, kết nối với host thật và có thể "tunnel" (đóng gói) mọi lưu lượng HTTP của nạn nhân để đọc lén.

### Bypassing through content (Né tránh bằng Nội dung) [Trang 1698]

- Gửi các nội dung ẩn chứa mã độc cho người dùng để lừa họ mở. Định dạng file mang mã độc vô cùng đa dạng (EXE, COM, BAT, DVB, DOC, XLS, PDF, v.v.).
- Tận dụng phương thức Macro bypass exploit (khai thác vượt rào macro); khi người dùng mở tài liệu, tệp thực thi độc hại ẩn bên trong sẽ tự động được tải về và chạy.
- Kẻ tấn công dùng kỹ thuật giấu tin (steganography) hoặc làm rối (obfuscation) để qua mặt tường lửa.

### XSS attack (Cross‑Site Scripting để né WAF) [Trang 1699 - 1700]

- Lỗ hổng XSS xảy ra khi ứng dụng web xử lý tham số đầu vào của người dùng không an toàn.
- Kẻ tấn công chèn mã HTML/JS độc hại (Ví dụ: `<script>alert("XSS")</script>`).
- Để vượt qua bộ lọc của Web Application Firewall (WAF), kẻ tấn công biến đổi mã:
  - **Mã ASCII:** Chuyển ký tự sang số (Ví dụ: `String.fromCharCode(97, 108, 101...)`).
  - **Mã Hex Encoding:** Chuyển thành hệ thập lục phân (Ví dụ: `%3C%73%63...`).
  - **Obfuscation:** Trộn lẫn ký tự hoa/thường (Ví dụ: `<sCRiPt>`).

### Bypassing WAF (Các kỹ thuật lách WAF khác) [Trang 1701 - 1703]

- **HTTP header spoofing:** Giả mạo tiêu đề (header) HTTP để lừa WAF rằng lưu lượng đến từ mạng nội bộ. Dùng các header như `X-Forwarded-For`, `X-Originating-IP` qua công cụ Burp Suite.
- **Phát hiện blacklist (Blacklist Detection):** Kẻ tấn công xác định các từ khóa bị WAF cấm (ví dụ: `and`, `or`, `union`, SQL query). Sau đó, họ tinh chỉnh cú pháp để lách luật _(Ví dụ thay vì dùng lệnh bình thường, dùng `1 || (select username...) = 'admin'`)_.
- **Fuzzing / Brute forcing:** Sử dụng các danh sách từ khóa (wordlists) khổng lồ như Assetnote Wordlists và SecLists để thử nghiệm diện rộng.
- **Lạm dụng cipher SSL/TLS:** Dùng công cụ `sslscan2` để kiểm tra các mã hóa (cipher) mà web server đích hỗ trợ. Tìm ra cipher nào được máy chủ hỗ trợ nhưng WAF lại không nhận diện được, và dùng nó để tạo kênh giao tiếp mù đối với WAF.

### HTML smuggling (Buôn lậu HTML) [Trang 1704 - 1705]

- Là kiểu tấn công web, nhúng mã độc trực tiếp vào các thẻ đính kèm HTML5 hoặc trang web.
- Lợi dụng sức mạnh của JavaScript Blob (`window.URL.createObjectURL(fakeBlob)`) và URL lure để tự động lắp ráp và ép trình duyệt tải xuống nội dung độc hại.
- Vì mã độc được tạo động bằng client-side JS (trên trình duyệt), IDS/Firewall không thể thấy tệp thực thi nào đi qua mạng để quét, từ đó qua mặt hoàn toàn sự phát hiện.

### Windows BITS (Dịch vụ truyền tải nền thông minh) [Trang 1706 - 1708]

- **Background Intelligent Transfer Service (BITS)** là dịch vụ tiêu chuẩn của Windows chuyên dùng để phân phối các bản cập nhật hệ điều hành (Windows update) một cách ngầm định. Tổ chức thường không kiểm tra BITS vì nghĩ đó là luồng traffic hợp lệ.
- `bitsadmin` có thể tạo job để chuyển file (bị lạm dụng để truyền file độc hại) và tạo persistence _(Ví dụ: `/SetNotifyCmdLine persistence <Local Path> NULL` sẽ kích hoạt thực thi malware ngay khi tải xong)_.

### Các kỹ thuật né tránh IDS khác (Other IDS Evasion Techniques) [Trang 1709 - 1722]

- **Insertion attack (Tấn công chèn)** [Trang 1710]: Làm rối IDS bằng cách ép nó đọc các gói tin không hợp lệ. Kẻ tấn công gửi các gói tin bị lỗi (như sai IP checksum hoặc TTL) mà NIDS chấp nhận nhưng máy đích (end system) sẽ từ chối. Kết quả là IDS đọc sai nội dung (ví dụ: IDS đọc thành "phoneyf" trong khi máy đích chỉ đọc "phf").
- **Evasion (Né tránh)** [Trang 1711]: Ngược lại với Insertion. Xảy ra khi IDS loại bỏ (discard) các gói tin trong khi host đích vẫn chấp nhận chúng. Ví dụ: gửi một chuỗi độc hại từng byte một, nếu IDS loại bỏ nhầm một byte, nó sẽ không thể nhận diện được chữ ký tấn công.
- **Denial-of-Service (DoS)** [Trang 1711 - 1712]: Kẻ tấn công tiêu thụ các tài nguyên của IDS (CPU, RAM, dung lượng ổ đĩa, băng thông) để khiến thiết bị không thể xử lý hoặc ghi log cảnh báo. Ví dụ: tạo lượng lớn log rác để lấp đầy ổ cứng hoặc tấn công làm sập máy chủ log trung tâm.
- **Obfuscation (Làm rối)** [Trang 1712]: Mã hóa payload tấn công sao cho chỉ có host đích (được nhắm tới) mới có thể giải mã, còn IDS thì không. Kẻ tấn công dùng ký tự Unicode, mã đa hình (polymorphic), hoặc ẩn giấu qua giao thức mã hóa (HTTPS) và kỹ thuật giấu tin (steganography).
- **False positive generation (Tạo cảnh báo giả)** [Trang 1713]: Tạo ra một lượng lớn cảnh báo giả (log noise) để làm quản trị viên mất cảnh giác, từ đó che giấu luồng traffic của cuộc tấn công thực sự.
- **Session splicing (Ghép nối phiên)** [Trang 1713]: Tấn công ở lớp mạng. Kẻ tấn công chia nhỏ traffic thành rất nhiều gói tin kích thước siêu nhỏ và thêm độ trễ (delays) giữa chúng, khiến IDS không thể ráp nối (reconstruct) và khớp mẫu chữ ký trước khi quá thời gian timeout. (Công cụ: Nessus).
- **Unicode evasion technique** [Trang 1713 - 1714]: Sử dụng nhiều biểu diễn khác nhau cho cùng một ký tự (ví dụ UTF-8, UTF-16) để né bộ lọc. Ví dụ: dấu `/` có thể viết thành `%u2215`, khiến IDS xử lý sai nhưng web server vẫn hiểu được.
- **Fragmentation attack (Tấn công phân mảnh)** [Trang 1714 - 1716]: Khai thác giới hạn kích thước MTU. Nếu MTU bị vượt, gói tin sẽ bị phân mảnh. Kẻ tấn công lợi dụng sự chênh lệch thời gian chờ ghép nối (reassembly timeout) giữa IDS và máy đích (Ví dụ: IDS timeout 10s, máy đích 20s) để đẩy các mảnh vỡ qua IDS mà không bị phát hiện.
- **Time to live (TTL) attacks** [Trang 1716 - 1717]: Khai thác kiến thức về topology (số lượng router giữa kẻ tấn công và nạn nhân). Gửi các mảnh vỡ mang mã độc (fragments) với TTL được tính toán chính xác để gói tin đi qua được tường lửa nhưng bị drop ngay trước khi tới IDS hoặc ngược lại.
- **Urgent (URG) flag** [Trang 1717 - 1718]: Trong TCP, cờ URG dùng con trỏ để đánh dấu dữ liệu khẩn cấp. Một số IDS đọc toàn bộ dữ liệu, nhưng hệ thống đích lại bỏ qua phần dữ liệu rác nằm trước con trỏ URG, dẫn đến sự bất đồng bộ giữa IDS và máy đích.
- **Invalid RST packets** [Trang 1718]: Gửi gói TCP RST với giá trị checksum không hợp lệ. IDS tưởng phiên kết nối đã đóng nên ngừng theo dõi, trong khi máy đích loại bỏ gói RST lỗi này và tiếp tục nhận dữ liệu độc hại phía sau.
- **Polymorphic shellcode** [Trang 1718 - 1719]: Mã độc tự động thay đổi cấu trúc biểu diễn (bằng cách mã hóa payload và đính kèm bộ giải mã) để qua mặt các NIDS dựa trên chữ ký (signature-based).
- **ASCII shellcode** [Trang 1719]: Chuyển đổi mã shellcode chỉ dùng các ký tự thuộc bảng mã ASCII chuẩn để lách qua các bộ lọc ký tự khắt khe của IDS.
- **Application-layer attacks** [Trang 1719 - 1720]: Lợi dụng các file đa phương tiện (ảnh, audio, video) có sử dụng nén (compression). Kẻ tấn công giấu mã độc bên trong file nén, vì nhiều IDS không thể giải nén để quét chữ ký bên trong.
- **Desynchronization (Mất đồng bộ)** [Trang 1720]: Gửi gói Pre-Connection SYN (chứa checksum sai) trước khi kết nối thật thiết lập, hoặc Post-Connection SYN để làm rối việc theo dõi sequence number (số thứ tự) của IDS.
- **Domain Generation Algorithms (DGA)** [Trang 1720 - 1721]: Thuật toán tạo ra hàng loạt tên miền (domain) động/ngẫu nhiên. Đổi điểm C2 liên tục để lách qua các bộ lọc danh sách đen (blacklist) và IP tĩnh. Các loại DGA: Character-based, PRNG, Dictionary-based, High-collision.
- _(Bổ sung từ nguồn)_ **Encryption** [Trang 1721]: Dùng SSH, SSL hoặc VPN tunnel để mã hóa traffic. IDS không thể phân tích các gói tin đã được mã hóa.
- _(Bổ sung từ nguồn)_ **Flooding** [Trang 1722]: Làm ngập lụt bộ nhớ và CPU của IDS bằng traffic rác để che giấu traffic tấn công thực sự.

## 16. NAC và Né tránh bảo mật điểm cuối (NAC and Endpoint Security Evasion)

### Network Access Control (NAC) Evasion [Trang 1726 - 1728]

- **VLAN hopping** [Trang 1726]: Chiếm quyền truy cập bằng cách lợi dụng giao thức Dynamic Trunking Protocol (DTP) để thay đổi chế độ của switch thành "dynamic auto" hoặc "dynamic desirable", tạo đường trunk để nhảy sang VLAN khác. Công cụ: `VLANPWN` (chứa 2 script Python là `DoubleTagging.py` và `DTPHijacking.py`).
- **Dùng thiết bị đã xác thực (Pre-authenticated device)** [Trang 1727 - 1728]: Lợi dụng một thiết bị đã được cấp quyền hợp lệ để "buôn lậu" (smuggle) các gói tin độc hại vào mạng. Kẻ tấn công thường cắm một thiết bị như Raspberry Pi đứng giữa switch mạng và máy tính đã xác thực. Công cụ: `nac_bypass_setup.sh`, FENRIR, NACkered, Silentbridge, BITM.

### Bypass Endpoint Security (Né tránh bảo mật điểm cuối) [Trang 1729 - 1759]

- **Ghostwriting** [Trang 1729 - 1730]: Kỹ thuật sửa đổi cấu trúc nhị phân (assembly code) của malware mà không làm thay đổi chức năng nhằm né tránh Antivirus dựa trên chữ ký. Công cụ: `ghostwriting.sh` (tự động hóa giải mã, chèn mã rác và biên dịch lại).
- **Application whitelisting bypass** [Trang 1730]: Vượt qua danh sách trắng bằng DLL hijacking. Đặt một DLL độc hại với tên hợp lệ vào cùng thư mục với phần mềm hợp pháp để nó được tự động load. Sử dụng các công cụ như `rundll32.exe`, `regsvr32.exe`.
- **Dechaining macros** [Trang 1731 - 1734]: Viết các script VBA (VBScript) tinh vi để thoát khỏi quy trình Office, né tránh phát hiện điểm cuối. Các phương thức:
  - Spawn qua ShellCOM (khởi chạy tiến trình mới qua COM object).
  - Sử dụng XMLDOM để tải và chạy mã ngoài.
  - Sử dụng `WmiPrvse.exe`, Registry Modification, tạo Scheduled Tasks, hoặc tính năng vba-exe của Metasploit.
- **Clearing memory hooks** [Trang 1735 - 1737]: Các hệ thống EDR giám sát bằng cách gắn memory hooks vào các API. Kẻ tấn công dùng debugger (như `x64dbg`) để xác định các hook liên quan tới syscall, sau đó ghi đè/xóa các hook này để phục hồi lại byte gốc trong bộ nhớ, làm mù EDR.
- **Process injection** [Trang 1738 - 1739]: Chèn mã độc vào không gian bộ nhớ của một tiến trình hợp pháp đang chạy. Thường sử dụng các Windows API như: `VirtualAllocEx()` (cấp phát vùng nhớ), `WriteProcessMemory()` (ghi mã độc) và `CreateRemoteThread()` (kích hoạt luồng chạy).
- **Living-Off-The-Land binaries (LoL bins)** [Trang 1740 - 1741]: Sử dụng các công cụ hệ thống hợp pháp, có sẵn (như `rundll32`, `ConfigSecurityPolicy.exe`, `CustomShellHost.exe`) để tải, cài đặt malware (như Deimos C2 agent) mà không bị EDR báo động.
- **CPL side-loading** [Trang 1742 - 1744]: Giả mạo applet của Control Panel (file `.cpl`). Đóng gói shellcode bằng Base64 và nhúng vào file CPL để qua mặt AV. Công cụ: `CPLResourceRunner`.
- **Sử dụng AI/ChatGPT** [Trang 1745 - 1749]: Dùng ChatGPT để liên tục thay đổi mã (mutate) tạo ra phần mềm độc hại đa hình (polymorphic), viết script tự động hóa trích xuất và mã hóa tệp tin, né tránh API theo dõi.
- **Sử dụng mẫu Metasploit (Metasploit Templates)** [Trang 1750 - 1752]: Dùng `msfvenom` tạo payload, sau đó up lên VirusTotal để kiểm tra tỷ lệ bị phát hiện. Chỉnh sửa mã nguồn `template.c` (ví dụ: đổi SCSIZE 4096 thành 4000) và biên dịch lại liên tục cho đến khi AV không phát hiện được.
- **AMSI bypass** [Trang 1753 - 1755]: Vượt qua Windows Antimalware Scan Interface (AMSI) bằng cách:
  - Hạ cấp PowerShell (`powershell -version 2`).
  - Làm rối mã (Obfuscation) bằng cách tách chuỗi.
  - Khai thác lỗi khởi tạo (`AmsiInitFailed`).
  - Hijack bộ nhớ: Hook hàm `AmsiScanBuffer` để luôn trả về giá trị `AMSI_RESULT_CLEAN`.
- **Fast-flux DNS** [Trang 1757 - 1758]: Liên tục thay đổi cực nhanh các địa chỉ IP và tên miền để né các hệ thống blacklist và che giấu vị trí thực sự của C&C Server.

**Các kỹ thuật Bypass Endpoint khác** [Trang 1758 - 1759]:

- **Hosting Phishing Sites:** Đặt server lừa đảo trên các hạ tầng Cloud uy tín (AWS, Google Cloud) để không bị chặn IP.
- **Passing Encoded Commands:** Mã hóa command bằng Base64 hoặc Hex để ẩn đối số truyền vào.
- **Timing-based evasion:** Né AV Sandbox bằng Sleep patching, time bombs (trì hoãn chờ khi hết thời gian quét mới thực thi).
- **Signed Binary Proxy Execution:** Dùng công cụ có chữ ký số hợp lệ để làm proxy chạy mã độc.
- **Shellcode encryption:** Mã hóa shellcode bằng XOR, RC4, AES.
- **Reducing entropy:** Giảm độ hỗn loạn (entropy) của file nhị phân bằng cách nhúng các file ảnh rác, mã rác để lách bộ quét.
- **Disabling Event Tracing for Windows (ETW):** Vá hàm `EtwEventWrite` trong `ntdll.dll` để nó luôn trả về 0 (Success) mà không ghi log.
- **Evading "Mark of Syscall":** Trực tiếp gọi System Calls thay vì qua API chuẩn.
- **Spoofing the thread call stack:** Ghi đè địa chỉ trả về (return address) thành `0x0` khi chạy lệnh `Sleep()` để ẩn dấu vết shellcode trên RAM.
- **In-memory Encryption of Beacon:** Tự động mã hóa XOR shellcode đang nằm trên RAM mỗi khi chuyển về trạng thái ngủ (dormant/sleep), và giải mã khi thức dậy.

## 17. Công cụ né tránh IDS/Firewall (IDS/Firewall Evading Tools) [Trang 1760 - 1762]

- **Traffic IQ Professional** [Trang 1760]: Công cụ kiểm toán (audit) giả lập traffic ứng dụng và traffic tấn công tùy chỉnh để kiểm tra phản ứng và né tránh các firewall, IDS, IPS.
- **Colasoft Packet Builder** [Trang 1761]: Công cụ tạo và tùy chỉnh thủ công các gói tin (IP, TCP, UDP, ARP) phục vụ cho tấn công phân mảnh mạng (fragmentation attacks).
- _(Bổ sung từ nguồn)_ **Các công cụ khác** [Trang 1762]: Nmap, Metasploit, PingRAT, KoviD, Green Tunnel, Hyperion, NetScanTools Pro, CommView, Ostinato, WAN Killer, WireEdit.

## 18. Honeypots (Hũ mật) [Trang 1764 - 1775]

Honeypot là một hệ thống/tài nguyên thông tin được cố tình thiết lập để thu hút, đánh lừa và bẫy những kẻ tấn công mạng. Nó không có giá trị sản xuất thực tế, mọi luồng traffic đi vào đều được coi là có ý đồ xấu.

**Lợi ích và hoạt động chính:**

- **Ghi nhận truy cập cổng (Log port access attempts):** Lưu lại toàn bộ các nỗ lực truy cập vào các cổng của hệ thống.
- **Giám sát phím bấm (Monitor keystrokes):** Ghi lại và theo dõi từng thao tác phím của kẻ tấn công trong một môi trường giả lập (Decoy systems).
- **Cảnh báo sớm về chiến dịch tấn công (Early warnings):** Phát hiện các cuộc thăm dò (probe) để làm tín hiệu cảnh báo sớm trước khi một cuộc tấn công quy mô lớn nhắm vào mạng lõi thực sự xảy ra.

### Các loại Honeypots (Types of Honeypots) [Trang 1765 - 1768]

Honeypots được phân loại dựa trên 3 tiêu chí chính: tiêu chí thiết kế, chiến lược triển khai và công nghệ đánh lừa:

**1. Dựa trên tiêu chí thiết kế (Design criteria):**

- **Low-interaction honeypots (Tương tác thấp)** [Trang 1765]: Chỉ mô phỏng một số lượng giới hạn các dịch vụ và ứng dụng. Không thể bị xâm phạm hoàn toàn, thu thập thông tin ở cấp độ cao như rà quét mạng hoặc hoạt động của worm. Ví dụ: `tiny-ssh-honeypot`, KFSensor (bẫy TCP, UDP, ICMP), Honeytrap (theo dõi TCP/UDP, FTP, TFTP).
- **Medium-interaction honeypots (Tương tác trung bình)** [Trang 1766]: Mô phỏng một hệ điều hành thực tế cũng như các ứng dụng và dịch vụ. Thu thập dữ liệu hữu ích hơn nhưng có nhược điểm là kẻ tấn công có thể nhanh chóng phát hiện ra hành vi bất thường vì nó chỉ phản hồi các lệnh được cấu hình sẵn. Ví dụ: Cowrie (SSH/Telnet honeypot), Honeygrove, Kippo.
- **High-interaction honeypots (Tương tác cao)** [Trang 1766]: Không mô phỏng mà chạy các dịch vụ/phần mềm thực tế dễ bị tổn thương trên một hệ điều hành thật. Có thể bị kẻ tấn công xâm phạm hoàn toàn để theo dõi toàn bộ kỹ thuật và công cụ của chúng. Ví dụ: Honeynet.
- **Pure honeypots (Honeypot thuần túy)** [Trang 1767]: Mô phỏng toàn bộ mạng lưới sản xuất thực tế của tổ chức để kẻ tấn công tiêu tốn thời gian và tài nguyên vào đó thay vì hệ thống thật.

**2. Dựa trên chiến lược triển khai (Deployment strategy)** [Trang 1767]:

- **Production honeypots:** Triển khai bên trong mạng sản xuất cùng với các máy chủ thực. Thường thuộc loại tương tác thấp (low-interaction), thu thập thông tin hạn chế để tìm ra lỗ hổng nội bộ và kẻ tấn công trong tổ chức.
- **Research honeypots:** Là honeypot tương tác cao (high-interaction) do các viện nghiên cứu, chính phủ hoặc quân đội triển khai để thu thập kiến thức chuyên sâu về hành động của kẻ xâm nhập. Không đóng góp trực tiếp vào bảo mật của công ty.

**3. Dựa trên công nghệ đánh lừa (Deception technology)** [Trang 1767 - 1768]:

- **Malware honeypots:** Dùng để bẫy các chiến dịch mã độc. Được giả lập với các lỗ hổng đã biết (như API lỗi thời, giao thức SMBv1 dễ bị tổn thương) và mô phỏng Trojan, virus, backdoor để dụ mã độc tấn công.
- **Database honeypots:** Tạo cơ sở dữ liệu giả dễ bị tấn công SQL injection và database enumeration để lừa kẻ tấn công.
- **Spam honeypots:** Nhắm vào những kẻ gửi thư rác lạm dụng open mail relays và open proxies.
- **Email honeypots (Email traps):** Các địa chỉ email giả được phân tán trên Internet mở và Dark web để bẫy các email độc hại.
- **Spider honeypots (Spider traps):** Bẫy các web crawlers và spiders chuyên trích xuất URL, thông tin liên hệ bằng cách tạo ra các trang web giả mạo.
- **Honeynets:** Mạng lưới gồm nhiều honeypots triển khai trong môi trường ảo hóa cách ly để theo dõi toàn bộ TTPs (Kỹ thuật, Chiến thuật và Quy trình) của kẻ tấn công.

### Công cụ Honeypot (Honeypot Tools) [Trang 1769 - 1770]

Các công cụ bảo mật cho phép ghi log toàn bộ hoạt động của kẻ tấn công:

- **HoneyBOT** [Trang 1769]: Giải pháp honeypot tương tác trung bình (medium interaction) dành cho Windows, dễ sử dụng, tạo môi trường an toàn để chụp và tương tác với lưu lượng không mong muốn.
- **Blumira honeypot software**
- **NeroSwarm Honeypot**
- **Valhala Honeypot**
- **Cowrie**
- **StingBox**

### Phát hiện Honeypot (Detecting Honeypots) [Trang 1771 - 1772]

Kẻ tấn công sử dụng các kỹ thuật sau để tránh sập bẫy:

- **Fingerprint dịch vụ đang chạy (Fingerprinting the Running Service):** Dùng công cụ như Nmap (`nmap -sV -p 80 <target_ip>`) để xem xét sự không nhất quán (discrepancies) giữa phiên bản dịch vụ tự khai báo và hành vi thực tế của nó.
- **Phân tích thời gian phản hồi (Analyzing Response Time):** Honeypots thường có độ trễ cao hoặc không nhất quán do phải xử lý thêm các lớp ghi log và giám sát. Đo lường bằng Ping, Traceroute hoặc lệnh Nmap (`nmap -p 80 --scan-delay 1s --max-retries 5 target_ip`).
- **Kiểm tra MAC để tìm các OUI bất thường (Analyzing MAC Address):** Phân tích địa chỉ MAC để tìm tiền tố OUI (Organizationally Unique Identifier). Sử dụng lệnh (`arp-scan --interface=eth0 --localnet`). Các OUI bất thường hoặc thuộc về các nhà sản xuất máy ảo là dấu hiệu của honeypot.
- **Liệt kê các port mở bất thường (Enumerating Unexpected Open Ports):** Honeypot thường mở nhiều port không điển hình để bẫy. Dùng Nmap quét toàn bộ 65.535 port (`nmap -p- <target_ip>`). Nếu một web server mở thêm port 22, 21 hoặc các port số cao không có mục đích rõ ràng, đó có thể là honeypot.
- **Phân tích cấu hình hệ thống và metadata:** Soi xét kỹ các chi tiết như cấu hình mặc định, banner thông báo lỗi thời (SSH welcome messages, HTTP headers), và sự không nhất quán trong thông tin hệ thống.

### Phát hiện và Vô hiệu hóa Honeypot (Detecting and Defeating Honeypots) [Trang 1773 - 1775]

Các kỹ thuật để xác định và đánh bại cơ sở hạ tầng honeypot bao gồm:

- **Layer 7 tar pits:** Các thực thể bảo mật phản hồi rất chậm đối với các yêu cầu (ví dụ: lệnh SMTP) nhằm làm chậm cuộc tấn công. Phát hiện thông qua độ trễ (latency) của phản hồi.
- **Layer 4 tar pits:** Thao tác ngăn xếp TCP/IP để làm chậm sự lây lan của worm/backdoor (ví dụ: iptables chấp nhận kết nối nhưng chuyển sang kích thước zero-window để chặn nhận dữ liệu). Điển hình là Labrea. Phát hiện bằng cách phân tích kích thước TCP window liên tục bị giảm xuống 0.
- **Layer 2 tar pits:** Ngăn chặn tấn công trong cùng một mạng. Phát hiện bằng cách tìm kiếm các phản hồi có địa chỉ MAC độc nhất là `0:0:f:ff:ff:ff` (hoạt động như một lỗ đen) hoặc phân tích các phản hồi ARP.
- **Honeypot chạy trên VMware:** Phát hiện thông qua địa chỉ MAC. Bằng cách đối chiếu với các dải địa chỉ MAC tiêu chuẩn IEEE dành riêng cho VMWare Inc..
- **Honeyd Honeypot:** Là một honeypot daemon mạng có thể tạo ra hàng ngàn honeypots và phản hồi các lệnh SMTP bằng các phản hồi giả. Kẻ tấn công có thể phát hiện Honeyd bằng phương pháp TCP fingerprinting dựa trên thời gian (hành vi của SYN proxy).
- **User-Mode Linux (UML) Honeypot:** Là phần mềm mã nguồn mở dưới chuẩn GNU dùng để tạo máy ảo. Phát hiện bằng cách kiểm tra các tệp chứa thông tin đặc trưng của UML như `/proc/mounts`, `/proc/interrupts`, và `/proc/cmdline`.
- **Snort_inline Honeypot:** Phiên bản sửa đổi của Snort IDS có khả năng thao tác gói (packet manipulation) và ghi đè rules (rewrite rules) trong iptables. Phát hiện bằng cách phân tích các gói tin bị rớt (như đi vào lỗ đen) hoặc các gói tin gửi đi bị sửa đổi.
- **Fake AP (Access Point giả mạo):** Tạo các khung beacon 802.11b giả mạo với ESSID và BSSID ngẫu nhiên nhưng không tạo ra traffic thực. Phát hiện thông qua việc giám sát traffic mạng.
- **Bait and Switch Honeypots:** Chuyển hướng toàn bộ lưu lượng độc hại tới honeypot ngay khi phát hiện xâm nhập. Kẻ tấn công nhận diện thông qua các thông số TCP/IP cụ thể như RTT (Round-Trip Time), TTL, và TCP timestamp.

### Công cụ phát hiện honeypot (Honeypot Detection Tools) [Trang 1775 - 1776]

- **Send-Safe Honeypot Hunter** [Trang 1775]:
  - Là công cụ chuyên thiết kế để kiểm tra các danh sách proxy HTTPS và SOCKS (SOCKS4, SOCKS5) xem có phải là "honey pots" hay không.
  - Tính năng: Kiểm tra nhiều danh sách proxy từ xa hoặc cục bộ cùng lúc; Có thể upload các tệp "Valid proxies" (proxy hợp lệ) và "All except honeypots" (Tất cả ngoại trừ honeypots) lên FTP; Tự động xử lý theo chu kỳ thời gian định sẵn.
