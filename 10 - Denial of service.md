## Mạng bot (Botnets)

Các phương pháp botnet tìm máy dễ bị tổn thương:

- Quét ngẫu nhiên (Random scanning) - quét các máy một cách ngẫu nhiên để tìm lỗ hổng
- Quét theo danh sách mục tiêu (Hit-list scanning) - thu thập các máy có khả năng bị tấn công rồi tạo "đội quân zombie" (zombie army)
- Quét theo cấu trúc mạng (Topological scanning) - dùng thông tin từ máy đã bị nhiễm để tìm các máy mới
- Quét trong mạng con cục bộ (Local subnet scanning) - quét các host trong cùng subnet
- Quét hoán vị (Permutation scanning) - sử dụng danh sách hoán vị giả ngẫu nhiên của địa chỉ IP (ví dụ block cipher 32-bit và key được chọn trước)

Lan truyền mã độc (Malicious code propagation):

- Truyền từ nguồn tập trung (Central source propagation) — kẻ tấn công đặt toolkit tấn công trên một nguồn trung tâm, sao chép mã, lặp lại
- Lan truyền theo chuỗi ngược (Back-chaining propagation) — ví dụ qua TFTP từ máy kẻ tấn công
- Lan truyền tự trị (Autonomous propagation) — máy bị tấn công tự chuyển toolkit tấn công khi nó bị xâm nhập (attacker → victim → victim)

Nghiên cứu trường hợp DDoS: HTTP/2 "Rapid Reset" — cuộc tấn công vào Google Cloud (2023) khai thác stream multiplexing, sử dụng ~100 luồng sống qua một kết nối TCP duy nhất.

## Tấn công từ chối dịch vụ (DDoS)

Tấn công dung lượng (Volumetric attacks) — làm cạn băng thông, thường nhắm vào dịch vụ không giữ trạng thái như NTP hoặc SSDP (NTP, SSDP):

- Flood attack (tấn công tràn) — lượng lớn traffic
- Amplification attack (tấn công khuếch đại) — lợi dụng dịch vụ phản hồi lớn khi gửi yêu cầu nhỏ tới broadcast/reflector

Tấn công giao thức (Protocol attack) — không chỉ cạn băng thông mà còn tấn công bảng trạng thái kết nối (connection state tables)

Tấn công lớp ứng dụng (Application layer attacks) — tràn lưu lượng web bằng traffic hợp lệ, khóa truy cập bằng nhiều lần đăng nhập sai, truy vấn SQL dài/nhỏ giọt; ví dụ Slowloris (giữ nhiều kết nối HTTP nửa mở)

Kỹ thuật DoS/DDoS:

- UDP flood (UDP flood attack) — gửi gói UDP giả mạo ở tốc độ rất cao tới các cổng ngẫu nhiên
- ICMP flood (ICMP flood attack) — lượng lớn ICMP Echo requests
- Ping of Death — gói malformed hoặc vượt kích thước hợp lệ
- Smurf attack — gửi ICMP Echo với địa chỉ nguồn bị giả mạo
- Pulse-wave DDoS — gửi xung gói theo chu kỳ (ví dụ mỗi 10 phút), làm hệ thống kiệt quệ và khó phục hồi
- Zero-day DDoS — khai thác lỗ hổng chưa có bản vá
- NTP amplification (NTP amplification attack) — botnet gửi UDP tới reflector NTP với IP nguồn giả (monlist enabled). Ví dụ kiểm tra: `nmap -sU -pU:123 -Pn -n --script=ntp-monlist`
- SYN flood (SYN flood attack) — gửi SYN với IP nguồn giả, lạm dụng three-way handshake của TCP
- Fragmentation attack — gửi nhiều gói phân mảnh (ví dụ gói ~1500 byte) khiến nạn nhân không thể ghép lại; có thể qua mặt firewall/IDS
- Spoofed session flood — giả mạo phiên TCP với SYN/ACK/RST/FIN để gây rối
- HTTP GET/POST timed header — dùng header trì hoãn để duy trì kết nối HTTP và làm cạn tài nguyên web
- Slowloris — gửi yêu cầu HTTP không hoàn chỉnh nhằm giữ nhiều kết nối nửa mở
- Multi-vector DDoS — kết hợp Volumetric + Protocol + Application layer
- Peer-to-peer DDoS — lợi dụng mạng P2P (ví dụ DC++)
- Permanent Denial-of-Service (PDoS / phlashing) — gây hỏng phần cứng vĩnh viễn bằng bản cập nhật giả
- TCP SACK panic — khai thác lỗi trên Linux bằng gói SACK có MSS không hợp lệ gây integer overflow trong socket buffer, dẫn tới kernel panic
- Distributed Reflection DDoS (DRDoS) — tấn công giả mạo nguồn, lợi dụng nhiều reflector/relay trung gian
- Ransom DDoS — tấn công tống tiền bằng DDoS

Bộ công cụ tấn công (Attack toolkits):

- ISB (I'm So Bored) — hỗ trợ flood HTTP, UDP, TCP, ICMP
- UltraDDOS-v2
- HULK
- Slowloris
- UFO-Net

Biện pháp giảm nhẹ (Countermeasures):

- Activity profiling — thiết lập baseline cho lưu lượng trung bình
- Sequential change-point detection — phát hiện thay đổi theo thời gian/flow, lọc theo địa chỉ IP
- Wavelet-based signal analysis — phân tích thành phần phổ của lưu lượng mạng

Các giải pháp phát hiện/né tránh (Evasion / detection):

- Một số honeypot và hệ thống cảnh báo (ví dụ Blumira) giúp phát hiện và thu thập mẫu tấn công
