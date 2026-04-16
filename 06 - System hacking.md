## Chiếm quyền truy cập (Gaining access)

Chiếm quyền truy cập là bước đầu tiên trong các phương pháp tấn công hệ thống (CHM), trong đó kẻ tấn công sử dụng nhiều kỹ thuật như bẻ khóa mật khẩu, khai thác tràn bộ đệm (buffer overflows), và khai thác các lỗ hổng đã được xác định để truy cập vào hệ thống đích.

## Windows

**Cách mật khẩu được lưu trong SAM của Windows (SAM)**

- Trình quản lý tài khoản bảo mật của Windows (Security Accounts Manager - SAM) hoặc cơ sở dữ liệu Active Directory (AD) được sử dụng để quản lý tài khoản người dùng và lưu trữ mật khẩu dưới dạng băm (một chiều - one-way hash).
- Hệ thống **không bao giờ** lưu trữ mật khẩu dưới dạng bản rõ (plaintext) nhằm bảo vệ chúng khỏi các cuộc tấn công.
- Tệp SAM được hệ thống triển khai như một tệp registry (registry database). Kernel của Windows duy trì một khóa hệ thống tệp độc quyền (exclusive filesystem lock) trên tệp SAM này.
- **Không thể sao chép hoặc di chuyển tệp SAM** sang vị trí khác trong khi Windows đang chạy (online attacks). Khóa này chỉ được giải phóng khi hệ thống bị lỗi màn hình xanh hoặc hệ điều hành đã tắt.
- Tuy nhiên, để phục vụ bẻ khóa ngoại tuyến (offline brute-force), kẻ tấn công có thể dump nội dung phần đĩa cứng chứa tệp SAM bằng nhiều kỹ thuật khác nhau.
- Tệp SAM sử dụng chức năng **SYSKEY** (trong Windows NT 4.0 và các phiên bản mới hơn) để mã hóa một phần các giá trị băm mật khẩu. Các khóa được mã hóa này khiến việc bẻ khóa trở nên rất khó khăn (một số phiên bản có thêm khóa phụ - secondary key).

**Cách mật khẩu được lưu cụ thể:**

- **Vị trí:** Tệp SAM được lưu tại `%SystemRoot%\system32\config\SAM` trong hệ thống Windows, và được mount vào registry dưới nhánh `HKEY_LOCAL_MACHINE\SAM`.
- Lưu trữ các giá trị băm **LM** hoặc **NTLM**.

**NTLM authentication (Xác thực NTLM)**

- **NT LAN Manager (NTLM)** là giao thức xác thực mặc định thực hiện việc xác thực bằng chiến lược thử thách/phản hồi (challenge/response).
- Vì nó không dựa trên một đặc tả giao thức chính thức nào, nên không có gì đảm bảo nó hoạt động hoàn toàn nhất quán và hiệu quả trong mọi tình huống.
- NTLM bao gồm ba phương thức: LM, NTLMv1 và NTLMv2 (khác biệt chính là cấp độ mã hóa). NTLMv2 mạnh hơn, tuy nhiên Microsoft đã nâng cấp giao thức xác thực mặc định lên **Kerberos** vì Kerberos an toàn hơn NTLM rất nhiều.
- NTLM thay thế hoàn toàn băm LM (do LM dễ bị bẻ khóa). Các phiên bản từ Windows Vista trở về sau đã **vô hiệu hóa** băm LM theo mặc định.
- Tệp SAM sẽ chỉ lưu một giá trị "dummy" (trống hoặc giả) không liên quan gì đến mật khẩu thực tế nếu băm LM bị xóa, và không thể tính toán băm LM cho các mật khẩu dài hơn 14 ký tự.

**Công cụ trích xuất hash mật khẩu:**

- **pwdump7:** Trích xuất hàm băm LM và NTLM từ cơ sở dữ liệu SAM cục bộ. Nó hoạt động bằng cách trích xuất tệp nhị phân SAM và SYSTEM, có khả năng dump các tệp được bảo vệ và hoạt động offline (yêu cầu quyền admin).
- **Mimikatz**
- **DSinternals**
- **hashcat**
- **PyCrack**

**Quy trình xác thực NTLM (Tóm tắt chi tiết):**

1. **Client request access:** Máy khách nhập tên người dùng/mật khẩu, tạo mã băm và gửi yêu cầu đăng nhập kèm tên miền tới Domain Controller (DC).
2. **Server gửi challenge:** DC tạo một chuỗi ký tự ngẫu nhiên 16-byte gọi là "nonce" và gửi nó cho máy khách.
3. **Client tính response:** Máy khách mã hóa "nonce" bằng mã băm của mật khẩu người dùng và gửi trả lại cho DC.
4. **Server xác thực:** DC truy xuất mã băm của người dùng từ SAM, dùng nó để mã hóa "nonce", rồi so sánh kết quả với phản hồi nhận được từ máy khách. Nếu khớp, quá trình đăng nhập thành công.

**Kerberos authentication (Xác thực Kerberos)**

- Sử dụng mật mã khóa bí mật (secret-key cryptography) để cung cấp xác thực mạnh mẽ (xác thực hai chiều giữa client và server) và bảo vệ dữ liệu khỏi tấn công phát lại (replay attacks) hay nghe lén (eavesdropping).
- Sử dụng **KDC (Key Distribution Center)**: Trung tâm phân phối khóa, là một bên thứ ba đáng tin cậy.
- KDC bao gồm hai phần logic: **AS (Authentication Server)** và **TGS (Ticket Granting Server)**.
- Sử dụng "vé" (tickets) để chứng minh danh tính người dùng thay vì truyền mật khẩu.
- Là bản nâng cấp mặc định thay thế NTLM, cung cấp khả năng bảo mật mạnh mẽ hơn nhiều.

**Quy trình Kerberos (Tóm tắt chi tiết):**

1. Đăng nhập và gửi yêu cầu xác thực đến máy chủ AS (Authentication Server).
2. Nhận **Ticket-Granting Ticket (TGT)** từ AS _(Phục vụ cho cơ chế Single Sign-On để truy cập sau này mà không cần nhập lại mật khẩu)._
3. Gửi yêu cầu quyền truy cập một dịch vụ cụ thể tới TGS.
4. Nhận **Service ticket (ST)** từ TGS.
5. Truy cập dịch vụ bằng cách gửi yêu cầu kèm vé tới Application Server.
6. Application server phản hồi lại client để chứng minh danh tính của nó.

**Các phương án lấy mật khẩu / bẻ khóa:**

- **Dump credentials từ bộ nhớ:** Trích xuất mật khẩu bản rõ, hash, ticket từ bộ nhớ tiến trình LSASS bằng các công cụ như Mimikatz.
- **Lấy bản sao cục bộ của cơ sở dữ liệu SAM:** Sử dụng pwdump7 hoặc các kỹ thuật dump đĩa khi hệ thống offline.
- **Lấy bản sao của AD file `ntds.dit`:** Bằng kỹ thuật DCSync attack để mô phỏng một quá trình đồng bộ Active Directory và yêu cầu DC cung cấp hash.
- **Trích xuất SYSKEY (boot key):** Để giải mã một phần các hash mật khẩu trong SAM.
- **Chặn (intercept) credentials truyền qua mạng:**
  - **Passive sniffing (Nghe lén thụ động):** Sử dụng công cụ (sniffer) bắt gói tin truyền qua mạng Hub/LAN để đánh cắp mật khẩu email, web, FTP, SMB, SQL mà nạn nhân không hay biết.
  - **MITM (Man-in-the-Middle) & Replay attacks:** Đứng giữa kênh giao tiếp để nghe lén, lấy cắp token/hash và phát lại (replay) giao dịch mạng.
  - **Plaintext password:** Bắt các thông tin xác thực gửi qua các giao thức không mã hóa (như Telnet).
  - **LM, NTLM, NTLMv2, Kerberos:** Can thiệp thông qua _LLMNR/NBT-NS Poisoning_, _NTLM Relay_, _Kerberoasting_ (cracking TGS), và _AS-REP Roasting_ (cracking TGT) để trích xuất hash.

**Tấn công brute-force / Password Spraying trên dịch vụ mạng:**
Kẻ tấn công sử dụng các kỹ thuật Brute-force hoặc Password Spraying _(thử một mật khẩu phổ biến trên nhiều tài khoản cùng lúc để tránh bị khóa tính năng Account Lockout)_ thông qua các cổng phổ biến sau:

- **MSSQL (1433/TCP)**
- **SMB / File and Print server (445/TCP)**
  _(Ghi chú: Mặc dù tài liệu đề cập chung về các kỹ thuật Active Online attack nhắm vào ứng dụng Web và email, danh sách cụ thể được liệt kê cho Password Spraying tập trung vào MSSQL, SSH, FTP, SMB, Telnet và Kerberos)._

**Brute force dịch vụ điều khiển từ xa:**

- **SSH (22/TCP)**
- **FTP (21/TCP)**
- **Telnet (23/TCP)**
- **Kerberos (88/TCP)**

## 1. Bẻ khóa mật khẩu (Password Cracking)

Bẻ khóa mật khẩu là quá trình phục hồi mật khẩu từ dữ liệu truyền tải qua hệ thống máy tính hoặc từ dữ liệu được lưu trữ, nhằm giúp người dùng khôi phục mật khẩu hoặc giúp kẻ tấn công giành quyền truy cập trái phép. Phân loại các cuộc tấn công mật khẩu bao gồm:

**Tấn công phi điện tử / phi kỹ thuật (Non-Electronic Attacks)**

- **Social engineering:** Khai thác hành vi con người, lừa gạt nạn nhân phá vỡ quy trình bảo mật thông thường để lấy thông tin.
- **Shoulder surfing:** Nhìn trộm qua vai nạn nhân (quan sát bàn phím hoặc màn hình) khi họ nhập mật khẩu hoặc mã PIN (ví dụ: ở hàng thanh toán siêu thị).
- **Dumpster diving:** Lục lọi thùng rác để tìm kiếm thông tin nhạy cảm bị vứt bỏ như tệp mật khẩu, sách hướng dẫn, báo cáo, hoặc biên lai.

**Tấn công online chủ động (Active Online Attacks):**

Kẻ tấn công giao tiếp trực tiếp với máy nạn nhân để lấy mật khẩu. Các kỹ thuật bao gồm:

- **Password guessing:** Đoán mật khẩu thủ công bằng cách thu thập thông tin qua social engineering và sử dụng thuật toán vòng lặp FOR đơn giản.
- **Dictionary attack:** Tải một tệp từ điển (chứa danh sách các từ phổ biến) vào ứng dụng bẻ khóa để chạy thử. Thường kết hợp thêm số và ký hiệu để tăng tỷ lệ thành công.
- **Brute force attack:** Thử mọi kết hợp ký tự có thể có (exhaustive key-search) cho tới khi bẻ được mật khẩu. Rất tốn thời gian nhưng mọi mật khẩu cuối cùng đều sẽ bị tìm ra.
- **Rule-based attack:** Sử dụng khi kẻ tấn công biết trước một số thông tin về mẫu mật khẩu (VD: biết mật khẩu có 2 chữ số). Gồm hai dạng: **Hybrid attack** (thêm số/ký tự vào từ điển cũ) và **Syllable attack** (kết hợp các âm tiết).
- **Password spraying attack:** Tấn công nhiều tài khoản người dùng cùng lúc bằng một vài mật khẩu phổ biến nhất. Phương pháp này giúp tránh bị cơ chế tự động khóa tài khoản (account lockout) phát hiện.
- **Hash injection / Pass-the-Hash (PtH):** Chèn hàm băm (hash) LM hoặc NTLM đã bị lộ vào một phiên cục bộ (local session) để xác thực vào tài nguyên mạng (qua mặt hệ thống SSO của Windows). Thường dùng `Mimikatz` để lấy hash từ tiến trình `lsass.exe`.
- **LLMNR/NBT-NS poisoning:** Lợi dụng tính năng phân giải tên của Windows (LLMNR - Link Local Multicast Name Resolution và NBT-NS - NetBIOS Name Service). Kẻ tấn công lắng nghe các yêu cầu UDP broadcast và phản hồi giả mạo máy chủ đích để nhận hash NTLMv2. (Công cụ: `Responder`).
- **Cracking Kerberos:**
  - **AS-REP Roasting:** Nhắm vào các tài khoản không yêu cầu Kerberos pre-authentication. Kẻ tấn công yêu cầu TGT và nhận về gói tin mã hóa bằng mật khẩu của nạn nhân để bẻ khóa offline.
  - **Kerberoasting:** Nhắm vào Ticket Granting Service (TGS). Kẻ tấn công trích xuất hash mật khẩu của các tài khoản dịch vụ (Service accounts - SPNs) có đặc quyền cao bằng công cụ như `Rubeus` và bẻ khóa offline (bằng `hashcat`).
  - **Pass-the-ticket:** Đánh cắp vé TGT/ST (Golden ticket hoặc Silver ticket) bằng `Mimikatz` để xác thực vào các dịch vụ mà không cần mật khẩu.
- **NTLM Relay:** Chặn và chuyển tiếp (relay) các yêu cầu xác thực NTLM giữa máy khách và máy chủ để mạo danh máy khách. (Công cụ: `Responder`, `ntlmrelayx`, Metasploit).
- **Internal monologue attack:** Giống với Mimikatz nhưng không dump bộ nhớ LSASS. Dùng giao diện SSPI từ ứng dụng user-mode để tính toán phản hồi NetNTLM, từ đó bẻ khóa NTLM hash bằng rainbow tables.
- **Trojans/Spyware/Keyloggers:** Cài mã độc chạy ngầm để đánh cắp thao tác gõ phím và mật khẩu gửi về cho kẻ tấn công.
- **Các phương pháp tấn công mật khẩu khác:** Fingerprint attack (chia nhỏ passphrase thành các dấu vân tay), PRINCE attack (tạo chuỗi từ một từ điển duy nhất), Toggle-Case attack (thử mọi trường hợp chữ hoa/chữ thường), Markov-chain attack, GPU-based attack (dùng OpenGL API trên trình duyệt để đánh cắp mật khẩu).

**Tấn công online thụ động (Passive Online Attacks):**

Kẻ tấn công không giao tiếp hay thay đổi hệ thống, chỉ giám sát luồng dữ liệu mạng.

- **Wire sniffing:** Nghe lén các gói tin mạng trên lớp liên kết dữ liệu (LAN/hub) để bắt mật khẩu FTP, SMB, web, SQL dưới dạng cleartext.
- **Man-in-the-Middle (MITM) & Replay attacks:** Đứng giữa giao tiếp để nghe lén, lấy cắp token rồi phát lại (replay) giao dịch để giành quyền truy cập.

**Tấn công offline (Offline Attacks):**

Phục hồi mật khẩu từ các bản dump hash.

- **Rainbow table attack:** Kỹ thuật đánh đổi bộ nhớ và thời gian. Dùng bảng hash đã được tính toán sẵn (pre-computed hashes) để so sánh và giải mã. (Công cụ tạo bảng: `rtgen`, `RainbowCrack`).
- **Tấn công phân tán (Distributed Network Attack - DNA):** Dùng phần mềm chia nhỏ tác vụ và tận dụng sức mạnh xử lý của nhiều máy tính rảnh rỗi trên mạng để bẻ khóa mật khẩu.

## 2. Các công cụ (Tools)

**Công cụ password spraying và brute-force:**

- `thc-hydra` (ví dụ: `hydra -l <login> -p <password> ftp://localhost/` hoặc dùng list: `-L <logins.txt> -P <passwords.txt>`).
- Metasploit
- Rubeus
- adfsbrute
- CrackMapExec

**Mask attack (Tấn công theo mặt nạ):**

Là dạng brute-force nhưng dựa trên mẫu mật khẩu được biết trước để giảm thời gian bẻ khóa.

- Sử dụng công cụ `hashcat`. (Ví dụ: `hashcat -a 3 -m 0 md5_hashes.txt ?l?l?l?d?d?d`).
  - `-a 3`: Chế độ brute-force/mask attack.
  - `-m`: Chỉ định hash mode (0 = MD5).
- Sử dụng các Charsets tích hợp như `?l` (chữ thường), `?u` (chữ hoa), `?d` (số), `?s` (ký tự đặc biệt).

**Công cụ kiểm tra mật khẩu mặc định (Default Passwords):**

Dùng để tra cứu mật khẩu thiết lập sẵn của nhà sản xuất (router, switch, thiết bị mạng).

- fortypoundhead.com
- cirt.net
- routerpasswords.com
- default-password.info

**Công cụ phục hồi mật khẩu (Password Recovery Tools):**

Dùng để phá các mật khẩu phức tạp, bẻ khóa file hoặc Windows:

- Elcomsoft Distributed Password Recovery
- Passware Kit Forensic
- hashcat
- PCUnlocker
- Lazesoft Recover My Password
- Passper WinSenior

**Công cụ bẻ mật khẩu (Password Cracking Tools):**

- L0phtCrack (Kiểm toán và phục hồi Windows password)
- THC Hydra
- RainbowCrack
- hashID, Patator, brutus, BruteX, Secure Shell Bruteforcer

**Công cụ phát hiện LLMNR/NBT-NS poisoning:**

- `Vindicate`: Khai thác Windows event log để phát hiện sớm các vụ giả mạo name service.
- `Respounder`: Phát hiện các host độc hại đang chạy Responder trên mạng (như Wi-Fi công cộng).
- `got-responded`: Kiểm tra spoofing mà không gửi đi thông tin xác thực SMB giả mạo.

## 3. Password salting (Muối mật khẩu)

Kỹ thuật thêm một chuỗi ký tự ngẫu nhiên (salt) vào mật khẩu trước khi tính toán hash. Việc này làm tăng độ khó cho kẻ tấn công, phá vỡ hiệu quả của các cuộc tấn công bằng pre-computed hash (như Rainbow table) vì cùng một mật khẩu nhưng sẽ sinh ra các chuỗi hash khác nhau dựa trên "muối" khác nhau.

## 4. Khai thác lỗ hổng (Vulnerability Exploitation)

Khai thác lỗ hổng là việc thực thi nhiều bước phức tạp và liên kết với nhau để giành quyền truy cập vào hệ thống từ xa. Các bước cơ bản bao gồm:

1. **Xác định lỗ hổng (Identify the vulnerability):** Sử dụng các kỹ thuật footprinting, scanning, enumeration để tìm lỗ hổng trên hệ điều hành và dịch vụ.
2. **Đánh giá rủi ro liên quan (Determine the risk):** Đánh giá xem việc khai thác lỗ hổng này có duy trì được các biện pháp bảo mật trên hệ thống đích không.
3. **Xác định khả năng khai thác (Determine the capability):** Đánh giá tính khả thi để đạt quyền truy cập từ xa.
4. **Phát triển exploit (Develop the exploit):** Lấy mã khai thác từ các trang web hoặc tự phát triển bằng Metasploit.
5. **Chọn phương pháp chuyển payload (Select the method for delivering):** Phân phối mã độc qua local (nếu đã có quyền truy cập trước) hoặc remote (qua mạng).
6. **Tạo và chuyển payload (Generate and deliver the payload):** Bơm shellcode độc hại vào mục tiêu bằng social engineering hoặc tấn công mạng.
7. **Đạt quyền truy cập từ xa (Gain remote access):** Chạy các lệnh kiểm soát hệ thống.

**Nguồn exploit (Exploit Sites):**

Các kho lưu trữ mã khai thác (PoC) dùng để nghiên cứu hoặc thực hiện tấn công:

- **Exploit Database (ExploitDB):** https://www.exploit-db.com
- **VulDB:** Đánh giá các lỗ hổng dựa trên xác suất khai thác cao nhất https://vuldb.com.
- **OSV.dev:** Cơ sở dữ liệu và hạ tầng phân loại lỗ hổng cho các dự án mã nguồn mở (open-source).
- **MITRE CVE:** https://www.cve.org - Cơ sở dữ liệu chứa chi tiết các lỗ hổng mới nhất theo chuẩn mã CVE.
- **Windows Exploit Suggester - Next Generation (WES-NG):** Công cụ dựa trên Python, sử dụng lệnh `systeminfo > systeminfo.txt` để so sánh và gợi ý các lỗ hổng (KBs/Patches bị thiếu) đi kèm với mã khai thác phù hợp trên môi trường Windows. Lệnh: `wes systeminfo.txt`.

## 5. Metasploit Framework

Metasploit Framework là một nền tảng phát triển mã khai thác (exploit) hỗ trợ tự động hóa hoàn toàn việc khai thác các máy chủ web, ứng dụng thông qua các lỗ hổng đã biết và mật khẩu yếu.

- **Exploit module:** Mô-đun cơ bản dùng để đóng gói một mã khai thác đơn lẻ. Nó chứa các trường thông tin meta được đơn giản hóa. Bằng tính năng Mixins, người dùng có thể thay đổi hành vi khai thác động, thực hiện brute force hoặc khai thác thụ động. Các bước sử dụng: Cấu hình (`Configure an Active Exploit`) -> Xác định tùy chọn (`Verify the Exploit Options`) -> Chọn mục tiêu (`Select a Target`) -> Chọn payload (`Select a Payload`) -> Khởi chạy (`Launch the Exploit`).
- **Payload module:** Thiết lập kênh liên lạc giữa Metasploit và máy nạn nhân. Chứa mã tùy ý (arbitrary code) được thực thi sau khi khai thác thành công. Payload có thể upload/download file, chụp màn hình, thu thập hash mật khẩu, và chiếm quyền điều khiển chuột/bàn phím từ xa. Phân loại (Module types):
  - **Singles:** Tự chứa và hoạt động hoàn toàn độc lập (standalone).
  - **Stagers:** Thiết lập kết nối mạng giữa kẻ tấn công và nạn nhân.
  - **Stages:** Được tải xuống bởi các stager modules.
- **Auxiliary module:** Dùng cho các hành động tùy ý, thực hiện một lần như: quét cổng (port scanning), tấn công từ chối dịch vụ (DoS), và fuzzing. Sử dụng: Dùng lệnh `show auxiliary` để liệt kê mô-đun. Dùng lệnh `run` hoặc `exploit` để chạy mô-đun.
- **NOPS module:** Tạo ra các lệnh "không hoạt động" (no-operation / NOP sled) dùng để lấp đầy bộ đệm (blocking out buffers). Ví dụ lệnh: `msf nop(opty2) > generate -t c 50` (Tạo NOP sled dài 50 byte).
- **Encoder modules:** Dùng để mã hóa payload nhằm né tránh sự phát hiện của phần mềm diệt virus (AV) và hệ thống phát hiện xâm nhập (IDS). Tính năng chính: Obfuscation (che giấu), Bypassing signature detection (vượt qua chữ ký nhận diện) và Polymorphism (Tính đa hình - thay đổi payload mỗi lần tạo để giảm tỷ lệ bị phát hiện).
- **Evasion modules:** Sửa đổi hành vi và đặc tính của payload/exploit để né tránh các hệ thống bảo mật (AV, IDS, endpoint protection). Ví dụ: `evasion/windows/windows_defender_exe` hoặc `evasion/windows/antivirus_disable`.
- **Post-exploitation modules:** Dùng sau khi đã xâm nhập thành công hệ thống để tương tác sâu hơn (thu thập thông tin, leo thang đặc quyền, duy trì truy cập, di chuyển ngang - pivoting). Ví dụ: `post/windows/gather/enum_logged_on_users`, `post/linux/gather/enum_configs`, `post/windows/manage/portproxy`.

## 6. Công cụ khai thác hỗ trợ AI (AI-Powered Vulnerability Exploitation Tools)

- **Nebula:** Công cụ hỗ trợ AI tự động hóa việc xác định và khai thác lỗ hổng bằng cách xử lý các tập dữ liệu lớn. Sử dụng Xử lý ngôn ngữ tự nhiên (NLP) để chuyển đổi các lệnh bằng ngôn ngữ tự nhiên thành các hành động kỹ thuật chính xác. Cung cấp công cụ tìm kiếm lệnh (Command Search Engine).
- **DeepExploit:** Công cụ AI hoàn toàn tự động sử dụng học sâu (mô hình mạng nơ-ron A3C - Asynchronous Advantage Actor-Critic) để xác định và khai thác lỗ hổng. Nó liên kết trực tiếp với Metasploit để thực thi các payload. Mô hình học hỏi và tối ưu hóa liên tục qua từng lần thử khai thác.

## 7. Tràn bộ đệm (Buffer overflow)

**Khái niệm:** Buffer là một vùng các vị trí nhớ liền kề được cấp phát cho một chương trình để xử lý dữ liệu runtime. Buffer overflow là lỗ hổng xảy ra khi chương trình chấp nhận nhiều dữ liệu hơn mức bộ đệm được cấp phát, khiến dữ liệu tràn ra và ghi đè lên các vị trí nhớ lân cận. Kẻ tấn công khai thác điều này để tiêm mã độc vào bộ đệm nhằm làm hỏng file, sửa dữ liệu, truy cập thông tin nhạy cảm, leo thang đặc quyền, và mở shell (shell access).

**Nguyên nhân khiến chương trình dễ bị tràn bộ đệm:**

- Không kiểm tra ranh giới đầy đủ (Boundary checks are not performed).
- Sử dụng các ngôn ngữ lập trình cũ có nhiều lỗ hổng (như C, C++).
- Dùng các hàm không an toàn/dễ bị tổn thương để kiểm tra kích thước (ví dụ: `strcpy`).
- Thiếu các thực hành lập trình tốt (thiếu validation và filtering).
- Cấp phát bộ nhớ không đúng cách và không làm sạch đầu vào (insufficient input sanitization).
- Sử dụng con trỏ truy cập vùng heap memory không an toàn.

**Các loại Buffer overflow:**

- **Stack-based overflow:** Stack dùng cho cấp phát bộ nhớ tĩnh, lưu trữ theo thứ tự "Vào sau - Ra trước" (LIFO).
  - Toán tử PUSH đẩy dữ liệu vào stack; POP lấy dữ liệu ra.
  - Nếu bị kiểm soát, attacker có thể ghi đè thanh ghi EIP (Instruction pointer) để thay thế địa chỉ trả về (return address) bằng mã độc, giúp chiếm quyền shell.
  - Các thanh ghi liên quan:
    - **EBP (Extended Base Pointer):** Lưu địa chỉ của phần tử dữ liệu đầu tiên trên stack (đầu cơ địa).
    - **ESP (Extended Stack Pointer):** Lưu địa chỉ của phần tử tiếp theo được đưa vào stack.
    - **EIP (Extended Instruction Pointer):** Lưu địa chỉ của lệnh tiếp theo cần thực thi (Rất quan trọng trong khai thác).
    - **ESI/EDI:** Source/Destination index dùng cho các thao tác chuỗi.
- **Heap-based overflow:** Heap là vùng cấp phát động tại runtime, việc cấp phát/giải phóng phải code thủ công (`malloc`/`free`).
  - Tràn xảy ra khi block bộ nhớ heap nhận dữ liệu vượt quá kích thước (ghi không kiểm tra biên).
  - Dẫn tới ghi đè các con trỏ đối tượng động (dynamic object pointers), heap headers, virtual function tables. Việc khai thác khó và không nhất quán như stack.

## 8. Khai thác Buffer overflow trên Windows

Các bước thực hiện khai thác bao gồm:

- **Perform Spiking:** Gửi các gói TCP/UDP được chế tạo đặc biệt tới server lỗ hổng để ép nó crash. Giúp phát hiện ứng dụng có bị tràn bộ đệm hay không.
  - Sử dụng Netcat: `nc -nv <Target IP> <Target Port>` để kết nối.
  - Tạo mẫu: Sử dụng công cụ để gửi lệnh tới các hàm (ví dụ: STATS hoặc TRUN) qua `generic_send_tcp`.
- **Perform Fuzzing:** Gửi một lượng lớn dữ liệu ngẫu nhiên để tràn thanh ghi EIP, nhằm xác định chính xác số lượng byte cần thiết để làm crash server. Dùng script Python lặp lệnh và nhân lên số lượng byte (ví dụ: gửi chuỗi chữ "A").
- **Identify the Offset (Xác định offset):** Tìm vị trí chính xác thanh ghi EIP bị ghi đè.
  - Dùng công cụ Ruby của Metasploit: `pattern_create.rb` để sinh chuỗi byte ngẫu nhiên.
  - Dùng `pattern_offset.rb` để nhập mã HEX bị crash từ EIP và tìm ra độ dời (offset).
- **Các bước tiếp theo:** Xác định ký tự lỗi (bad characters), tìm đúng module không có bảo vệ bộ nhớ (dùng `mona.py` trong Immunity Debugger), ghi đè thanh ghi EIP bằng địa chỉ module (`JMP ESP`), và cuối cùng sinh shellcode (bằng `msfvenom`) để chiếm root.

## 9. Vượt qua ASLR và DEP (Bypassing ASLR and DEP Security Mechanisms)

ASLR (ngẫu nhiên hóa bộ nhớ) và DEP (ngăn thực thi dữ liệu) bảo vệ hệ thống khỏi buffer overflow. Kẻ tấn công dùng các kỹ thuật sau để vượt qua:

- **Return Oriented Programming (ROP):** Kẻ tấn công tấn công vào call stack, tái sử dụng các đoạn mã hợp lệ có sẵn (gọi là gadgets - thường kết thúc bằng lệnh x86 RET) trong các thư viện (như `libc`). Chúng móc nối (chain) các gadgets này để thực thi mã độc, qua mặt DEP và Code Signing.
- **Heap spraying:** Lấp đầy vùng trống (free space) trong bộ nhớ tiến trình (heap) bằng hàng loạt bản sao của mã độc (thường kèm NOP sleds). Kỹ thuật này lấn át ASLR vì với số lượng lớn dữ liệu được "phun" vào, mã độc sẽ nằm ở một vùng nhớ dễ dự đoán.
- **JIT spraying:** Lợi dụng quá trình biên dịch JIT (Just-In-Time) trên các trình duyệt web hiện đại. Kẻ tấn công viết mã JavaScript độc hại ép JIT compiler dịch ra mã máy (machine code) tương ứng và đưa thẳng vào bộ nhớ. Phương pháp này lách qua được cả ASLR và DEP.

## 10. Exploit chaining (Chuỗi khai thác)

Exploit chaining (hay vulnerability chaining) là kỹ thuật tấn công kết hợp nhiều lỗ hổng hoặc mã khai thác nối tiếp nhau để thâm nhập mục tiêu từ gốc. Kẻ tấn công thực hiện trinh sát, đạt quyền truy cập ban đầu qua lỗ hổng thứ nhất, sau đó tiếp tục tìm kiếm và kích hoạt các lỗ hổng sâu hơn (VD: leo thang đặc quyền, hệ thống kernel) tạo thành một chuỗi khó bị các giải pháp bảo mật ngăn chặn kịp thời.

## 11. AD Domain Mapping và Post-AD Enumeration

- **AD Domain mapping với BloodHound:** BloodHound là ứng dụng web JavaScript (dùng Neo4j và C#) sử dụng lý thuyết đồ thị (graph theory) để ánh xạ kiến trúc tổng thể của domain AD. Nó giúp kẻ tấn công phát hiện các mối quan hệ ẩn, các quyền hạn chồng chéo và các chuỗi tấn công (complex attack paths) trực quan thông qua giao diện GUI.
- **Post-AD enumeration với PowerView:** PowerView là một công cụ PowerShell dùng để liệt kê và trích xuất thông tin nhạy cảm từ môi trường AD. Các đối tượng thu thập bao gồm người dùng (users), nhóm (groups), tên miền (domains), máy tính (computers), chính sách (GPOs), danh sách kiểm soát truy cập (ACLs), và liên kết ủy thác (Trusts & Forests). Các lệnh tiêu biểu:

## 12. Liệt kê AD (Post AD Enumeration) bằng PowerView

Attackers sử dụng các lệnh PowerShell (PowerView) để trích xuất thông tin nhạy cảm từ môi trường Active Directory (AD):

**Lệnh liệt kê Domain & Policy:**

- `Get-ADDomain` / `Get-NetDomain`: Lấy thông tin liên quan đến domain hiện tại, bao gồm cả các Domain Controllers (DCs).
- `Get-DomainSID`: Lấy thông tin Security ID (SID) của domain hiện tại.
- `Get-DomainPolicy`: Lấy thông tin cấu hình policy (chính sách) được sử dụng bởi domain hiện tại.
- `(Get-DomainPolicy)."SystemAccess"`: Lấy thông tin liên quan tới cấu hình policy truy cập hệ thống của domain.
- `(Get-DomainPolicy)."kerberospolicy"`: Lấy thông tin policy Kerberos của domain.
- `Get-NetDomainController`: Lấy thông tin chi tiết về Domain Controller của domain hiện tại (như OS version, roles, IP address).

**Lệnh liệt kê Users & Sessions:**

- `Get-NetUser`: Lấy thông tin chi tiết liên quan đến người dùng domain hiện tại.
- `Get-NetLoggedon -ComputerName <tên_máy>`: Lấy danh sách người dùng domain đang active (đăng nhập) trên một máy tính cụ thể.
- `Get-UserProperty -Properties pwdlastset`: Lấy thông tin ngày và giờ mật khẩu được set (cài đặt) lần cuối cho mỗi người dùng domain.
- `Find-LocalAdminAccess` / `Invoke-EnumerateLocalAdmin`: Lấy danh sách người dùng có quyền quản trị viên cục bộ (local administrative privileges) trong domain hiện tại. _(Lưu ý: Yêu cầu quyền administrator để chạy)_.
- `Get-NetSession -ComputerName <tên_máy>`: Lấy thông tin liên quan đến người dùng hiện đang đăng nhập vào máy.

## 13. Liệt kê Domain Trust và Forests

Trust relationships (Mối quan hệ tin cậy) cho phép người dùng của domain này truy cập tài nguyên của domain khác:

- **One-way trust (Trust một chiều / Unidirectional trust):** Cho phép người dùng trong một domain "được tin tưởng" (trusted domain) truy cập vào tài nguyên của một domain "đang tin tưởng" (trusting domain).
- **Two-way trust (Trust hai chiều / Bi-directional trust):** Cho phép người dùng của cả hai domain truy cập tài nguyên qua lại lẫn nhau.
- _(Lưu ý ngoài nguồn)_ **Các lệnh liệt kê Forest**:
  - `Get-NetForest`: Lấy thông tin của forest hiện tại.
  - `Get-NetForestDomain`: Lấy danh sách tất cả các domains trong forest hiện tại.

## 14. Xác định lỗ hổng bằng GhostPack Seatbelt

- **Seatbelt** là một dự án C# thực hiện các bài "kiểm tra an toàn" (safety checks) trên host. Nó thu thập thông tin cấu hình bảo mật PowerShell, Kerberos tickets, và các mục trong Recycle Bin để tìm kiếm điểm yếu.
- **Các nhóm lệnh (Command groups) chính của Seatbelt:**
  - `Seatbelt.exe -group=all`: Chạy toàn bộ các lệnh.
  - `Seatbelt.exe -group=user`: Lấy thông tin user (như FileZilla, PuttySessions, Chrome/Firefox Presence, RDPSavedConnections...).
  - `Seatbelt.exe -group=system`: Lấy thông tin hệ thống (như AntiVirus, AppLocker, DNSCache, Hotfixes, UAC, WindowsFirewall...).
  - `Seatbelt.exe -group=slack` / `-group=chromium`: Lấy thông tin từ Slack và trình duyệt Chromium.

## 15. Công cụ phát hiện Buffer Overflow / Quét lỗ hổng

- **OllyDbg:** Là một trình gỡ lỗi phân tích cấp độ hợp ngữ (assembler-level debugger) 32-bit cho Windows. Nó phân tích mã nhị phân, tự động theo dõi (traces) các khung ngăn xếp (stack frames) và quá trình thực thi chương trình, đồng thời ghi log các tham số của các hàm đã biết.
- **Veracode**, **Flawfinder**, **Kiuwan**, **Splint**, **Valgrind**: Các công cụ hỗ trợ chuyên gia bảo mật phát hiện lỗ hổng tràn bộ đệm.

## 16. Leo thang đặc quyền (Privilege Escalation)

Leo thang đặc quyền là việc lợi dụng lỗi thiết kế, lỗi lập trình hoặc cấu hình sai trong OS/Ứng dụng để đạt quyền truy cập cấp cao:

- **Horizontal privilege escalation (Leo thang đặc quyền ngang):** Người dùng trái phép cố gắng truy cập tài nguyên, chức năng thuộc quyền của một người dùng khác có cùng mức quyền (Ví dụ: User A truy cập tài khoản ngân hàng của User B). Đây không phải là tăng quyền theo ý nghĩa truyền thống.
- **Vertical privilege escalation (Leo thang đặc quyền dọc):** Người dùng trái phép cố gắng đạt được mức đặc quyền cao hơn (Ví dụ: từ user bình thường lên quyền Administrator) để thực thi code hoặc truy cập tài nguyên bị giới hạn.

**Các kỹ thuật leo thang đặc quyền cụ thể:**

1. **Khai thác lỗ hổng (Exploiting Vulnerabilities):** Sử dụng các kho lưu trữ công khai như ExploitDB (hoặc VulDB) để tra cứu và tải xuống các mã khai thác (exploits) dựa trên OS và ứng dụng mục tiêu.
2. **DLL Hijacking (Trên Windows):** Hầu hết các ứng dụng Windows không sử dụng đường dẫn đầy đủ (fully qualified path) khi gọi DLL, mà chúng tìm trong thư mục ứng dụng trước. Kẻ tấn công đặt một DLL độc hại vào thư mục ứng dụng để nó bị load thay cho DLL thật. Công cụ phát hiện: `Spartacus`, `PowerSploit`.
3. **Dylib Hijacking (Trên macOS):** Tương tự DLL Hijacking nhưng áp dụng cho thư viện động (dynamic library - dylib) trên macOS. macOS sử dụng biến môi trường `DYLD_INSERT_LIBRARIES` để tự động load thư viện. Công cụ phát hiện: `Dylib Hijack Scanner`.
4. **Spectre và Meltdown:** Là lỗ hổng nằm trong thiết kế chip CPU (Intel, AMD, ARM). Lợi dụng các tính năng tối ưu hóa CPU như thực thi suy đoán (speculative execution) và bộ đệm (caching).
   - **Spectre:** Ép CPU đọc các vùng nhớ lân cận vượt quá giới hạn (out-of-bounds), có thể đọc được bộ nhớ kernel.
   - **Meltdown:** Cho phép tiến trình không đặc quyền (unprivileged process) đọc vùng nhớ của kernel hoặc bộ nhớ vật lý.
5. **Named Pipe Impersonation (Trên Windows):** Named pipes được Windows dùng để giao tiếp hợp pháp giữa các tiến trình đang chạy (pipe server và pipe client). Kẻ tấn công tạo một pipe server với ít đặc quyền và dụ một client (có đặc quyền cao hơn) kết nối vào, sau đó mạo danh (impersonate) client đó. Metasploit có module sử dụng lệnh `getsystem` để mạo danh và chiếm quyền admin.
6. **Cấu hình dịch vụ sai (Misconfigured Services):**
   - **Unquoted service paths (Đường dẫn dịch vụ không có dấu ngoặc kép):** Khi đường dẫn chứa khoảng trắng nhưng không được đặt trong dấu ngoặc kép (Vd: `C:\Program Files\...`), Windows sẽ cố gắng thực thi các phần của đường dẫn. Kẻ tấn công chèn một tệp thực thi độc hại (VD: `C:\Program.exe`) vào giữa đường dẫn để nó được chạy với quyền SYSTEM.
   - **Service object permissions (Quyền đối tượng dịch vụ):** Quyền dịch vụ bị cấu hình lỏng lẻo cho phép attacker sửa đổi thuộc tính dịch vụ, thay đổi tệp nhị phân thực thi, thêm người dùng mới vào nhóm local admin và chiếm tài khoản.
   - _(Lưu ý ngoài nguồn)_ **Unattended Installs:** Quá trình cài đặt tự động lưu lại tệp `Unattend.xml` (tại `C:\Windows\Panther\` v.v.) có thể chứa thông tin cấu hình và mật khẩu giải mã được.
7. **Misconfigured NFS (Leo thang qua NFS):** NFS dùng cổng 2049. Nếu cấu hình sai, attacker có thể truy cập file hệ thống và chiếm quyền root. Các lệnh khai thác:
   - `nmap -sV <Target IP Address>`: Kiểm tra dịch vụ NFS.
   - `sudo apt-get install nfs-common`: Cài đặt gói hỗ trợ tương tác NFS.
   - `showmount -e <Target IP Address>`: Kiểm tra danh sách thư mục có thể mount.
   - `mkdir /tmp/nfs`: Tạo thư mục cục bộ.
   - `sudo mount -t nfs <Target IP Address>:/<Share Directory> /tmp/nfs`: Mount thư mục đích về máy attacker.
8. **Bypass User Account Control (UAC):** Sử dụng các công cụ/kỹ thuật để lách thông báo UAC của Windows, bao gồm:
   - Sử dụng Metasploit (`exploit/windows/local/bypassuac`).
   - **Memory injection (`bypassuac_injection`):** Chèn DLL trực tiếp vào bộ nhớ.
   - **FodHelper registry key:** Đánh cắp registry key đặc biệt và gắn vào `fodhelper.exe`.
   - **Eventvwr registry:** Dùng để chạy custom commands khi Event Viewer được khởi chạy.
   - **COM handler hijacking:** Tạo các entry trong user hive để tải DLL độc hại.
9. **Abusing Boot or Logon Initialization Scripts (Lạm dụng kịch bản khởi động/đăng nhập):** Chèn mã độc vào các kịch bản tự động chạy khi máy tính khởi động hoặc người dùng đăng nhập để duy trì quyền truy cập (persistence) và leo thang.
   - **Logon script (Windows):** Chèn đường dẫn script vào registry key `HKEY_CURRENT_USER\Environment\UserInitMprLogonScript`.
   - **Logon script (macOS):** Chèn payload vào login hooks.
   - **Network logon scripts:** Bị lạm dụng thông qua việc cấu hình Active Directory hoặc GPOs.
   - **RC scripts (Unix):** Chèn binary độc hại hoặc shell vào các tệp như `rc.common` hoặc `rc.local`. Khi hệ thống reboot, attacker sẽ nhận được quyền root.
   - **Startup items (macOS):** Tạo tệp độc hại trong thư mục `/Library/StartupItems`.

## 17. Pivoting và Relaying

Kỹ thuật dùng để tấn công các máy tính sâu bên trong mạng (External Machines) thông qua một máy đã bị chiếm quyền trước đó.

- **Pivoting (Xoay vòng):** Vượt tường lửa bằng cách lấy máy đã bị chiếm quyền làm "bàn đạp" (pivot) để quét và tấn công các hệ thống khác.
  - Các bước: Khám phá host (`run post/windows/gather/arp_scanner`) -> Thiết lập luật định tuyến (`route add ...`) -> Quét cổng (`use auxiliary/scanner/portscan/tcp`) -> Khai thác dịch vụ.
- **Relaying (Chuyển tiếp):** Khác với Pivoting, Relaying thiết lập Port Forwarding (Chuyển tiếp cổng) để truy cập trực tiếp vào các tài nguyên của hệ thống bên trong (như HTTP, SSH) ngay trên máy của attacker.
  - Các bước: Đặt luật port forwarding (`portfwd add -l 10080 -p 80 -r <IP>`) -> Truy cập tài nguyên (`http://localhost:10080` hoặc `ssh myadmin@localhost`).

## 18. Thay đổi Group Policy để leo thang (Privilege Escalation by Modifying Domain Policy) [Trang 796]

- Group Policy quản lý cấu hình, tài nguyên và khóa registry. Mặc định mọi người dùng đều có quyền đọc GPO. Kẻ tấn công có thể sửa đổi chính sách tên miền để tạo tài khoản mới, sửa công cụ nội bộ hoặc trích xuất mật khẩu bản rõ.
- **Sửa `ScheduledTasks.xml`:** Kẻ tấn công sửa đổi tệp theo đường dẫn `<GPO_PATH>\Machine\Preferences\ScheduledTasks\ScheduledTasks.xml` để tạo một tác vụ/công việc độc hại được lên lịch bằng cách sử dụng các script như `New-GPOImmediateTask`.

## 19. Sửa đổi Domain trust (Domain Trust Modification) [Trang 796 - 797]

- Các đối tượng Domain trust cung cấp thông tin về thông tin xác thực, tài khoản, cơ chế xác thực và ủy quyền.
- Kẻ tấn công sử dụng tiện ích `nltest /domain_trusts` (Lệnh đầy đủ: `C:\Windows\system32>nltest /domain_trusts`) để thu thập thông tin về các domain đáng tin cậy.
- Sau đó, chúng sửa đổi cài đặt của các domain trust hiện có để leo thang đặc quyền thông qua các cuộc tấn công Kerberoasting và pass-the-ticket.

## 20. Tấn công DCSync (DCSync Attack) [Trang 797 - 799]

- DCSync là kỹ thuật nhắm vào các Domain Controller (DC) có chọn lọc. Kẻ tấn công ban đầu phải chiếm được quyền truy cập tài khoản đặc quyền có quyền nhân bản tên miền (domain replication rights).
  - **Quyền yêu cầu:** Replicating Directory Changes, Replicating Directory Changes All, Replicating Directory Changes In Filtered Set.
- Kẻ tấn công kích hoạt các giao thức nhân bản để tạo một DC ảo, sau đó gửi lệnh `GetNCChanges` yêu cầu DC thật đồng bộ thông tin, từ đó lấy được hash mật khẩu NTLM của nạn nhân.
- **Công cụ:** Kẻ tấn công sử dụng mimikatz thông qua giao thức MS-DRSR với lệnh: `mimikatz "lsadump::dcsync /domain:<domain name> /user:Administrator"`.

## 21. Leo thang đặc quyền qua Active Directory Certificate Services (ADCS) [Trang 800 - 802]

- ADCS được triển khai rộng rãi để quản lý chứng chỉ trong môi trường AD (hạ tầng PKI).
- Các template ADCS bị cấu hình sai có thể bị lợi dụng để đánh cắp thông tin xác thực, leo thang tên miền và thiết lập duy trì truy cập.
- **Công cụ Certipy:** Dùng để xác định và lạm dụng các cấu hình ADCS sai. Lệnh liệt kê cấu hình: `certipy find -u '<target user>@<domain name>' -p <password> -dc-ip <DC_IP> -vulnerable -enabled`.
- Lỗ hổng nổi bật là **ESC1**, cho phép người dùng có quyền hạn chế được đăng ký và yêu cầu chứng chỉ cho bất kỳ đối tượng domain nào (ví dụ: xin chứng chỉ giả mạo Domain Administrators).

## 22. Các kỹ thuật leo thang khác (Other Privilege Escalation Techniques) [Trang 802 - 810]

- **Access Token manipulation** [Trang 802]: Sửa đổi access token (chứa hồ sơ danh tính và quyền của tiến trình) để giả mạo thành người dùng khác (sử dụng lệnh `runas` hoặc tạo token giả mạo).
- **Parent PID spoofing** [Trang 803]: Qua mặt các công cụ theo dõi bằng cách giả mạo ID tiến trình cha (PPID) khi sinh ra một tiến trình mới.
- **Application shimming** [Trang 803]: Lợi dụng Windows Application Compatibility Framework (Shims) dùng để chạy phần mềm cũ trên OS mới. Kẻ tấn công dùng shims để vô hiệu hóa Windows Defender, leo thang quyền hoặc cài backdoor.
- **Filesystem permission weakness** [Trang 803]: Nếu quyền của tệp nhị phân hệ thống bị cấu hình lỏng lẻo, kẻ tấn công sẽ thay thế nó bằng tệp độc hại. Tiến trình chạy tệp này sẽ thực thi mã độc dưới quyền SYSTEM.
- **Path interception** [Trang 804]: Đặt một tệp thực thi vào một đường dẫn cụ thể (khai thác unquoted paths, sai biến môi trường) để ứng dụng thực thi tệp độc hại thay vì mục tiêu hợp pháp.
- **Abusing accessibility features** [Trang 804]: Lạm dụng các tính năng trợ năng kích hoạt từ màn hình khóa (chưa cần đăng nhập). Thay thế các tệp nhị phân như `osk.exe` (On-screen keyboard), `Magnify.exe` (Magnifier), `Narrator.exe`, `DisplaySwitch.exe`, `AtBroker.exe`, hoặc `sethc.exe` (Sticky keys) bằng `cmd.exe` để lấy system-level shell.
- **SID-History injection** [Trang 804]: SID-history lưu SID cũ khi người dùng chuyển domain. Kẻ tấn công tiêm SID của administrator vào thuộc tính SID-history của tài khoản bị xâm phạm để truy cập tài nguyên bị giới hạn.
- **COM hijacking** [Trang 805]: Thao túng Component Object Model (COM). Tạo đối tượng người dùng độc hại dưới registry `HKEY_CURRENT_USER\Software\Classes\CLSID\` hoặc tráo đổi DLL hợp pháp để mã độc tự chạy khi đối tượng COM được gọi.
- **Scheduled tasks (Windows: Task Scheduler; Linux: cron)** [Trang 805]:
  - **Windows:** Lạm dụng lệnh `at` và `schtasks` qua Task Scheduler hoặc thông qua RPC.
  - **Linux:** Lạm dụng tiện ích `cron`/`crond` bằng cách sửa đổi các tập lệnh thực thi tại `/etc/crontab`.
- **Launch Daemon (macOS launchd)** [Trang 806]: Tạo hoặc sửa đổi các tệp plist (property list) tại `/System/Library/LaunchDaemons` và `/Library/LaunchDaemons` để chạy bản nhị phân độc hại mỗi khi khởi động.
- **plist modification (macOS)** [Trang 806]: Sửa file plist tại `/Library/Preferences` hoặc `~/Library/Preferences` để thực thi mã độc nhân danh một người dùng hợp pháp.
- **Setuid/Setgid (Linux/macOS)** [Trang 806]: Lợi dụng các ứng dụng có cờ setuid/setgid để thực thi mã độc với đặc quyền của người sở hữu (thường là root).
- **Web shell** [Trang 807]: Kịch bản dựa trên web (web-based script) cho phép truy cập vào máy chủ web như một backdoor để duy trì quyền truy cập bền bỉ và leo thang.
- **Abusing sudo rights** [Trang 807]: Lợi dụng quyền sudo hợp lệ của người dùng để ghi đè lên các tệp tin hệ thống như `/etc/sudoers` hoặc `/etc/shadow` bằng file độc hại của kẻ tấn công.
- **Abusing SUID/SGID permissions (Unix)** [Trang 807]: Tìm và lạm dụng các lệnh có cờ SUID/SGID để sinh shell root. Ví dụ các lệnh: `nmap`, `vim`, `less`, `more`, `bash`, `cat`, `cp`, `echo`, `find`, `nano`. Lệnh dò tìm: `find / -perm -u=s -type f 2>/dev/null`.
- **Abusing '.' path** [Trang 808]: Nếu biến môi trường `PATH` chứa dấu `.` (thư mục hiện tại), kẻ tấn công tạo một tệp mã độc trùng tên với lệnh hệ thống (vd: `ls`) ngay tại thư mục nạn nhân đang đứng để lừa họ thực thi nó.
- **Abusing macOS elevation mechanisms** [Trang 808]: Lạm dụng API `AuthorizationExecuteWithPrivileges` (thiếu xác minh nguồn gốc) để cài đặt phần mềm độc hại yêu cầu quyền root.
- **Process injection via ptrace** [Trang 809]: Sử dụng lệnh gọi hệ thống `ptrace` để gỡ lỗi và ghi mã tùy ý vào tiến trình đang chạy (dùng `malloc`, `PTRACE_SETREGS`, `PTRACE_POKETEXT` hoặc `PTRACE_POKEDATA`) để leo thang đặc quyền.
- **Abusing Microsoft Software Installer (MSI)** [Trang 809]: Lạm dụng tính năng Custom Actions (kịch bản tùy chỉnh) trong gói cài đặt `.msi` chạy dưới quyền `NT AUTHORITY\SYSTEM` để thực thi mã tùy ý.
- **Abusing Windows Filtering Platform (WFP) — NoFilter attack** [Trang 809]: Kỹ thuật NoFilter khai thác WFP trên Windows 11. Kẻ tấn công gọi phương thức `BfeRpcOpenToken` qua WinAPI để lấy bản sao token truy cập mức hệ thống (duplication qua thành phần WfpAle hoặc kết nối IPsec) và chiếm quyền `NT AUTHORITY\SYSTEM`.

## 23. Công cụ leo thang đặc quyền (Privilege Escalation Tools) [Trang 810 - 813]

- **BeRoot** [Trang 810]: Công cụ hậu khai thác kiểm tra các cấu hình sai phổ biến (quyền dịch vụ, thư mục có thể ghi, khóa registry startup) để tìm cách leo thang.
- **pwncat** [Trang 811]: Công cụ định vị và khai thác lỗ hổng bằng hai lệnh chính:
  - `pwncat$ escalate list`: Xác định các vector/tùy chọn leo thang.
  - `pwncat$ escalate run`: Kích hoạt và thực thi quá trình leo thang.
- **PowerSploit, Traitor, PEASS-ng, FullPowers** [Trang 813]: Các công cụ hỗ trợ rà soát và tự động hóa leo thang.

## 24. Bảo vệ chống DLL/Dylib hijacking (Tools for Defending against DLL and Dylib Hijacking) [Trang 818 - 819]

- **Dependency Walker** [Trang 818]: Công cụ phát hiện các vấn đề ứng dụng phổ biến như mô-đun bị thiếu (missing modules), mô-đun không hợp lệ (invalid modules), lỗi không khớp import/export, và lỗi phụ thuộc vòng tròn (circular dependency errors).
- **Dylib Hijack Scanner** [Trang 818 - 819]: Tiện ích đơn giản quét máy tính macOS để tìm các ứng dụng dễ bị tấn công dylib hijacking hoặc đã bị chiếm đoạt (hijacked).
- _(Nguồn bổ sung thêm các công cụ phòng thủ khác như: DLL Hijack Audit Kit, DLLSpy)._

## 25. Duy trì truy cập (Maintaining Access) [Trang 824 - 825, 829, 842]

Sau khi giành quyền truy cập và leo thang đặc quyền, kẻ tấn công cố gắng biến hệ thống bị xâm phạm thành "bàn đạp" (launchpad) để duy trì và tấn công các hệ thống khác.

- **Backdoors (Cửa sau)** [Trang 825]: Các chương trình được thiết kế để từ chối hoặc làm gián đoạn hoạt động, thu thập thông tin dẫn đến khai thác hoặc giúp giành quyền truy cập trái phép vào tài nguyên hệ thống (thiết lập hoán vị truy cập, duy trì cửa sau).
- **Crackers** [Trang 825]: Các thành phần phần mềm hoặc chương trình được thiết kế chuyên biệt để bẻ khóa mã hóa hoặc bẻ mật khẩu.
- **Keyloggers** [Trang 825, 829]: Có thể là phần cứng hoặc phần mềm. Mục tiêu là ghi lại bí mật từng thao tác gõ phím trên bàn phím máy tính để đánh cắp email ID, mật khẩu, chi tiết ngân hàng, tin nhắn.
- **Spyware (Phần mềm gián điệp)** [Trang 825, 842]: Phần mềm giám sát lén lút thu thập thông tin người dùng. Có thể chụp screenshot (ảnh màn hình), kích hoạt micro/webcam bí mật, thu thập cấu hình mạng/hệ thống và gửi chúng đến vị trí được hacker chỉ định.

## 26. Kỹ thuật thực thi mã từ xa (Remote Code Execution - RCE Techniques) [Trang 826]

Kẻ tấn công sử dụng nhiều chiến thuật để thực thi mã độc trên một hệ thống từ xa sau khi đã xâm phạm hệ thống ban đầu.

- **Exploitation for Client Execution (Khai thác để thực thi trên máy khách)** [Trang 826]: Khai thác các hành vi mã hóa không an toàn trong phần mềm ứng dụng khách. Bao gồm các loại sau:
  - **Web-Browser-Based Exploitation:** Nhắm vào trình duyệt web thông qua các liên kết spear phishing (lừa đảo mục tiêu) và drive-by compromise (thỏa hiệp tải xuống tự động). Nạn nhân bị lừa truy cập vào trang web do kẻ tấn công kiểm soát để kích hoạt khai thác mà không cần sự can thiệp trực tiếp của người dùng.
  - **Office-Applications-Based Exploitation:** Nhắm vào các ứng dụng văn phòng phổ biến (như Microsoft Office). Kẻ tấn công gửi email chứa liên kết đến các tệp/tài liệu độc hại. Để khai thác hoạt động, người dùng cuối (end-users) bắt buộc phải tự mở tài liệu hoặc tệp độc hại đó.
  - _(Bổ sung từ nguồn)_ **Third-Party Applications-Based Exploitation:** Khai thác các ứng dụng của bên thứ ba được triển khai trên hệ thống (ví dụ: Adobe Reader, Flash).
