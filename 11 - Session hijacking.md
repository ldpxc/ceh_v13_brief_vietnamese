## Session hijacking

**Cướp phiên (Session hijacking)** — chiếm quyền điều khiển một phiên giao tiếp TCP hợp lệ (valid TCP communication session).

Hầu hết quá trình xác thực chỉ xảy ra khi phiên TCP (TCP session) bắt đầu; nếu kẻ tấn công lấy được session ID hợp lệ (session ID) thì có thể sử dụng nó để xác thực với server.

## Tại sao cướp phiên thành công

- Không có cơ chế khoá tài khoản khi nhiều lần thử sai hoặc không xử lý session ID không hợp lệ
- Thuật toán sinh session-ID yếu hoặc kích thước session ID nhỏ
- Xử lý session ID không an toàn
- Thời gian timeout của phiên vô thời hạn (indefinite session timeout)
- Hầu hết hệ thống chạy trên TCP/IP đều dễ tổn thương
- Nhiều biện pháp đối phó không có hiệu quả nếu không sử dụng mã hóa

## Các pha của cướp phiên

- **Theo dõi kết nối (Tracking the connection)** — dùng sniffer để theo dõi nạn nhân, dùng `nmap` để tìm các chuỗi số thứ tự TCP dễ dự đoán
- **Phá đồng bộ kết nối (Desynchronizing connection)** — thay đổi số thứ tự SEQ/ACK của server; gửi dữ liệu null hoặc gói reset
- **Tiêm gói tin của kẻ tấn công (Injecting attacker packets)** — chèn dữ liệu vào mạng hoặc tham gia như MITM (Man-in-the-Middle)

Phân tích gói tin trong cướp phiên cục bộ: cần biết số thứ tự tiếp theo (Next Sequence Number — NSN).

**Cướp phiên thụ động (Passive session hijacking)** — chỉ quan sát và ghi lại traffic, thu thập session IDs và mật khẩu.

**Cướp phiên chủ động (Active session hijacking)** — chiếm phiên bằng cách phá kết nối hoặc tham gia tích cực (ví dụ MITM); đôi khi cần đoán số thứ tự trước khi mục tiêu trả lời server.

**Giả mạo (Spoofing)** — mạo danh người dùng hoặc máy khác, khởi tạo phiên mới bằng thông tin đăng nhập bị đánh cắp.

**Chiếm (Hijacking)** — chiếm quyền kiểm soát phiên đang hoạt động, phụ thuộc vào việc người dùng đã tạo kết nối trước.

## Application-level Hijacking

- **Stealing** — nhiều kỹ thuật để đánh cắp session IDs
- **Guessing** — đoán session ID bằng cách quan sát biến phiên
- **Brute forcing** — thử tất cả hoán vị có thể của session ID

**Session sniffing** — lấy header của yêu cầu HTTP (cookie) hoặc nội dung body của HTTP request.

## Dự đoán token phiên

Dự đoán token phiên (Predicting session token):

- Token tuần tự (sequential tokens)
- Token dựa vào timestamp
- Không gian token nhỏ (small token space)
- Bộ sinh số ngẫu nhiên yếu (weak PRNG) và thiếu rate limiting

## Dùng MITM (split TCP connection)

- client ↔ attacker ↔ server (khi đó attacker có thể sửa/sử dụng lại các thông tin trong phiên)
- Trong giao dịch HTTP, kết nối TCP trở thành mục tiêu để tấn công

## Man-in-the-Browser / Manipulator in the browser

Man-in-the-Browser / Manipulator in the browser (tấn công trình duyệt):

1. Trojan nhiễm máy nạn nhân
2. Trojan cài mã độc vào hệ thống
3. Sau khi khởi động lại trình duyệt, mã được tải
4. Một handler được đăng ký cho mỗi lần truy cập trang
5. Khi tải trang, extension/mã độc so khớp URL với các site mục tiêu
6. Người dùng đăng nhập
7. Extension đăng ký event handler
8. Extension trích xuất giá trị DOM và thay đổi chúng
9. Trình duyệt gửi giá trị đã sửa tới server
10. Server nhận giá trị
11. Giao dịch được chấp nhận
12. Trình duyệt nhận biên lai cho giao dịch đã sửa
13. Trình duyệt hiển thị biên lai với thông tin ban đầu
14. Người dùng không biết gì về thay đổi

## Lợi dụng client-side để chiếm session ID

**Cross-Site Scripting (XSS)** — chiếm token phiên bằng cách chèn mã độc vào trang (ví dụ: `<SCRIPT>alert(document.cookie);</SCRIPT>`). Điều này xảy ra khi webapp không xử lý đầu vào đúng cách.

**Mã JavaScript độc hại (Malicious JS)** có thể lấy cookie/session token và gửi về server của kẻ tấn công.

**Trojan** có thể đọc cookie hoặc bộ nhớ trình duyệt.

**Cross-Site Request Forgery (CSRF)** — tấn công "một cú nhấp" (one-click session riding) khai thác niềm tin của server vào session đang xác thực; cần token chống CSRF để ngăn chặn.

**Session replay attack** — nghe lén (sniff) giao tiếp giữa user và server, ghi lại token xác thực và phát lại (replay) yêu cầu.

**Session fixation** — kẻ tấn công thiết lập trước session ID; khi nạn nhân đăng nhập, session đó được xác thực và kẻ tấn công sử dụng session đã biết.

**Session hijacking qua proxy** — dùng proxy giả, thu nhận và replay token.

**CRIME attack** — tấn công phía client lợi dụng nén dữ liệu trong SSL/TLS/SPDY/HTTPS để suy đoán cookie (Compression Ratio Info-leak Made Easy).

**Forbidden / FREAK-like attacks** — lợi dụng tái sử dụng nonce trong TLS hoặc ép ép downgrade crypto; sau khi chiếm session HTTP, attacker tiêm mã độc hoặc nội dung giả mạo (ví dụ ảnh hưởng tới AES-GCM khi nonce bị tái sử dụng).

**Session donation attack** — attacker đăng nhập trước, nạn nhân bấm link, attacker có thể truy cập thông tin nạn nhân do session bị chia sẻ/ghép nối.

## Ghi nhớ (memorization)

Ghi nhớ (memorization):
CODE → XSS, Malicious JS
TRUST → CSRF, Session Donation
REUSE → Replay, Fixation
NETWORK → Proxy, CRIME
CRYPTO → FREAK / Forbidden

| Attack                                | Ý tưởng chính (1 dòng)                   | Cách thức (tóm tắt)                                                     | Yêu cầu chính                  | Từ khoá kỳ thi CEH                    | Phòng chống                                       |
| ------------------------------------- | ---------------------------------------- | ----------------------------------------------------------------------- | ------------------------------ | ------------------------------------- | ------------------------------------------------- |
| **Cross-Site Scripting (XSS)**        | Chèn JS để đánh cắp cookie phiên         | Script độc thi hành trong trình duyệt nạn nhân và đọc `document.cookie` | Xử lý input kém                | **Client-side code execution**        | Xác thực input, mã hoá output, `HttpOnly` cookies |
| **Malicious JavaScript**              | JS đánh cắp hoặc chuyển tiếp token       | JS trích token và gửi về kẻ tấn công                                    | Có vector chèn script          | **Session token exfiltration**        | CSP, sanitization, `HttpOnly`                     |
| **Trojan**                            | Malware đánh cắp dữ liệu phiên           | Trojan đọc bộ nhớ trình duyệt hoặc cookie                               | Hệ thống nạn nhân bị nhiễm     | **Client compromise**                 | AV, bảo mật endpoint                              |
| **Cross-Site Request Forgery (CSRF)** | Lợi dụng session đã xác thực             | Nạn nhân bấm link → trình duyệt gửi cookie hợp lệ tự động               | Người dùng đã đăng nhập        | **One-click attack / Session riding** | Token chống CSRF, `SameSite` cookies              |
| **Session Replay Attack**             | Ghi lại & phát lại token                 | Kẻ tấn công sniff traffic và replay request được ghi                    | Cho phép tái sử dụng token     | **Replay authentication**             | TLS, nonce, token hết hạn                         |
| **Session Fixation**                  | Đặt trước session ID                     | Nạn nhân đăng nhập bằng session ID do attacker gán                      | Session ID không đổi sau login | **Pre-authentication session ID**     | Sinh lại session ID sau khi login                 |
| **Proxy-based Session Hijacking**     | Đánh cắp phiên qua proxy giả             | Nạn nhân kết nối qua proxy do attacker điều khiển                       | Người dùng tin proxy           | **Man-in-the-Browser**                | HTTPS, kiểm tra chứng chỉ                         |
| **CRIME Attack**                      | Rò rỉ dữ liệu qua nén                    | Lợi dụng tỉ lệ nén TLS/HTTP để suy đoán cookie                          | Bật TLS compression            | **Compression side-channel**          | Tắt TLS compression                               |
| **FREAK / Forbidden Attack**          | Phá yếu TLS / tái sử dụng crypto         | MITM ép downgrade hoặc tái sử dụng nonce (ví dụ AES-GCM)                | Cấu hình TLS yếu               | **TLS downgrade / nonce reuse**       | Sử dụng cipher mạnh, hardening TLS                |
| Session Donation Attack               | Nạn nhân xác thực vào phiên của attacker | Attacker đăng nhập → nạn nhân click → attacker nhận quyền               | Session bị ghép nối            | **Session misbinding**                | Gắn session với user/IP/device                    |

## Network-level session hijacking

(Khai thác lỗ hổng trong three-way TCP handshake)

**TCP/IP Hijacking**:

- Sniff kết nối của nạn nhân và gửi gói giả mạo với số thứ tự dự đoán được
- Bộ nhận xử lý gói và tăng số thứ tự
- Máy nạn nhân bỏ qua gói ACK và rơi vào trạng thái lệch số thứ tự
- Kẻ tấn công tiếp tục theo dõi số thứ tự và giả mạo các gói xuất phát từ IP của nạn nhân
- Kẻ tấn công giao tiếp trong khi kết nối của nạn nhân bị treo (desynchronized)

**IP Spoofing: Source-routed packets**:

1. Tiếp cận nhờ các host tin cậy (trusted hosts)
2. Kẻ tấn công giả mạo IP để server chấp nhận gói từ attacker
3. Kẻ tấn công chèn gói giả trước khi host thực thụ phản hồi server
4. Gói thật bị mất; server nhận gói có số thứ tự do attacker dùng
5. Gói được source-route với điểm đến do attacker chỉ định

**RST Hijacking:**

- Tiêm gói RST trông hợp lệ dùng địa chỉ nguồn giả mạo
- Kẻ tấn công có thể reset kết nối của nạn nhân nếu dùng đúng ACK number
- Nạn nhân tưởng rằng peer gửi gói reset và đóng kết nối
- Có thể thực hiện bằng công cụ tạo gói (packet crafting) như Colasoft Packet Builder hoặc `tcpdump`

**Blind hijacking**:

- Kẻ tấn công tiêm dữ liệu/command vào phiên TCP ngay cả khi không thấy phản hồi
- Gửi dữ liệu mà không thấy reply (không có quyền sniff)

**UDP Hijacking**:

- Kẻ tấn công gửi reply UDP giả mạo cho request UDP của nạn nhân
- Có thể sử dụng MITM để chặn reply thật từ server

**MiTM using forged ICMP**:

- Gói ICMP giả mạo được gửi để redirect traffic giữa client và host qua máy attacker
- Gói lỗi ICMP đánh lừa server/router khiến route đi qua attacker

**ARP spoofing**:

- Phát bản ARP request/response giả mạo để thay đổi bảng ARP của nạn nhân

**PetitPotam hijacking**:

- Ép domain controller (DC) thực hiện xác thực tới server của attacker
- Kẻ tấn công dùng API MS-EFSRPC để ép xác thực và relay NTLM authentication vào AD Certificate Services, từ đó lấy quyền admin

Tóm tắt dạng khai thác:
TCP Sequence Abuse → TCP/IP Hijacking, Blind Hijacking, RST Hijacking
Trust Abuse → IP Spoofing, PetitPotam
Stateless Abuse → UDP Hijacking
Routing Abuse → ICMP Forgery
LAN Poisoning → ARP Spoofing

| Attack                           | Ý tưởng chính (1 dòng)                    | Luồng tấn công (tóm tắt)                                                         | Yêu cầu chính                      | CEH Exam Keywords                             |
| -------------------------------- | ----------------------------------------- | -------------------------------------------------------------------------------- | ---------------------------------- | --------------------------------------------- |
| **TCP/IP Hijacking**             | Chiếm phiên TCP bằng desync sequence      | Sniff → gửi gói giả seq → receiver tăng seq → desync → attacker tiếp tục giả mạo | Có khả năng sniff hoặc dự đoán seq | Sequence number prediction, desynchronization |
| **IP Spoofing (Source Routing)** | Mạo danh host tin cậy bằng IP giả         | Attacker giả IP tin cậy → chèn gói trước host thật → server chấp nhận attacker   | Source routing bật + trusted IP    | Trusted host abuse, source routing            |
| **RST Hijacking**                | Ép đóng phiên TCP                         | Tiêm gói RST + ACK đúng → peer reset → session drop                              | Số seq/ACK chính xác               | TCP RST flag, forced reset                    |
| **Blind Hijacking**              | Tiêm dữ liệu khi không thấy phản hồi      | Dự đoán seq → tiêm dữ liệu → không xem được reply                                | Seq dễ dự đoán                     | Blind injection                               |
| **UDP Hijacking**                | Thay thế/tiêm giao tiếp UDP               | Gửi UDP reply giả → đua hoặc MITM phản hồi thật                                  | UDP không trạng thái               | Packet spoofing                               |
| **MITM using Forged ICMP**       | Dùng ICMP lỗi giả để chuyển hướng traffic | Gửi ICMP lỗi giả → client/server route qua attacker                              | Tin vào ICMP routing               | ICMP redirect                                 |
| **ARP Spoofing**                 | Đầu độc ARP cache để chặn traffic         | Gửi ARP reply giả → victims update ARP → traffic đi qua attacker                 | Truy cập mạng nội bộ               | ARP poisoning                                 |
| **PetitPotam Hijacking**         | Ép DC xác thực rồi relay NTLM             | Abuse MS-EFSRPC → ép DC authenticate → relay NTLM → AD CS compromise             | NTLM bật + AD CS tồn tại           | Authentication coercion, NTLM relay           |

**Công cụ cướp phiên (Session hijacking tools):**

- **Hetty** — MITM proxy, HTTP client để tạo và replay request
- **Caido** — security auditing toolkit
- **bettercap** — framework MITM viết bằng Go

**Công cụ phát hiện cướp phiên:**

- **USM Anywhere**
- **Wireshark**

**Ngăn chặn cướp phiên:**

- **HTTP Strict Transport Security (HSTS)**
- **Token Binding**
- Công cụ hỗ trợ: Checkmarx One (SAST), Fiddler

**Ngăn MITM:**

- **DNS over HTTPS (DoH)**
- **WPA3**
- **VPN**
- **Xác thực hai yếu tố (2FA)**
- **Password manager**
- **Zero-trust architecture**
- **PKI và quản lý chứng chỉ**
- **Phân đoạn mạng (network segmentation)**

**IPsec** — các mode:

- **Transport** — mã hoá chỉ payload của gói IP
- **Tunnel** — IPsec đóng gói toàn bộ gói IP
