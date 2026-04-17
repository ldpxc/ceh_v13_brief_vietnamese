## 0. Khái niệm và Tổ chức (Concepts & Syndicates)

**Khái niệm DoS/DDoS (DoS/DDoS Concepts) [Trang 1467 - 1469]:**

- **Tấn công DoS (Denial-of-Service):** Là cuộc tấn công vào máy tính hoặc mạng làm giảm, hạn chế hoặc ngăn cản quyền truy cập vào tài nguyên hệ thống của người dùng hợp pháp. Kẻ tấn công làm ngập lụt hệ thống nạn nhân bằng các yêu cầu dịch vụ hoặc lưu lượng truy cập không hợp lệ để làm quá tải tài nguyên.
- **Mục tiêu của DoS:** Ngăn chặn người dùng hợp pháp sử dụng hệ thống, thay vì giành quyền truy cập trái phép hoặc làm hỏng dữ liệu. Các hình thức bao gồm: Tiêu thụ băng thông/tài nguyên, phá hủy vật lý các thành phần mạng, hoặc làm hỏng cấu trúc lập trình/tệp tin.
  - **Các ví dụ về các loại hình tấn công DoS (Examples for types of DoS attacks):**
    - Làm ngập lụt hệ thống của nạn nhân với lượng lưu lượng truy cập lớn hơn khả năng xử lý của nó.
    - Làm ngập lụt một dịch vụ (ví dụ: Internet Relay Chat - IRC) với nhiều sự kiện hơn mức nó có thể xử lý.
    - Làm sập ngăn xếp TCP/IP (Crashing a TCP/IP stack) bằng cách gửi các gói tin bị hỏng (corrupt packets).
    - Làm sập một dịch vụ bằng cách tương tác với nó theo một cách không lường trước được.
    - Làm treo hệ thống (Hanging a system) bằng cách đẩy nó vào một vòng lặp vô hạn (infinite loop).
    - Tác động của DoS (Impact of DoS): Bao gồm việc làm giảm uy tín (loss of goodwill), gián đoạn mạng (network outages), thiệt hại tài chính (financial losses), và gián đoạn hoạt động (operational disruptions).
    - Mục tiêu chính của DDoS: Mục tiêu đầu tiên của một cuộc tấn công DDoS là giành quyền truy cập quản trị (administrative access) trên càng nhiều hệ thống càng tốt. Kẻ tấn công sử dụng các kịch bản tùy chỉnh để xác định các hệ thống dễ tổn thương, sau đó tải lên và chạy phần mềm DDoS trên các hệ thống này (tạo botnet) để chuẩn bị khởi chạy tấn công.
- **Tấn công DDoS (Distributed Denial-of-Service):** Là một cuộc tấn công DoS quy mô lớn, được phối hợp và khởi chạy gián tiếp thông qua nhiều máy tính bị xâm nhập (botnets/zombies). Máy chủ bị tấn công gọi là "nạn nhân chính" (primary victim), còn các máy bị xâm nhập dùng để tấn công gọi là "nạn nhân phụ" (secondary victims).

**Tổ chức tội phạm mạng (Organized Cyber Crime Syndicates) [Trang 1471]:**
Tội phạm mạng hiện nay hoạt động theo mô hình phân cấp, có chia sẻ doanh thu giống như các tập đoàn lớn. Cấu trúc bao gồm:

- **Criminal Boss (Ông trùm):** Đóng vai trò là doanh nhân, không trực tiếp phạm tội.
- **Underboss (Phó trùm):** Cung cấp Trojan và quản lý máy chủ C&C cùng cơ sở dữ liệu toolkit.
- **Campaign Manager (Quản lý chiến dịch):** Sở hữu các mạng lưới liên kết (Affiliation Networks) để triển khai tấn công và đánh cắp dữ liệu.
- **Attackers / Affiliates (Kẻ tấn công / Chi nhánh):** Phân phối mã độc trên các trang web.
- **Stolen Data Reseller (Người bán lại dữ liệu):** Bán dữ liệu đã đánh cắp được.
- **Cybercriminal service suppliers (Nhà cung cấp dịch vụ mạng tội phạm):** Là một phần của mạng lưới tội phạm, chuyên cung cấp các dịch vụ như phát triển mã độc, dịch vụ lưu trữ miễn nhiễm (bulletproof hosting), tạo các mã khai thác trình duyệt (browser exploits), mã hóa và đóng gói (encryption and packing).

## 1. Mạng bot (Botnets) [Trang 1470 - 1476]

Botnet là một mạng lưới khổng lồ các máy tính bị lây nhiễm (zombies) được kẻ tấn công sử dụng để thực hiện các cuộc tấn công tự động qua Internet.

- Có nhiều loại bot khác nhau như Internet bots, IRC bots, và chatter bots. Các ví dụ về IRC bots bao gồm: Cardinal, Sopel, Eggdrop, và EnergyMech.

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

**Sử dụng thiết bị di động làm Botnet để khởi chạy DDoS [Trang 1481]:**
Các thiết bị Android không được bảo mật đang trở thành mục tiêu chính để kẻ tấn công mở rộng mạng lưới botnet.

- **Phương thức lây nhiễm:** Ứng dụng độc hại trên Google Play Store hoặc thông qua tải xuống ẩn (drive-by downloads).
- **Cách thức hoạt động:** Kẻ tấn công nhúng (binds) máy chủ APK độc hại vào một gói ứng dụng Android hợp pháp, mã hóa nó, gỡ bỏ các tính năng không mong muốn và tung lên các chợ ứng dụng bên thứ ba.
- Khi người dùng bị lừa tải xuống và cài đặt, kẻ tấn công giành toàn quyền kiểm soát thiết bị, biến nó thành công cụ để thực hiện tấn công DDoS và tiêm nhiễm web (web injections).
- **Tin tặc quảng cáo các liên kết để tải xuống Botnet (Hackers Advertise Links for Downloading Botnets)** [Trang 1479]: Tin tặc quảng cáo botnet trên các blog, công cụ tìm kiếm, trang mạng xã hội, email, v.v. bằng các liên kết tải xuống. Chúng cũng sử dụng các bản cập nhật và cảnh báo bảo mật giả mạo (như thông báo virus hoặc yêu cầu cập nhật phần mềm) để lừa nạn nhân tải xuống phần mềm độc hại. Mục đích là để lây lan nhanh chóng botnet và gia tăng quy mô của mạng lưới tấn công.

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
- _(Các kỹ thuật tiêu biểu)_: UDP flood, ICMP flood, Ping of Death, Smurf, Pulse wave, Zero-day, NTP amplification, **Malformed IP packet flood attack**, **Spoofed IP packet flood attack**.

### 4.2. Tấn công giao thức (Protocol attacks) [Trang 1486]

- Không nhằm làm cạn băng thông mà tập trung tấn công và làm cạn kiệt bảng trạng thái kết nối (connection state tables) có trên các thiết bị hạ tầng mạng như tường lửa, load balancers, và application servers.
- Khiến thiết bị không cho phép kết nối mới vì phải chờ các kết nối cũ đáo hạn (expire) hoặc đóng lại.
- Độ lớn được đo bằng packets-per-second (pps) hoặc connections per second (cps).
- _(Các kỹ thuật tiêu biểu)_: SYN flood, Fragmentation attack, Spoofed session flood, ACK flood, TCP state exhaustion attack, TCP SACK panic attack, **TCP connection flood attack**, **RST attack**.

### 4.3. Tấn công lớp ứng dụng (Application layer attacks) [Trang 1487]

- Khai thác lỗ hổng trong giao thức lớp ứng dụng hoặc bản thân ứng dụng. Phá hủy ứng dụng/dịch vụ bằng cách mở các kết nối và giữ chúng mở cho tới khi không thể kết nối thêm.
- Không yêu cầu băng thông lớn như tấn công volumetric. Rất khó phát hiện và ngăn chặn do lưu lượng trông có vẻ hợp lệ (sau khi TCP đã thiết lập).
- Độ lớn được đo bằng requests-per-second (rps).
- Phương thức: Gây tràn bộ đệm (buffer overflow) để ghi đè dữ liệu; làm tràn ứng dụng web bằng traffic có vẻ hợp pháp; khóa quyền truy cập người dùng bằng nhiều lần đăng nhập sai (invalid login attempts); làm tắc nghẽn cơ sở dữ liệu bằng các truy vấn SQL độc hại.
- _(Các kỹ thuật tiêu biểu)_: HTTP GET/POST attack, Slowloris (chỉ gửi yêu cầu HTTP một phần/nửa mở để giữ kết nối), UDP application layer flood, DDoS extortion attack (Tống tiền bằng DDoS).

## 5. Các Kỹ thuật DoS/DDoS (DoS/DDoS Attack Techniques)

- **UDP flood (UDP flood attack)** [Trang 1489]: Kẻ tấn công gửi các gói UDP giả mạo (spoofed UDP packets) ở tốc độ rất cao tới các cổng ngẫu nhiên trên máy chủ mục tiêu bằng cách sử dụng một dải IP nguồn lớn. Máy chủ liên tục kiểm tra các ứng dụng không tồn tại ở các cổng đó và trả về thông báo lỗi ICMP “Destination Unreachable”. Làm cạn kiệt tài nguyên và băng thông cho đến khi hệ thống ngoại tuyến.
- **ICMP flood (ICMP flood attack)** [Trang 1490 - 1491]: Kẻ tấn công gửi lượng lớn ICMP Echo requests trực tiếp hoặc qua các mạng phản xạ. Băng thông kết nối bị bão hòa khiến hệ thống không thể phản hồi các yêu cầu TCP/IP hợp lệ. _(Cách phòng chống)_: Đặt ngưỡng giới hạn, ví dụ mặc định 1000 packets/s.
  - Khi ngưỡng ICMP bị vượt quá (mặc định là 1000 gói/giây), bộ định tuyến sẽ từ chối các yêu cầu ICMP echo tiếp theo từ tất cả các địa chỉ trong cùng một vùng bảo mật (security zone) trong phần còn lại của giây hiện tại cũng như giây tiếp theo.
- **Ping of Death (PoD)** [Trang 1492]: Kẻ tấn công gửi gói tin malformed hoặc vượt kích thước hợp lệ (oversized packets) bằng lệnh ping đơn giản. Ví dụ: gửi gói 65.538 byte, vượt quá giới hạn 65.535 byte do chuẩn RFC 791 IP quy định. Quá trình lắp ráp lại (reassembly) tại máy đích sẽ gây sập hệ thống (crash).
- **Smurf attack** [Trang 1492]: Kẻ tấn công giả mạo địa chỉ IP nguồn thành IP của nạn nhân và gửi một lượng lớn gói ICMP ECHO request tới một mạng quảng bá (IP broadcast network). Mọi host trên mạng đó sẽ đồng loạt trả lời về máy nạn nhân, gây sập hệ thống.
- **Pulse-wave DDoS** [Trang 1493]: Gửi các xung gói tin theo chu kỳ (ví dụ: các đợt bùng nổ traffic cực lớn cách nhau mỗi 10 phút, mỗi xung có thể đạt 300 Gbps hoặc hơn). Mục đích là làm hệ thống kiệt quệ băng thông toàn bộ và khiến việc phục hồi vô cùng khó khăn.
- **Zero-day DDoS** [Trang 1493]: Khai thác các lỗ hổng DoS chưa có bản vá hoặc chưa có cơ chế phòng thủ hiệu quả. Kẻ tấn công chủ động chặn tài nguyên và đánh cắp dữ liệu trước khi nạn nhân kịp nhận ra và tung ra bản vá.
- **NTP amplification (NTP amplification attack)** [Trang 1494 - 1495]: Kẻ tấn công dùng botnet gửi gói UDP với IP nguồn giả mạo (IP của nạn nhân) tới máy chủ NTP có bật lệnh `monlist`. Lệnh này kích hoạt phản hồi một danh sách lớn các máy khách (large response packets), làm ngập lụt mạng nạn nhân.
  - _Ví dụ lệnh kiểm tra_: `nmap -sU -pU:123 -Pn -n --script=ntp-monlist <target>`
  - _(Biện pháp phòng chống)_ [Trang 1495]: Bảo mật và củng cố cấu hình máy chủ NTP để ngăn chặn việc khai thác lỗ hổng monlist. Giới hạn kiểm soát luồng (flow control) trong máy chủ NTP. Thường xuyên giám sát mạng để phát hiện các hành vi bất thường. Triển khai kiến trúc mạng Zero-trust. Sử dụng tường lửa để lọc các yêu cầu tới máy chủ NTP.
- **SYN flood (SYN flood attack)** [Trang 1496 - 1498]: Lạm dụng cơ chế bắt tay 3 bước (three-way handshake) của TCP. Kẻ tấn công gửi lượng lớn SYN với IP nguồn giả. Máy chủ trả lời bằng SYN/ACK và chờ gói ACK cuối cùng (lưu trong "listen queue" ít nhất 75 giây). Hàng đợi đầy khiến máy chủ không thể nhận kết nối mới.
  - _(Bổ sung từ nguồn)_ Có các biến thể khác như SYN-ACK Flood và ACK / PUSH ACK Flood.
  - _(Biện pháp phòng chống SYN Flood)_ [Trang 1498]: Lọc gói tin (Packet filtering), cấu hình tính năng **SYN cookies** và **SynAttackProtect**. Quản trị viên cũng có thể tinh chỉnh TCP/IP stack: giảm thời gian chờ (time-out) của kết nối đang ở trạng thái “SYN RECEIVED”, giảm số lần truyền lại (retransmissions) gói ACK đầu tiên hoặc tắt hoàn toàn tính năng truyền lại.
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
  - _(Biện pháp phòng chống)_: Tấn công Peer-to-peer DDoS có thể được giảm thiểu bằng cách chỉ định các cổng cụ thể cho giao tiếp peer-to-peer. Ví dụ, việc chỉ định cổng 80 để không cho phép giao tiếp peer-to-peer sẽ giảm thiểu khả năng xảy ra các cuộc tấn công vào trang web.
- **Permanent Denial-of-Service (PDoS / Phlashing)** [Trang 1507]: Gây hỏng phần cứng vĩnh viễn (gọi là "bricking a system"). Kẻ tấn công gửi bản cập nhật firmware giả mạo, chứa lỗi (qua email, mạng xã hội, video). Khi nạn nhân cài đặt, thiết bị mạng (router, máy in) bị phá hủy hoặc bị chiếm quyền điều khiển từ xa hoàn toàn.
- **TCP SACK panic** [Trang 1508]: Khai thác lỗ hổng tràn số nguyên (integer overflow) trên bộ đệm socket (SKB) của Linux. Kẻ tấn công gửi chuỗi gói SACK với giá trị MSS (Maximum segment size) cực thấp (48 bytes), khiến số lượng phân đoạn cần truyền lại vượt quá giới hạn 17 phân đoạn của bộ đệm, dẫn tới lỗi kernel panic và sập hệ thống.
  - Vì lỗ hổng nằm ở ngăn xếp hạt nhân (kernel stack), kẻ tấn công cũng có thể thực hiện cuộc tấn công này nhắm vào các bộ chứa (containers) và máy ảo (virtual machines).
  - _(Biện pháp phòng chống)_: Triển khai vá lỗ hổng (vulnerability patching). Thiết lập quy tắc tường lửa (firewall rule) để chặn các gói tin yêu cầu có giá trị MSS thấp nhất.
- **Distributed Reflection DDoS (DRDoS / Spoofed attack)** [Trang 1509 - 1510]: Tấn công giả mạo nguồn thông qua hàng loạt máy trung gian (zombies) và máy phản xạ (reflectors). Gửi TCP SYN (với IP nguồn là máy nạn nhân) tới reflector, reflector tin rằng nạn nhân yêu cầu kết nối nên đồng loạt dội ngược gói SYN/ACK về phía nạn nhân với băng thông khổng lồ.
  - _(Biện pháp phòng chống)_: Tắt dịch vụ Character Generator Protocol (CHARGEN) để ngăn chặn phương thức tấn công này. Liên tục tải xuống các bản cập nhật và bản vá mới nhất cho máy chủ.
- **Ransom DDoS (RDDoS)** [Trang 1510 - 1511]: Tấn công tống tiền. Kẻ tấn công gửi thư đe dọa (có thể kèm theo một đợt DDoS mẫu bằng botnet) yêu cầu trả tiền chuộc bằng tiền ảo để không bị đánh sập hệ thống.
  - _(Biện pháp phòng chống)_: Triển khai các công cụ phòng thủ DDoS hiệu quả. Báo cáo ngay cho các cơ quan thực thi pháp luật và đội ngũ bảo mật sau khi nhận được thư tống tiền. Thường xuyên đánh giá mức độ chấp nhận rủi ro của tài sản (risk tolerance). Triển khai các chiến lược giảm nhẹ như BGP/DNS swing và dịch vụ bảo vệ luôn bật (always-on protection service).

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
  - _(Chi tiết lợi ích Egress Filtering)_: Ngay cả khi một máy chủ web dính lỗ hổng zero-day, việc bật lọc Egress có thể cứu vãn tính toàn vẹn của hệ thống bằng cách ngăn chặn máy chủ thiết lập kết nối ngược lại (connection back) với kẻ tấn công, từ đó làm hạn chế hiệu quả của nhiều payload và ngăn kẻ tấn công truy cập sâu hơn vào mạng.
  - _(Chi tiết lợi ích Ingress Filtering)_: Có thể gián tiếp chống lại nhiều loại hình lạm dụng mạng bằng cách làm cho lưu lượng Internet có thể truy xuất được về nguồn gốc thực sự. Nó bảo vệ chống lại các cuộc tấn công tràn ngập (flooding attacks) xuất phát từ các tiền tố hợp lệ (địa chỉ IP) và cho phép theo dấu người khởi tạo thực sự.
- _(Bổ sung)_ **TCP Intercept & Rate Limiting:** Dùng router chặn và xác thực kết nối TCP SYN để chống SYN flood; kiểm soát tỷ lệ traffic inbound/outbound.
  Kỹ thuật phòng thủ mạng Botnet (Techniques to Defend against Botnets) [Trang 1529 - 1530]

- **Lọc theo RFC 3704 (RFC 3704 Filtering):** Bộ lọc ACL cơ bản giúp chặn lưu lượng từ các địa chỉ IP giả mạo. Cụ thể, nó chặn các gói tin đến từ các không gian địa chỉ không hợp lệ, chưa sử dụng hoặc được bảo lưu (gọi là "bogon list").
- **Lọc uy tín IP nguồn trên Cisco IPS (Cisco IPS Source IP Reputation Filtering):** Cisco IPS liên tục cập nhật cơ sở dữ liệu (Cisco SensorBase Network) chứa thông tin tình báo về các botnet, phần mềm độc hại để tự động lọc lưu lượng DoS.
- **Lọc hố đen (Black Hole Filtering / RTBH):** Định tuyến lưu lượng truy cập không mong muốn vào một "hố đen" (null0) tại cấp độ định tuyến thông qua giao thức BGP để loại bỏ chúng trước khi tiến vào mạng nội bộ.
- **Dịch vụ phòng chống DDoS từ ISP:** ISP sử dụng tính năng "IP Source Guard" kết hợp cơ sở dữ liệu ràng buộc "DHCP snooping binding" để chặn botnet gửi các gói tin có IP giả mạo.

**Các biện pháp bảo vệ và phát hiện chi tiết [Trang 1519 - 1522]:**

- **Bảo vệ nạn nhân phụ (Protect Secondary Victims):**
  - **Người dùng cá nhân (Individual Users):** Cần thường xuyên theo dõi bảo mật, cài đặt và cập nhật phần mềm diệt virus/anti-Trojan, tắt các dịch vụ không cần thiết, gỡ cài đặt các ứng dụng không dùng đến và quét tất cả các tệp nhận được từ bên ngoài để tránh hệ thống bị lợi dụng làm phần mềm DDoS agent.
  - **Nhà cung cấp dịch vụ mạng (Network Service Providers):** Có thể áp dụng định giá động (dynamic pricing) cho việc sử dụng mạng để tính phí những nạn nhân phụ tiềm năng khi truy cập Internet, qua đó khuyến khích họ chủ động hơn trong việc tự bảo vệ mình khỏi việc trở thành một phần của cuộc tấn công DDoS.
- **Phát hiện và vô hiệu hóa trình xử lý (Detect and Neutralize Handlers):** Phân tích giao thức truyền thông và mẫu lưu lượng (traffic patterns) giữa handlers và clients hoặc handlers và agents để phát hiện ra các nút mạng bị nhiễm. Do số lượng handlers (máy điều khiển) thường ít hơn rất nhiều so với agents, việc vô hiệu hóa một vài handlers có thể vô hiệu hóa hàng loạt agents.
- **Xác định địa chỉ nguồn giả mạo (Spoofed Source Address):** Có xác suất cao là địa chỉ nguồn bị giả mạo của các gói tin tấn công DDoS sẽ không đại diện cho một địa chỉ hợp lệ của một mạng con (sub-network) nhất định. Việc xác định các địa chỉ nguồn giả mạo này cùng với sự hiểu biết về giao thức truyền thông sẽ giúp ngăn chặn tấn công hiệu quả.
- **Cơ chế chi tiết của TCP Intercept:** TCP Intercept hoạt động ở 2 chế độ: Chế độ chặn chủ động (Active intercept mode) - router trực tiếp đánh chặn gói SYN, tự thực hiện bắt tay 3 bước với client thay cho server, sau khi thành công mới kết nối với server; và Chế độ theo dõi thụ động (Passive watch mode) - router chỉ quan sát kết nối đi qua, nếu kết nối không được thành lập trong vòng 30 giây, nó sẽ tự động gửi lệnh reset tới server để xóa trạng thái.
- **Chi tiết Rate Limiting (Giới hạn tốc độ):** Kiểm soát tỷ lệ lưu lượng đi ra hoặc đi vào của thiết bị mạng. Kỹ thuật này thường được cấu hình trên phần cứng thiết bị mạng để giới hạn tỷ lệ yêu cầu ở Lớp 4 và Lớp 5 của mô hình OSI.

### 7.4. Các biện pháp phòng ngừa DoS/DDoS bổ sung [Trang 1530 - 1531]

- Sử dụng mã hóa mạnh (WPA2/WPA3, AES 256).
- Đảm bảo rằng phần mềm và các giao thức luôn được cập nhật, đồng thời quét các máy móc một cách kỹ lưỡng để phát hiện bất kỳ hành vi bất thường nào.
- Kích hoạt tính năng bảo vệ TCP SYN cookie (Enable TCP SYN cookie protection).
- Cập nhật kernel lên phiên bản mới nhất và tắt các dịch vụ không an toàn/không sử dụng (như echo, chargen).
- Chặn mọi gói tin gửi đến (inbound) xuất phát từ các cổng dịch vụ để chống tấn công phản xạ (reflection servers).
- Ngăn chặn truyền gói tin có địa chỉ giả mạo ngay tại cấp độ ISP.

## 9. Bảo vệ DoS/DDoS ở cấp độ ISP và thiết bị chuyên dụng

### 9.1. Bảo vệ DoS/DDoS ở cấp độ ISP và Cấu hình Cisco IOS [Trang 1532 - 1534]

- **Bảo vệ tại ISP:** Các ISP có thể cung cấp dịch vụ "đường ống sạch" (clean pipes) để chỉ cho phép lưu lượng hợp pháp đi qua, chặn đứng các yêu cầu độc hại ngay trên đám mây. Quản trị viên có thể yêu cầu ISP chặn IP bị ảnh hưởng và chuyển hướng trang web sang một IP khác.
- **Kích hoạt tính năng TCP Intercept trên Cisco IOS:** Giúp bảo vệ máy chủ TCP khỏi tấn công SYN-flood. Bộ định tuyến sẽ tự động đánh chặn mọi gói SYN và thay mặt máy chủ thực hiện bắt tay 3 bước với client. Chỉ khi client hoàn tất bắt tay, bộ định tuyến mới kết nối nó với máy chủ.
  - **Bước 1 (Định nghĩa ACL):** `access-list access-list-number {deny | permit} tcp any destination destination-wildcard`
    - **Danh sách kiểm soát truy cập (Access list) này đạt được ba mục đích:**
      1. Đánh chặn tất cả các yêu cầu (Interception of all requests).
      2. Đánh chặn chỉ những yêu cầu xuất phát từ các mạng cụ thể.
      3. Đánh chặn chỉ những yêu cầu hướng tới các máy chủ cụ thể.
  - **Bước 2 (Bật TCP Intercept):** `ip tcp intercept list access-list-number`
  - **Bước 3 (Chọn chế độ):** `ip tcp intercept mode {intercept | watch}` (Mặc định là intercept. Chế độ watch chỉ theo dõi, nếu kết nối không thành lập trong 30 giây sẽ gửi lệnh reset).

### 9.2. Các thiết bị và Dịch vụ phòng chống DDoS chuyên dụng [Trang 1534 - 1541]

**Thiết bị phần cứng (Advanced Protection Appliances):**

- **FortiDDoS** (Ví dụ: dòng 1500F/2000E): Sử dụng kiến trúc máy học song song cực lớn để kiểm tra gói tin Lớp 3, 4, 7 và giảm thiểu rủi ro với độ trễ thấp nhất.
- **Check Point Quantum DDoS Protector:** Bảo vệ đa lớp, phát hiện theo hành vi, tạo chữ ký tự động và phản hồi trong vài giây.
- **Huawei AntiDDoS1000:** Sử dụng công nghệ phân tích dữ liệu lớn (Big Data) để lập mô hình bảo vệ theo thời gian thực.
- **A10 Thunder TPS:** Hệ thống bảo vệ mối đe dọa với khả năng mở rộng cao, phát hiện và chặn các cuộc tấn công trước khi chúng gây ra sự cố mạng.

**Dịch vụ Bảo vệ Đám mây (Cloud Protection Services):**

- **Cloudflare:** Sử dụng mạng lưới 100 Tbps để chặn 87 tỷ mối đe dọa mỗi ngày, phản hồi cực nhanh dưới 3 giây bằng kỹ thuật bảo vệ qua BGP và Lớp 7.
- **Akamai DDoS Protection:** Sử dụng cơ sở hạ tầng đám mây chuyên dụng để chặn mã độc và lưu lượng xấu ngay trên Internet trước khi chúng chạm tới tường lửa của tổ chức.
- _(Các dịch vụ khác)_: **Stormwall PRO**, **Imperva DDoS Protection**, **Nexusguard**, **BlockDoS**, **F5 DDoS Attack Protection**, **DOSarrest**.

**Phần mềm bảo vệ DoS/DDoS (DoS/DDoS Protection Tools) [Trang 1537]:**

- **Anti DDoS Guardian:** Công cụ bảo vệ chống tấn công DDoS mạnh mẽ dành cho máy chủ IIS, Apache, máy chủ trò chơi, Camfrog, máy chủ mail, máy chủ FTP, VOIP PBX, SIP servers và các hệ thống tương tự. Công cụ này giám sát luồng mạng theo thời gian thực và cho phép thiết lập giới hạn với: số lượng luồng mạng, băng thông của máy khách, số lượng kết nối TCP đồng thời của máy khách và tỷ lệ kết nối TCP. Nó cũng giới hạn băng thông UDP, tỷ lệ kết nối UDP và tỷ lệ gói tin UDP.
- Sử dụng "cognitive radios" ở lớp vật lý để chống nhiễu sóng (jamming/scrambling).
- Triển khai hệ thống phát hiện bất thường bằng AI/ML để tự động đánh dấu các sai lệch trong hành vi lưu lượng.
- Sử dụng mô hình phân phối máy chủ (distributed server) và dịch vụ máy chủ dùng chung (colocation) để dự phòng.
- Cấu hình tường lửa để từ chối các lưu lượng mạng truy cập từ bên ngoài bằng giao thức Internet Control Message Protocol (ICMP).
- Bảo mật quản trị từ xa và thường xuyên kiểm tra kết nối (connectivity testing).
- Thực hiện xác thực đầu vào kỹ lưỡng (thorough input validation).
- Ngăn chặn việc sử dụng các hàm lập trình không an toàn hoặc không cần thiết như `gets` và `strcpy`.
- Sử dụng các công nghệ giám sát cấp mạng tiên tiến để giám sát vành đai mạng (network perimeter).
- Đảm bảo các kết nối bán truy cập (semi-accessible connections) được kích hoạt với chức năng time-out một cách quyết đoán.
- Đảm bảo các máy chủ luôn không có các điểm nghẽn (bottlenecks) và điểm lỗi.
- Sử dụng các dịch vụ bảo vệ của bên thứ ba để tăng cường khả năng chịu tải trước các cuộc tấn công DDoS lớn.
- Sử dụng mô hình triển khai đa đám mây (multi-cloud deployment) cho các ứng dụng chính để đảm bảo tính sẵn sàng sao lưu đúng cách.
- Thực hiện mô phỏng mở rộng (extensive simulations) các cuộc tấn công DoS/DDoS để tránh tình trạng gia tăng đột ngột và duy trì chiến lược đối phó phù hợp.
- Chia sẻ thông tin với các đối tác trong ngành và tận dụng nguồn cấp dữ liệu tình báo mối đe dọa (threat intelligence feeds) để cập nhật xu hướng tấn công DDoS.
- Giới hạn hoạt động phát sóng mạng (network broadcasting).

### 7.5.

### 7.3. Ghi nhận pháp y sau tấn công (Post-Attack Forensics) [Trang 1527]

- **Traffic Pattern Analysis:** Phân tích đặc điểm độc nhất của lưu lượng tấn công để tinh chỉnh bộ lọc và cập nhật kỹ thuật điều tiết (throttling).
- **Packet Traceback:** Lần ngược dấu vết gói tin về nguồn thực sự (tương tự dịch ngược) để chặn các cuộc tấn công trong tương lai.
- **Event Log Analysis:** Lưu trữ logs của router, firewall, IDS và honeypot để phục vụ điều tra pháp y.

## 8. Các giải pháp né tránh / Phát hiện bằng Honeypots [Trang 1523 - 1524]

- **Sử dụng Honeypots (Deflect Attacks):** Đây là các hệ thống thiết lập với mức bảo mật thấp một cách cố ý nhằm thu hút kẻ tấn công (enticement). Nó đóng vai trò "mồi nhử" để thu thập thông tin về công cụ, chiến thuật của hacker mà không làm nguy hại tới hệ thống thật. Phương pháp "Defense-in-depth" kết hợp với IPsec để chuyển hướng traffic độc hại vào các honeypots.
  - Có hai dạng: **Low-interaction honeypots** (tương tác thấp) và **High-interaction honeypots** (tương tác cao - như Honeynets, mô phỏng toàn bộ mạng).
- **Blumira Honeypot Software:** Một loại công nghệ đánh lừa (deception technology) giúp các chuyên gia bảo mật phát hiện sớm nỗ lực truy cập trái phép và chuyển động ngang (lateral movement) của kẻ tấn công. Khi có vi phạm, nó lập tức chặn IP nguồn tại tầng switch hoặc firewall.
- _(Bổ sung các công cụ Honeypot khác từ nguồn)_: **KFSensor**, **Valhala Honeypot**, **Cowrie**, **HoneyHTTPD**, **StingBox**.
