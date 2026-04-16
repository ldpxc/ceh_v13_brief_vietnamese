## 1. Ghi nhận gói tin (Packet Sniffing) [Trang 1269]

Ghi nhận gói tin là quá trình giám sát và bắt giữ toàn bộ các gói dữ liệu đi qua một mạng cụ thể bằng ứng dụng phần mềm hoặc thiết bị phần cứng.

- Kẻ tấn công có thể cấu hình card mạng (NIC) trên máy của chúng sang chế độ **promiscuous (promiscuous mode)**. Chế độ này vô hiệu hóa bộ lọc mặc định của NIC, buộc nó phải lắng nghe và chấp nhận mọi dữ liệu truyền trên phân đoạn mạng của nó thay vì chỉ nhận các gói tin dành riêng cho mình.
- Quá trình này cho phép quan sát và truy cập toàn bộ lưu lượng mạng từ một điểm duy nhất, giúp kẻ tấn công thu thập các thông tin nhạy cảm ở dạng bản rõ (cleartext) như mật khẩu (Telnet, FTP), email, cấu hình router, truy vấn DNS, syslog, và các phiên trò chuyện.

## 2. Các loại môi trường Ethernet [Trang 1270 - 1271]

- **Ethernet chia sẻ (Shared Ethernet)**: Mọi host được kết nối trên một bus đơn (sử dụng hub) và phải cạnh tranh băng thông. Hub truyền dữ liệu đến tất cả các cổng; do đó, việc chỉ cần đặt NIC ở chế độ promiscuous sẽ giúp bắt được mọi gói tin rất dễ dàng. Phương pháp sniffing trong môi trường này mang tính thụ động và rất khó bị phát hiện.
- **Ethernet chuyển mạch (Switched Ethernet)**: Các host kết nối thông qua switch thay vì hub. Switch duy trì một bảng CAM (Content Addressable Memory) để ánh xạ địa chỉ MAC với cổng vật lý tương ứng. Nó chỉ gửi gói tin đến đúng máy đích. Do đó, việc đặt NIC ở chế độ promiscuous không còn hiệu quả trực tiếp, nhưng kẻ tấn công vẫn có thể dùng các phương pháp chủ động để đánh lừa switch.

## 3. Các kiểu sniffing (Types of Sniffing) [Trang 1273 - 1274]

- **Passive sniffing (Sniffing thụ động)**: Kẻ tấn công không gửi thêm bất kỳ gói tin nào, chỉ việc lắng nghe và giám sát các gói tin. Thường được áp dụng cho môi trường hub (common collision domains). Phương pháp này mang lại lợi thế tàng hình (stealth) cực cao vì không để lại dấu vết mạng.
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
- Trên Windows: Người dùng có thể đổi địa chỉ MAC trong cài đặt (Network and Internet -> Ethernet Properties -> Advanced tab -> Network Address) hoặc bằng cách chỉnh sửa Windows Registry (`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class...`).
- Công cụ: MAC Address Changer, SMAC, TMAC, Change MAC Address, Mac Changer, AMC.
- Phòng ngừa: Sử dụng DHCP snooping binding table, Dynamic ARP Inspection, IP Source Guard, cấu hình Port Security trên switch, hoặc các chuẩn mã hóa như WPA3 và IEEE 802.1X.

**ARP Spoofing / ARP Poisoning** [Trang 1271, 1314 - 1326]:

- Bởi vì giao thức ARP không giữ trạng thái (stateless) và không xác thực, một máy tính hoàn toàn có thể gửi gói ARP reply ngay cả khi không hề có ai hỏi.
- Kẻ tấn công gửi các gói ARP giả (forged) để liên kết địa chỉ MAC của chúng với địa chỉ IP của một host khác (thường là Default Gateway). Máy nạn nhân sẽ lưu mục sai lệch này vào bộ nhớ đệm (ARP cache), khiến toàn bộ lưu lượng bị chuyển hướng sang máy kẻ tấn công. Kỹ thuật này mở đường cho tấn công MITM (Man-in-the-Middle), DoS, VoIP Call Tapping và Session Hijacking.
- Công cụ: `arpspoof`, Habu, `bettercap`, `Ettercap`, RITM, ARP Spoofer, `larp`.
- Phòng ngừa: Triển khai Dynamic ARP Inspection (DAI), tính năng này kiểm tra tính hợp lệ của cặp IP-MAC dựa vào cơ sở dữ liệu DHCP snooping binding table. Nếu nhận thấy ARP reply không khớp, switch sẽ loại bỏ (discard) gói tin đó.
- Phát hiện: Capsa Portable Network Analyzer, Wireshark, OpUtils, netspionage, NetProbe, ARP-GUARD.

**ICMP Router Discovery Protocol (IRDP) Spoofing** [Trang 1332 - 1333]:

- Giao thức IRDP cho phép host phát hiện IP của các router đang hoạt động trên subnet. Vì không yêu cầu xác thực, kẻ tấn công có thể gửi đi các thông báo quảng bá router giả mạo (spoofed router advertisement). Chúng thiết lập mức độ ưu tiên (preference level) và thời gian sống (lifetime) cao để buộc nạn nhân chọn router giả mạo đó làm đường dẫn mặc định (default route). Kỹ thuật này cho phép MitM, DoS và passive sniffing.
- Phòng ngừa: Vô hiệu hóa IRDP trên các máy chủ.

## 6. VLAN Hopping [Trang 1334 - 1335]

Kỹ thuật này cho phép kẻ tấn công vượt qua các giới hạn phân đoạn mạng (network segmentation controls) để truy cập trái phép vào các tài nguyên nằm ở các VLAN khác. Có 2 phương pháp chính:

- **Switch Spoofing** [Trang 1334]:
  - Kẻ tấn công kết nối một switch giả (rogue switch) vào mạng và đánh lừa switch hợp lệ để thiết lập một đường trục (trunk link). Cuộc tấn công chỉ thành công khi giao diện của switch hợp lệ đang được cấu hình ở chế độ `dynamic auto`, `dynamic desirable`, hoặc `trunk`.
  - Phòng ngừa [Trang 1341]: Cấu hình rõ ràng các cổng thành cổng truy cập (`switchport mode access`) và tắt hoàn toàn khả năng đàm phán trunk (`switchport mode nonegotiate`).
- **Double Tagging** [Trang 1335]:
  - Kẻ tấn công chèn và sửa 2 thẻ 802.1Q (outer/inner tag) vào trong frame Ethernet. Thẻ ngoài (outer tag) là native VLAN của kẻ tấn công, thẻ trong (inner tag) là VLAN đích. Khi switch đầu tiên nhận được, nó sẽ gỡ bỏ thẻ ngoài (do trùng với native VLAN) và chuyển tiếp frame mang thẻ trong tới các cổng trunk, cho phép kẻ tấn công tiếp cận VLAN không mong muốn. Khai thác này chỉ có tác dụng nếu cổng switch được cấu hình dùng native VLANs.
  - Phòng ngừa [Trang 1341]: Đảm bảo tất cả các native VLAN trên các cổng trunk được đổi thành một VLAN ID không sử dụng (Ví dụ: `switchport trunk native vlan 999`), đồng thời đánh tag rõ ràng (explicitly tag) cho tất cả các cổng trunk (`vlan dot1q tag native`).

## 7. STP Attack (Tấn công Spanning Tree Protocol) [Trang 1336 - 1337]

- Giao thức STP dùng để loại bỏ vòng lặp mạng (loops) bằng cách bầu chọn ra một "root bridge" dựa trên thông điệp BPDU. Mặc định, giá trị ưu tiên của cầu nối (Bridge Priority) là 32769.
- Kẻ tấn công cắm một rogue switch vào mạng và cấu hình mức priority thấp hơn bất kỳ switch nào khác (ví dụ Priority = 0). Điều này khiến rogue switch lập tức chiếm vị trí root bridge, ép mọi lưu lượng mạng phải định tuyến đi qua máy của kẻ tấn công để bề dễ bề nghe lén.
- **Phòng ngừa** [Trang 1343 - 1344]:
  - **BPDU Guard**: Nếu cổng truy cập nhận được BPDU, nó sẽ lập tức bị khóa (đưa vào trạng thái errdisable).
  - **Root Guard**: Bảo vệ vị trí root bridge, nếu nhận được BPDU có mức ưu việt hơn, nó sẽ đưa cổng đó vào trạng thái loop inconsistent để chặn quyền cướp root.
  - **Loop Guard / UDLD (Unidirectional Link Detection)**: Phát hiện liên kết lỗi và chống lại các vòng lặp định tuyến do sự cố chuyển đổi STP.

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

## 12. Tấn công DHCP (DHCP Attacks) [Trang 1303 - 1309]

- **DHCP starvation (Tấn công cạn kiệt DHCP)** [Trang 1303]: Kẻ tấn công gửi số lượng lớn các request chứa MAC giả mạo (spoofed MACs) tới DHCP server để làm cạn kiệt (exhaust) pool địa chỉ IP. Kết quả là server không thể cấp cấu hình cho các client mới, gây ra từ chối dịch vụ (DoS).
  - Công cụ: Yersinia, `dhcpStarvation.py`, Metasploit, Hyenae, DHCPig, Gobbler.
  - Phòng ngừa [Trang 1307]: Bật Port security (lệnh `switchport port-security`) để giới hạn MAC; dùng DHCP filtering.
- **Rogue DHCP server attack (Tấn công máy chủ DHCP giả mạo)** [Trang 1305]: Là dạng tấn công MITM. Kẻ tấn công dựng một DHCP server giả. Do server giả này trả gói (DHCPOFFER) về trước server hợp lệ, client sẽ lấy cấu hình từ nó. Kẻ tấn công có thể gán default gateway hoặc máy chủ DNS độc hại cho client để điều hướng lưu lượng.
  - Hạn chế [Trang 1306]: Bật DHCP Snooping, thiết lập cổng nối tới server hợp lệ là Trusted, và đánh dấu interface kết nối tới rogue DHCP là Untrusted để chặn tin nhắn.
  - Công cụ: `mitm6`, Ettercap, Gobbler.

## 13. Các kỹ thuật DNS poisoning [Trang 1345 - 1353]

Mục đích là thay thế địa chỉ IP hợp pháp tại DNS level bằng IP độc hại để chuyển hướng nạn nhân.

- **Intranet DNS spoofing** [Trang 1347]: Kết hợp với kỹ thuật ARP poisoning trên mạng cục bộ (LAN switch) để chặn và thay đổi các phản hồi DNS từ router trước khi gửi cho client.
- **Internet DNS spoofing** [Trang 1349]: Gọi là Remote DNS poisoning. Kẻ tấn công dựng rogue DNS server và dùng Trojan lây nhiễm vào máy nạn nhân để thay đổi cài đặt IP DNS cục bộ trỏ về server độc hại.
- **Proxy server DNS poisoning** [Trang 1350]: Kẻ tấn công gửi Trojan để thay đổi cấu hình proxy server trong trình duyệt Internet của người dùng (ví dụ: Internet Explorer) trỏ về proxy của kẻ tấn công.
- **DNS cache poisoning** [Trang 1351-1352]: Thêm hoặc sửa bản ghi DNS giả (forged DNS records) trực tiếp trên bộ nhớ đệm (cache) của resolver.
  - _(Bổ sung)_ **SAD DNS attack**: Biến thể mới, kẻ tấn công tiêm mã độc vào bộ đệm bằng cách khai thác các kênh phụ (side channels) và phần mềm DNS cũ như `dnsmasq`, `unbound`.
- Công cụ [Trang 1352-1353]: DerpNSpoof, deserter, PolarDNS, Ettercap, Evilgrade, DNS Goisoner.
- Phòng ngừa [Trang 1354-1355]: Triển khai DNSSEC, cấu hình DNS-over-HTTPS (DoH) hoặc SSL/TLS, ngẫu nhiên hóa (randomize) IP và Query IDs.

## 14. Công cụ sniffing / DNS sniffing [Trang 1357 - 1364]

- **Wireshark** [Trang 1357]: Chụp gói tin tương tác trên mạng, thường dùng cùng trình điều khiển WinPcap. Hỗ trợ tính năng "Follow TCP Stream" giúp kẻ tấn công xem trực tiếp mật khẩu dưới dạng văn bản thuần túy (cleartext).

**Bảng Bộ lọc trong Wireshark (Display Filters)** [Trang 1360-1361]:

| Giám sát / Lọc                                   | Bộ lọc / Ví dụ lọc                                                                                 |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------- |
| Giám sát cổng (ví dụ port 23) và IP máy          | `tcp.port == 23` <br> `ip.addr == 192.168.1.100` <br> `ip.addr == 192.168.1.100 && tcp.port == 23` |
| Lọc theo nhiều địa chỉ                           | `ip.addr == 10.0.0.4 or ip.addr == 10.0.0.5`                                                       |
| Lọc theo địa chỉ IP                              | `ip.addr == 10.0.0.4`                                                                              |
| Bộ lọc khác (với kích thước frame)               | `ip.dst == 10.0.1.50 && frame.pkt_len > 400`                                                       |
| Hiển thị tất cả TCP reset                        | `tcp.flags.reset == 1`                                                                             |
| Đặt bộ lọc cho giá trị hex                       | `udp contains 33:27:58`                                                                            |
| Hiển thị tất cả HTTP GET requests                | `http.request`                                                                                     |
| Hiển thị tất cả retransmissions trong trace      | `tcp.analysis.retransmission`                                                                      |
| Hiển thị tất cả TCP packets chứa từ khóa traffic | `tcp contains "traffic"`                                                                           |
| Loại trừ ARP, ICMP, DNS hoặc các giao thức khác  | `!(arp or icmp or dns)`                                                                            |
| Lọc mọi gói TCP có nguồn hoặc đích là cổng 4000  | `tcp.port == 4000`                                                                                 |
| Hiển thị SMTP (port 25) và ICMP                  | `tcp.port eq 25 or icmp`                                                                           |
| Hiển thị traffic LAN giữa workstation và server  | `ip.src==192.168.0.0/16 and ip.dst==192.168.0.0/16`                                                |

> _Ghi chú:_ Các lệnh lọc đã được chuẩn hóa lại đúng như giáo trình (ví dụ lệnh lọc độ dài frame là `frame.pkt_len > 400`, lệnh lọc hex là `udp contains <hex>`).

**Công cụ sniffing phổ biến khác** [Trang 1362-1364]:

- **Capsa Portable Network Analyzer**: Phân tích, chẩn đoán, chụp và giám sát lưu lượng dễ sử dụng.
- **Omnipeek**: Có khả năng hiển thị bản đồ Google Map (Google Maps plug-in) để xác định vị trí thực tế của tất cả các IP công cộng từ các gói bị bắt.
- _(Bổ sung)_ Các công cụ khác: RITA, Observer Analyzer, PRTG Network Monitor, Network Performance Monitor, Xplico.

## 15. Biện pháp chống sniffing (Defend Against Sniffing) [Trang 1366 - 1368]

- Hạn chế tối đa truy cập vật lý vào các phương tiện mạng để đảm bảo packet sniffer không thể được cài đặt.
- Sử dụng mã hóa đầu-cuối (end-to-end encryption) để bảo vệ dữ liệu (Sử dụng IPsec, VPN, SSL/TLS, dùng SSH thay vì Telnet, SFTP thay vì FTP).
- Thêm vĩnh viễn (permanently) địa chỉ MAC của gateway vào bộ đệm ARP / binding table, và sử dụng IP/ARP tĩnh để chống spoofing.
- Triển khai DHCP snooping, Dynamic ARP Inspection (DAI), và IP Source Guard trên switch.
- Sử dụng các kỹ thuật phân đoạn mạng (VLAN segmentation) và kích hoạt Port security.
- _(Bổ sung từ nguồn)_ Trích xuất địa chỉ MAC trực tiếp từ card mạng (NIC) thay vì qua HĐH để chống MAC spoofing. Sử dụng chuẩn IPv6 vì giao thức này bắt buộc tích hợp bảo mật IPsec. Mở ACL giới hạn dải IP tin cậy. Dùng công cụ IDS/IPS để quét NIC đang ở chế độ promiscuous.

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
