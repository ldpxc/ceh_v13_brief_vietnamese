## 1. Mạng bot (Botnets) [Trang 1470 - 1476]

Botnet là một mạng lưới khổng lồ các máy tính bị lây nhiễm (zombies) được kẻ tấn công sử dụng để thực hiện các cuộc tấn công tự động qua Internet.

_(Bổ sung từ nguồn)_ **Các mục đích sử dụng botnet** [Trang 1472 - 1473]: Ngoài tấn công DDoS, botnet còn dùng để Spamming, Sniffing traffic (đánh cắp thông tin thẻ tín dụng/mật khẩu, thậm chí cướp botnet khác), Keylogging, Phát tán mã độc mới (Spreading new malware), Gian lận nhấp chuột quảng cáo (Google AdSense abuse), Tấn công mạng IRC chat (clone attacks), Thao túng các cuộc thăm dò ý kiến/game trực tuyến, Đánh cắp danh tính hàng loạt (Mass identity theft qua email mạo danh), Nhồi nhét thông tin xác thực (Credential stuffing), Đào tiền ảo (Cryptocurrency mining).

**Các phương pháp botnet tìm máy dễ bị tổn thương (Scanning Methods)** [Trang 1475 - 1476]:

- **Quét ngẫu nhiên (Random scanning):** Máy bị nhiễm (zombie) thăm dò các địa chỉ IP một cách ngẫu nhiên trong dải mạng đích để kiểm tra lỗ hổng. Phương pháp này tạo ra lưu lượng truy cập lớn ở giai đoạn đầu, nhưng tốc độ lan truyền sẽ giảm dần theo thời gian khi số lượng IP mới còn trống giảm đi.
- **Quét theo danh sách mục tiêu (Hit-list scanning):** Kẻ tấn công thu thập trước một danh sách các máy có khả năng bị tấn công. Sau đó chúng quét danh sách này để tạo "đội quân zombie" (zombie army). Khi tìm thấy một máy dễ tổn thương và lây nhiễm thành công, kẻ tấn công chia đôi danh sách (một nửa do máy cũ quét, một nửa giao cho máy vừa bị lây nhiễm quét). Quá trình lặp lại liên tục giúp số lượng máy bị xâm phạm tăng theo cấp số nhân trong thời gian rất ngắn.
- **Quét theo cấu trúc mạng (Topological scanning):** Sử dụng thông tin thu được từ chính máy đã bị nhiễm (ví dụ: quét tìm các URL trong ổ cứng) để tìm kiếm và nhắm mục tiêu các máy mới. Phương pháp này mang lại kết quả chính xác, hiệu suất tương đương với Hit-list scanning.
- **Quét trong mạng con cục bộ (Local subnet scanning):** Máy bị nhiễm tìm kiếm các mục tiêu mới nằm trong chính mạng cục bộ của nó, đằng sau tường lửa, sử dụng thông tin ẩn trong các địa chỉ cục bộ. Thường được kết hợp với các cơ chế quét khác.
- **Quét hoán vị (Permutation scanning):** Kẻ tấn công chia sẻ một danh sách hoán vị giả ngẫu nhiên của các địa chỉ IP (tạo ra từ một block cipher 32-bit và preselected key). Nếu một máy bị nhiễm trong quá trình quét, việc quét sẽ tiếp tục ngay từ điểm sau máy bị nhiễm đó để tìm mục tiêu mới. Nếu gặp lại một máy đã bị lây nhiễm từ trước, máy quét sẽ khởi động lại từ một điểm xuất phát ngẫu nhiên mới. Giúp tránh việc lây nhiễm lại (reinfection) cùng một mục tiêu và đảm bảo tốc độ quét cực cao.

## 2. Lan truyền mã độc (Malicious code propagation) [Trang 1477 - 1478]

- **Truyền từ nguồn tập trung (Central source propagation)** [Trang 1477]: Kẻ tấn công đặt một bộ công cụ tấn công (attack toolkit) trên một máy chủ trung tâm. Khi tìm thấy một hệ thống có lỗ hổng, chúng ra lệnh cho nguồn trung tâm tự động chuyển một bản sao của toolkit sang máy vừa bị xâm phạm thông qua cơ chế script. Quy trình này lặp lại liên tục và thường dùng các giao thức HTTP, FTP, và RPC.
- **Lan truyền theo chuỗi ngược (Back-chaining propagation)** [Trang 1478]: Kẻ tấn công đặt toolkit trên chính hệ thống của họ. Khi máy tấn công thâm nhập được một máy nạn nhân, nó sử dụng các phương thức đặc biệt để yêu cầu máy nạn nhân tạo kết nối ngược lại và tải tệp công cụ về. Thường sử dụng giao thức Trivial File Transfer Protocol (TFTP).
- **Lan truyền tự trị (Autonomous propagation)** [Trang 1478]: Khác với hai cơ chế trên (cần một nguồn tệp bên ngoài), ở lan truyền tự trị, chính máy chủ đang đi tấn công (attacking host) sẽ trực tiếp chuyển luôn toolkit cho máy nạn nhân mới được tìm thấy ngay tại thời điểm nó xâm nhập thành công (attacker → victim → victim).

## 3. Nghiên cứu trường hợp DDoS (DDoS Case Study) [Trang 1481 - 1483]

**Nghiên cứu trường hợp: HTTP/2 "Rapid Reset" Attack trên Google Cloud**

- Vào tháng 9 năm 2023, nhóm phản hồi DDoS của Google đã ngăn chặn một cuộc tấn công tàn khốc đạt đỉnh 398 triệu yêu cầu mỗi giây (rps), lớn gấp 7.5 lần cuộc tấn công kỷ lục trước đó.
- Cơ chế tấn công: Kẻ tấn công sử dụng kỹ thuật mới "Rapid Reset", khai thác lỗ hổng (CVE-2023-44487) của tính năng stream multiplexing trong giao thức HTTP/2 (tính năng cho phép quản lý tới 100 luồng sống qua một kết nối TCP duy nhất). Kẻ tấn công liên tục gửi một loạt các yêu cầu luồng, sau đó ngay lập tức ra lệnh "reset" (hủy) chúng, gây gián đoạn nghiêm trọng cho các máy chủ mục tiêu.
- Khắc phục: Google phối hợp với các nhà cung cấp đám mây khác sử dụng thông tin tình báo đe dọa (threat intelligence) theo thời gian thực và năng lực biên (edge capacity) để chặn thành công.

## 4. Các loại tấn công từ chối dịch vụ (DoS/DDoS Attack Categories) [Trang 1485 - 1487]

### 4.1. Tấn công dung lượng (Volumetric attacks) [Trang 1485 - 1486]

- Làm cạn kiệt băng thông mạng. Độ lớn của cuộc tấn công được đo bằng bits-per-second (bps).
- Thường nhắm vào các giao thức không giữ trạng thái (stateless) và không có tính năng tránh tắc nghẽn như NTP, DNS và SSDP. Một máy đơn lẻ không thể tạo đủ yêu cầu nên kẻ tấn công phải huy động botnet.
- **Flood attack (tấn công tràn):** Đội quân zombie gửi lượng lớn traffic trực tiếp tới hệ thống nạn nhân để làm cạn kiệt băng thông.
- **Amplification attack (tấn công khuếch đại):** Kẻ tấn công lợi dụng việc gửi tin nhắn tới địa chỉ IP broadcast/reflector. Phương pháp này khuếch đại lưu lượng độc hại dội về, vắt kiệt băng thông hệ thống nạn nhân.
- _(Các kỹ thuật tiêu biểu)_: UDP flood, ICMP flood, Ping of Death, Smurf, Pulse wave, Zero-day, NTP amplification.

### 4.2. Tấn công giao thức (Protocol attacks) [Trang 1486]

- Không nhằm làm cạn băng thông mà tập trung tấn công và làm cạn kiệt bảng trạng thái kết nối (connection state tables) có trên các thiết bị hạ tầng mạng như tường lửa, load balancers, và application servers.
- Khiến thiết bị không cho phép kết nối mới vì phải chờ các kết nối cũ đáo hạn (expire) hoặc đóng lại.
- Độ lớn được đo bằng packets-per-second (pps) hoặc connections per second (cps).
- _(Các kỹ thuật tiêu biểu)_: SYN flood, Fragmentation attack, Spoofed session flood, ACK flood, TCP state exhaustion attack, TCP SACK panic attack.

### 4.3. Tấn công lớp ứng dụng (Application layer attacks) [Trang 1487]

- Khai thác lỗ hổng trong giao thức lớp ứng dụng hoặc bản thân ứng dụng. Phá hủy ứng dụng/dịch vụ bằng cách mở các kết nối và giữ chúng mở cho tới khi không thể kết nối thêm.
- Không yêu cầu băng thông lớn như tấn công volumetric. Rất khó phát hiện và ngăn chặn do lưu lượng trông có vẻ hợp lệ (sau khi TCP đã thiết lập).
- Độ lớn được đo bằng requests-per-second (rps).
- Phương thức: Gây tràn bộ đệm (buffer overflow) để ghi đè dữ liệu; làm tràn ứng dụng web bằng traffic có vẻ hợp pháp; khóa quyền truy cập người dùng bằng nhiều lần đăng nhập sai (invalid login attempts); làm tắc nghẽn cơ sở dữ liệu bằng các truy vấn SQL độc hại.
- _(Các kỹ thuật tiêu biểu)_: HTTP GET/POST attack, Slowloris (chỉ gửi yêu cầu HTTP một phần/nửa mở để giữ kết nối), UDP application layer flood, DDoS extortion attack (Tống tiền bằng DDoS).

## 5. Các Kỹ thuật DoS/DDoS (DoS/DDoS Attack Techniques)

- **UDP flood (UDP flood attack)** [Trang 1489]: Kẻ tấn công gửi các gói UDP giả mạo (spoofed UDP packets) ở tốc độ rất cao tới các cổng ngẫu nhiên trên máy chủ mục tiêu bằng cách sử dụng một dải IP nguồn lớn. Máy chủ liên tục kiểm tra các ứng dụng không tồn tại ở các cổng đó và trả về thông báo lỗi ICMP “Destination Unreachable”. Làm cạn kiệt tài nguyên và băng thông cho đến khi hệ thống ngoại tuyến.
- **ICMP flood (ICMP flood attack)** [Trang 1490 - 1491]: Kẻ tấn công gửi lượng lớn ICMP Echo requests trực tiếp hoặc qua các mạng phản xạ. Băng thông kết nối bị bão hòa khiến hệ thống không thể phản hồi các yêu cầu TCP/IP hợp lệ. _(Cách phòng chống)_: Đặt ngưỡng giới hạn, ví dụ mặc định 1000 packets/s.
- **Ping of Death (PoD)** [Trang 1492]: Kẻ tấn công gửi gói tin malformed hoặc vượt kích thước hợp lệ (oversized packets) bằng lệnh ping đơn giản. Ví dụ: gửi gói 65.538 byte, vượt quá giới hạn 65.535 byte do chuẩn RFC 791 IP quy định. Quá trình lắp ráp lại (reassembly) tại máy đích sẽ gây sập hệ thống (crash).
- **Smurf attack** [Trang 1492]: Kẻ tấn công giả mạo địa chỉ IP nguồn thành IP của nạn nhân và gửi một lượng lớn gói ICMP ECHO request tới một mạng quảng bá (IP broadcast network). Mọi host trên mạng đó sẽ đồng loạt trả lời về máy nạn nhân, gây sập hệ thống.
- **Pulse-wave DDoS** [Trang 1493]: Gửi các xung gói tin theo chu kỳ (ví dụ: các đợt bùng nổ traffic cực lớn cách nhau mỗi 10 phút, mỗi xung có thể đạt 300 Gbps hoặc hơn). Mục đích là làm hệ thống kiệt quệ băng thông toàn bộ và khiến việc phục hồi vô cùng khó khăn.
- **Zero-day DDoS** [Trang 1493]: Khai thác các lỗ hổng DoS chưa có bản vá hoặc chưa có cơ chế phòng thủ hiệu quả. Kẻ tấn công chủ động chặn tài nguyên và đánh cắp dữ liệu trước khi nạn nhân kịp nhận ra và tung ra bản vá.
- **NTP amplification (NTP amplification attack)** [Trang 1494 - 1495]: Kẻ tấn công dùng botnet gửi gói UDP với IP nguồn giả mạo (IP của nạn nhân) tới máy chủ NTP có bật lệnh `monlist`. Lệnh này kích hoạt phản hồi một danh sách lớn các máy khách (large response packets), làm ngập lụt mạng nạn nhân.
  - _Ví dụ lệnh kiểm tra_: `nmap -sU -pU:123 -Pn -n --script=ntp-monlist <target>`
- **SYN flood (SYN flood attack)** [Trang 1496 - 1498]: Lạm dụng cơ chế bắt tay 3 bước (three-way handshake) của TCP. Kẻ tấn công gửi lượng lớn SYN với IP nguồn giả. Máy chủ trả lời bằng SYN/ACK và chờ gói ACK cuối cùng (lưu trong "listen queue" ít nhất 75 giây). Hàng đợi đầy khiến máy chủ không thể nhận kết nối mới.
  - _(Bổ sung từ nguồn)_ Có các biến thể khác như SYN-ACK Flood và ACK / PUSH ACK Flood.
- **Fragmentation attack (Tấn công phân mảnh)** [Trang 1499]: Gửi lượng lớn gói tin bị phân mảnh (ví dụ gói ~1500 byte) với nội dung ngẫu nhiên khiến nạn nhân cạn kiệt tài nguyên khi cố ghép lại. Vì giao thức cho phép phân mảnh, kỹ thuật này thường dễ dàng qua mặt thiết bị mạng, firewall, và IDS/IPS.
- **Spoofed session flood** [Trang 1500]: Giả mạo phiên TCP bằng cách mang theo nhiều gói SYN, ACK, và RST hoặc FIN để qua mặt tường lửa. Bao gồm:
  - **Multiple SYN-ACK Spoofed:** Gửi nhiều SYN và ACK kèm RST/FIN.
  - **Multiple ACK Spoofed:** Bỏ qua hoàn toàn SYN, chỉ gửi ACK và RST/FIN (tỷ lệ bị firewall phát hiện rất thấp).
- **HTTP GET/POST timed header (HTTP Flood)** [Trang 1501 - 1502]: Tấn công Lớp 7. Dùng header trì hoãn (time-delayed HTTP header) để duy trì kết nối HTTP (GET) hoặc gửi nội dung thông điệp không hoàn chỉnh (POST) khiến máy chủ web phải chờ đợi, làm cạn tài nguyên.
  - _(Bổ sung từ nguồn)_ Các biến thể: Single-Session HTTP Flood, Single-Request HTTP Flood, Recursive HTTP GET Flood (thu thập danh sách trang web và lặp lại thao tác tải ngầm), Random Recursive GET Flood.
- **Slowloris** [Trang 1501 - 1503]: Kẻ tấn công gửi các yêu cầu HTTP một phần (không hoàn chỉnh) để giữ cho nhiều kết nối ở trạng thái nửa mở (half-open). Máy chủ chờ đợi đến khi cạn kiệt nhóm kết nối đồng thời (concurrent connection pool).
- **UDP application layer flood attack** [Trang 1503]: Lợi dụng các giao thức lớp ứng dụng chạy trên nền UDP như CHARGEN, SNMPv2, QOTD, RPC, SSDP, CLDAP, TFTP, NetBIOS, Quake/Steam protocol, VoIP.
- **Multi-vector DDoS** [Trang 1504]: Kết hợp đồng thời hoặc tuần tự các phương pháp tấn công Volumetric (Dung lượng) + Protocol (Giao thức) + Application layer (Lớp ứng dụng) để làm rối loạn bộ phận IT, phân tán sự tập trung khỏi giải pháp phòng thủ chính.
- **Peer-to-peer DDoS** [Trang 1505 - 1506]: Không sử dụng botnet. Kẻ tấn công khai thác lỗi trên giao thức DC++ (Direct Connect), ra lệnh cho hàng ngàn máy khách đang chia sẻ file P2P ngắt kết nối mạng P2P và đồng loạt kết nối tới website của nạn nhân.
- **Permanent Denial-of-Service (PDoS / Phlashing)** [Trang 1507]: Gây hỏng phần cứng vĩnh viễn (gọi là "bricking a system"). Kẻ tấn công gửi bản cập nhật firmware giả mạo, chứa lỗi (qua email, mạng xã hội, video). Khi nạn nhân cài đặt, thiết bị mạng (router, máy in) bị phá hủy hoặc bị chiếm quyền điều khiển từ xa hoàn toàn.
- **TCP SACK panic** [Trang 1508]: Khai thác lỗ hổng tràn số nguyên (integer overflow) trên bộ đệm socket (SKB) của Linux. Kẻ tấn công gửi chuỗi gói SACK với giá trị MSS (Maximum segment size) cực thấp (48 bytes), khiến số lượng phân đoạn cần truyền lại vượt quá giới hạn 17 phân đoạn của bộ đệm, dẫn tới lỗi kernel panic và sập hệ thống.
- **Distributed Reflection DDoS (DRDoS / Spoofed attack)** [Trang 1509 - 1510]: Tấn công giả mạo nguồn thông qua hàng loạt máy trung gian (zombies) và máy phản xạ (reflectors). Gửi TCP SYN (với IP nguồn là máy nạn nhân) tới reflector, reflector tin rằng nạn nhân yêu cầu kết nối nên đồng loạt dội ngược gói SYN/ACK về phía nạn nhân với băng thông khổng lồ.
- **Ransom DDoS (RDDoS)** [Trang 1510 - 1511]: Tấn công tống tiền. Kẻ tấn công gửi thư đe dọa (có thể kèm theo một đợt DDoS mẫu bằng botnet) yêu cầu trả tiền chuộc bằng tiền ảo để không bị đánh sập hệ thống.

## 6. Bộ công cụ tấn công (Attack Toolkits) [Trang 1512 - 1514]

- **ISB (I'm So Bored):** Tiện ích phần mềm hỗ trợ tạo flood HTTP, UDP, TCP và ICMP. Cung cấp quyền truy cập một cú nhấp chuột vào các lệnh mạng (WHOIS, netstat, traceroute, ping) giúp kẻ tấn công dễ dàng khám phá mục tiêu.
- **UltraDDOS-v2:** Cung cấp giao diện đồ họa (GUI) đơn giản để kẻ tấn công nhập IP đích, số cổng và số lượng gói tin muốn truyền.
- _(Bổ sung từ nguồn)_ **HOIC (High Orbit Ion Cannon):** Tấn công DDoS phânát tán thông qua việc tuyển mộ "tình nguyện viên" tải công cụ qua link ẩn.
- _(Bổ sung từ nguồn)_ **LOIC (Low Orbit Ion Cannon)**, **Packet Flooder Tool**.
- **HULK (HTTP Unbearable Load King)**.
- **Slowloris** & **UFO-Net**.

## 7. Biện pháp giảm nhẹ / Phát hiện (Detection & Countermeasures) [Trang 1516 - 1518, 1521, 1525, 1527]

### 7.1. Các kỹ thuật phát hiện (Detection Techniques) [Trang 1516 - 1517]

- **Activity profiling (Lập hồ sơ hoạt động):** Dựa trên tốc độ gói tin trung bình. Nếu có sự gia tăng mức độ hoạt động giữa các cụm luồng mạng (network flow clusters) hoặc tăng số lượng cụm riêng biệt, đó là dấu hiệu tấn công. Sử dụng phương pháp tính toán Entropy để đo lường tính ngẫu nhiên.
- **Sequential change-point detection (Phát hiện điểm thay đổi tuần tự):** Lọc lưu lượng theo IP, cổng và giao thức, vẽ biểu đồ lưu lượng theo thời gian. Sử dụng thuật toán CUSUM (Cumulative Sum) để xác định độ lệch so với trung bình, giúp phát hiện các cuộc tấn công và hoạt động quét của worm.
- **Wavelet-based signal analysis (Phân tích tín hiệu dựa trên Wavelet):** Phân tích lưu lượng mạng dưới dạng các thành phần phổ/tần số (spectral components). Lọc tín hiệu đầu vào khỏi tiếng ồn xung quanh. Lưu lượng bình thường có tần số thấp, khi bị tấn công, các thành phần tần số cao sẽ tăng đột biến.

### 7.2. Các chiến lược giảm nhẹ & phòng thủ (Mitigation Strategies) [Trang 1518, 1521, 1525]

- **Absorbing the Attack (Hấp thụ cuộc tấn công):** Chuẩn bị trước dung lượng bổ sung dồi dào để hứng chịu lưu lượng tấn công.
- **Degrading Services (Giảm cấp dịch vụ):** Xác định và tắt các dịch vụ không thiết yếu, chỉ duy trì các chức năng quan trọng nhất để hệ thống sống sót.
- **Shutting Down the Services:** Đóng băng mọi dịch vụ cho đến khi cuộc tấn công lắng xuống.
- **Load Balancing (Cân bằng tải):** Tăng băng thông và sao chép (replicate) máy chủ trong kiến trúc đa máy chủ để tạo tính năng bảo vệ dự phòng (failsafe protection).
- **Throttling (Điều tiết):** Thiết lập logic bộ định tuyến (ví dụ: min-max fair server-centric router) để giới hạn lưu lượng đến ở mức an toàn.
- **Drop Requests (Hủy yêu cầu):** Yêu cầu máy khách giải quyết các "câu đố khó" (puzzle) tốn bộ nhớ/CPU trước khi tiếp tục (CAPTCHA/Client puzzle), giúp chặn đứng mạng lưới zombie.
- _(Bổ sung)_ **Egress / Ingress Filtering:** Lọc gói tin IP đi ra và đi vào mạng để ngăn chặn các gói tin có địa chỉ nguồn giả mạo (spoofed addresses).
- _(Bổ sung)_ **TCP Intercept & Rate Limiting:** Dùng router chặn và xác thực kết nối TCP SYN để chống SYN flood; kiểm soát tỷ lệ traffic inbound/outbound.

### 7.3. Ghi nhận pháp y sau tấn công (Post-Attack Forensics) [Trang 1527]

- **Traffic Pattern Analysis:** Phân tích đặc điểm độc nhất của lưu lượng tấn công để tinh chỉnh bộ lọc và cập nhật kỹ thuật điều tiết (throttling).
- **Packet Traceback:** Lần ngược dấu vết gói tin về nguồn thực sự (tương tự dịch ngược) để chặn các cuộc tấn công trong tương lai.
- **Event Log Analysis:** Lưu trữ logs của router, firewall, IDS và honeypot để phục vụ điều tra pháp y.

## 8. Các giải pháp né tránh / Phát hiện bằng Honeypots [Trang 1523 - 1524]

- **Sử dụng Honeypots (Deflect Attacks):** Đây là các hệ thống thiết lập với mức bảo mật thấp một cách cố ý nhằm thu hút kẻ tấn công (enticement). Nó đóng vai trò "mồi nhử" để thu thập thông tin về công cụ, chiến thuật của hacker mà không làm nguy hại tới hệ thống thật. Phương pháp "Defense-in-depth" kết hợp với IPsec để chuyển hướng traffic độc hại vào các honeypots.
  - Có hai dạng: **Low-interaction honeypots** (tương tác thấp) và **High-interaction honeypots** (tương tác cao - như Honeynets, mô phỏng toàn bộ mạng).
- **Blumira Honeypot Software:** Một loại công nghệ đánh lừa (deception technology) giúp các chuyên gia bảo mật phát hiện sớm nỗ lực truy cập trái phép và chuyển động ngang (lateral movement) của kẻ tấn công. Khi có vi phạm, nó lập tức chặn IP nguồn tại tầng switch hoặc firewall.
- _(Bổ sung các công cụ Honeypot khác từ nguồn)_: **KFSensor**, **Valhala Honeypot**, **Cowrie**, **HoneyHTTPD**, **StingBox**.
