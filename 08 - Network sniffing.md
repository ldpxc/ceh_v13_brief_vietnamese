## Ghi nhận gói tin

Ghi nhận gói tin (Packet sniffing) — giám sát và bắt các gói dữ liệu đi qua một mạng xác định bằng phần mềm hoặc thiết bị phần cứng.

Cho phép quan sát và tấn công toàn bộ mạng từ bất kỳ điểm nào.

Kẻ tấn công có thể chuyển card mạng (NIC) sang chế độ promiscuous (promiscuous mode) để lắng nghe mọi dữ liệu trên phân đoạn của nó.

## Các loại môi trường Ethernet

**Các loại môi trường Ethernet:**

- **Ethernet chia sẻ (Shared Ethernet)** — một bus đơn kết nối tất cả host, chia sẻ băng thông (hub).

- **Ethernet chuyển mạch (Switched Ethernet)** — switch duy trì bảng ARP (ARP table) để biết MAC nào nối với cổng nào, nên máy chỉ gửi gói tới đúng đích; do đó việc đặt NIC ở chế độ promiscuous không luôn hiệu quả, nhưng vẫn có các phương pháp khác.

## Phương pháp sniffing cho mạng chuyển mạch

**Phương pháp sniffing cho mạng chuyển mạch:**

- **ARP spoofing / ARP poisoning (ARP spoofing / ARP poisoning)** — ARP không giữ trạng thái (stateless); máy có thể gửi ARP reply ngay cả khi không được hỏi.
  - **ARP spoofing** — gửi ARP giả để liên kết MAC của kẻ tấn công với IP của host khác, cho phép thực hiện MITM (Man-in-the-Middle).
  - **MAC flooding (MAC flooding)** — tại lớp 2, kẻ tấn công gửi nhiều địa chỉ MAC giả tới switch cho tới khi bảng CAM (CAM table) đầy, lúc này switch có thể hành xử như hub, broadcast mọi gói.
  - Công cụ: `arpspoof`, Habu
  - Phòng ngừa: Dynamic ARP Inspection (Dynamic ARP Inspection)
  - Phát hiện: Capsa Portable Network Analyzer, Wireshark, OpUtils, NetSpionage

- **MAC spoofing / MAC duplicating (MAC spoofing)** — mạo danh địa chỉ MAC để kết nối vào cổng switch.
  - Trên Windows có thể thay đổi MAC trong cài đặt
  - Công cụ: MAC Address Changer
  - Phòng ngừa: DHCP snooping binding table, Dynamic ARP Inspection, IP Source Guard

- **ICMP Router Discovery Protocol (IRDP) spoofing (ICMP Router Discovery Protocol spoofing)** — cho phép host phát hiện IP của router hoạt động trên subnet.

## VLAN hopping

**VLAN hopping (VLAN hopping):**

- **Switch spoofing** — gắn một switch giả (rogue switch) để tạo trunk giữa switch hợp lệ và rogue; chỉ có thể khi interface được cấu hình `dynamic auto`, `dynamic desirable` hoặc chế độ trunk.
  - Phòng ngừa: cấu hình các cổng là access ports và tắt khả năng negotiate trunk.

- **Double tagging (double tagging)** — chèn và sửa 802.1Q (802.1Q) tag ngoài và trong (outer/inner) trong frame Ethernet, cho phép luồng traffic đi qua VLAN không mong muốn để kẻ tấn công tiếp cận inner tag.
  - Phòng ngừa: chỉ định default VLAN an toàn, đánh tag rõ ràng cho tất cả cổng trunk, tránh sử dụng VLAN ID không dùng.

- **STP attack (STP attack)** — chèn rogue switch có priority thấp (cấp thấp hơn) để chiếm vị trí root bridge trong Spanning Tree Protocol (STP), khiến mọi traffic đi qua rogue switch.
  - Phòng ngừa: BPDU Guard, Root Guard, Loop Guard, UDLD (Unidirectional Link Detection)

## Các kiểu sniffing

**Các kiểu sniffing:**

- **Passive sniffing (Passive sniffing)** — không gửi packet nào (chỉ lắng nghe).
- **Active sniffing (Active sniffing)** — tìm kiếm/thu hút traffic bằng cách chủ động tiêm traffic vào mạng.
  - Ví dụ: MAC flooding, DNS poisoning, ARP poisoning, DHCP attacks, switch port stealing, spoofing attacks.

## Các giao thức dễ bị sniffing

**Các giao thức dễ bị sniffing:**

- Telnet (Telnet)
- Rlogin (Rlogin)
- HTTP (HTTP)
- SNMP (SNMP)
- SMTP (SMTP)
- NNTP (NNTP)
- POP (POP)
- FTP (FTP)
- IMAP (IMAP)
- TFTP (TFTP)

## Thiết bị/thiết bị phân tích giao thức phần cứng

**Thiết bị/thiết bị phân tích giao thức phần cứng (hardware protocol analyzers / sniffers):**

- **Xgig 1000 32/128G** — inline, non-intrusive capture, auto negotiation, link training, forward error correction
- **SierraNet M1288** — fiber channel fabrics analyzer

## SPAN port

**SPAN port:**

- **SPAN (Switched Port Analyzer, còn gọi là port mirroring)** — tính năng của Cisco; nếu kẻ tấn công kết nối vào SPAN port thì có thể thu được toàn bộ lưu lượng mirrored và đe dọa mạng.

## Wiretapping / telephone tapping

**Wiretapping / telephone tapping:**

- Ghi âm đường dây chính thức hoặc không chính thức
- Ghi âm cuộc gọi
- Direct line wiretap
- Radio wiretap

**Tapping kiểu chủ động (Active tapping)** — MITM, tiêm hoặc sửa đổi dữ liệu.
**Tapping kiểu thụ động (Passive tapping)** — snooping, eavesdropping.

**Ví dụ lệnh công cụ:** `macof -i eth0` (MAC flooding)

**Switch port stealing** — gửi ARP forged dùng MAC của nạn nhân để chiếm giữ port.

## DHCP attacks

**DHCP attacks:**

- **DHCP starvation (DHCP starvation)** — gửi số lượng lớn request tới DHCP server để cạn pool địa chỉ, khiến server không cấp cấu hình cho client mới. Công cụ: Yersinia, `dhcpStarvation.py`, Metasploit.
  - Phòng ngừa: bật port security, DHCP filtering

- **Rogue DHCP server attack** — dạng MITM: kẻ tấn công dựng DHCP server giả, trả gói trước server hợp lệ; có thể gán gateway/ DNS độc hại cho client.
  - Hạn chế: đánh dấu interface kết nối tới rogue là untrusted (ví dụ trên switch). Công cụ: `mitm6`, `ettercap`, `gobbler`.

## Các kỹ thuật DNS poisoning

**Các kỹ thuật DNS poisoning:**

- **Intranet DNS spoofing** — kết hợp ARP poisoning để thay đổi phản hồi DNS trong mạng cục bộ.
- **Internet DNS spoofing** — dùng rogue DNS server để thay đổi bản ghi DNS trên máy nạn nhân.
- **Proxy server DNS poisoning** — Trojan thay đổi cấu hình proxy trình duyệt.
- **DNS cache poisoning** — thêm hoặc sửa bản ghi DNS giả trên resolver (SAD DNS attack).
  - Công cụ: `DerpNSpoof`, `deserter`, `PolarDNS`, `Ettercap`, `Evilgrade`, `DNS Goisoner`
  - Phòng ngừa: DNSSEC (DNSSEC), HTTPS/SSL (SSL)

## Công cụ sniffing/DNS sniffing

**Công cụ sniffing/DNS sniffing:**

- **Wireshark (Wireshark)** — thường dùng cùng WinPcap (WinPcap)

| Giám sát cổng cụ thể                            | Bộ lọc / Ví dụ lọc                                                                             |     |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------- | --- |
| Giám sát cổng (ví dụ port 23) và IP máy         | `tcp.port == 23`<br>`ip.addr == 192.168.1.100`<br>`ip.addr == 192.168.1.100 && tcp.port == 23` |     |
| Lọc theo nhiều địa chỉ                          | `tcp.port == 23`<br>`ip.addr == 10.0.0.4 or ip.addr == 10.0.0.5`                               |     |
| Lọc theo địa chỉ IP                             | `ip.addr == 10.0.0.4`                                                                          |     |
| Bộ lọc khác                                     | `ip.dst == 10.0.1.50 && frame_len > 400`                                                       |     |
| Hiển thị tất cả TCP reset                       | `tcp.flags.reset == 1`                                                                         |     |
| Đặt bộ lọc cho giá trị hex                      | `udp.contains`                                                                                 |     |
| `http.request`                                  | Hiển thị tất cả HTTP GET requests                                                              |     |
| `tcp.analysis.retransmission`                   | Hiển thị tất cả retransmissions trong trace                                                    |     |
| `tcp contains "traffic"`                        | Hiển thị tất cả TCP packets chứa từ khóa `traffic`                                             |     |
| `!(arp or icmp or dns)`                         | Loại trừ ARP, ICMP, DNS hoặc các giao thức khác                                                |     |
| Lọc mọi gói TCP có nguồn hoặc đích là cổng 4000 | `tcp.port == 4000`                                                                             |     |
| Hiển thị SMTP (port 25) và ICMP                 | `tcp.port == 25 or icmp`                                                                       |     |
| Hiển thị traffic LAN giữa workstation và server | `ip.src == 192.168.0.0/16 and ip.dst == 192.168.0.0/16`                                        |     |

## Công cụ sniffing phổ biến

**Công cụ sniffing phổ biến:**

- Capsa Portable Network Analyzer
- Omnipeek

## Biện pháp chống sniffing

**Biện pháp chống sniffing:**

- Hạn chế truy cập vật lý vào hạ tầng mạng
- Mã hóa đầu-cuối (end-to-end encryption)
- Thêm MAC vào ARP cache / binding table
- Sử dụng DHCP snooping, Dynamic ARP Inspection, IP Source Guard
- Sử dụng VLAN segmentation, port security

## Cách phát hiện sniffing

**Cách phát hiện sniffing:**

- Hệ thống phát hiện xâm nhập (IDS)
- Phát hiện thiết bị đang chạy ở chế độ promiscuous (promiscuous mode)
- Chạy các công cụ mạng để dò tìm

**Một số phương pháp phát hiện cụ thể:**

- **Ping method** — ping kèm MAC không đúng để dò thiết bị promiscuous
- **DNS method** — tăng lưu lượng mạng / theo dõi reverse DNS lookups; gửi ICMP tới IP không tồn tại
- **ARP method** — gửi ARP unicast (non-broadcast) tới tất cả nút để dò phản hồi

**Phương pháp phát hiện promiscuous mode:** `nmap --script=sniffer-detect`, NetScanToolsPro
