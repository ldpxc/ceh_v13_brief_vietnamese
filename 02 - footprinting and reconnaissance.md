## Mạng TCP/IP

### 1. Giao thức UDP (User Datagram Protocol) - Trang 319 & 337

- UDP có đặc điểm là giao thức không kết nối (connectionless), không thực hiện quá trình bắt tay ba bước (three-way handshake) như TCP, do đó việc quét UDP khó khăn hơn vì hệ thống thường không phản hồi nếu không có ứng dụng lắng nghe.
- Các giao thức phổ biến sử dụng qua UDP (được liệt kê trong bảng cổng và dịch vụ) bao gồm: **DNS** (cổng 53/udp), **DHCP/bootps-bootpc** (cổng 67-68/udp), và **TFTP** (cổng 69/udp).

### 2. Cấu trúc phân đoạn TCP (TCP Communication Flags) - Trang 286-287

Tiêu đề TCP chứa 6 cờ (mỗi cờ kích thước 1 bit) để kiểm soát việc truyền dữ liệu và quản lý kết nối:

- **`SYN` (Synchronize)**: Thông báo việc truyền một số thứ tự (sequence number) mới. Cờ này đại diện cho việc thiết lập kết nối (three-way handshake) ban đầu giữa hai máy chủ.
- **`ACK` (Acknowledgement)**: Xác nhận đã nhận được dữ liệu truyền và xác định số thứ tự dự kiến tiếp theo. Khi hệ thống nhận được gói tin thành công, nó đặt giá trị cờ này thành "1" (Được đặt trên mọi phân đoạn sau gói SYN ban đầu).
- **`RST` (Reset)**: Khi có lỗi trong kết nối hiện tại, cờ này được đặt thành "1" và kết nối sẽ bị hủy bỏ (aborted) hoặc buộc chấm dứt ngay lập tức để phản hồi lại lỗi.
- **`FIN` (Finish)**: Được đặt thành "1" để thông báo rằng sẽ không có thêm dữ liệu nào được gửi đi nữa và tiến hành đóng kết nối đã được thiết lập bởi cờ SYN.
- **`URG` (Urgent)**: Hướng dẫn hệ thống xử lý dữ liệu chứa trong gói càng sớm càng tốt (dữ liệu ưu tiên/ngoài luồng). Hệ thống sẽ ưu tiên xử lý dữ liệu khẩn cấp này trước và mọi quá trình xử lý dữ liệu khác bị dừng lại.

### 3. Số thứ tự SYN (Initial Sequence Numbers - ISNs) - Trang 419

Hầu hết các thiết bị chọn số thứ tự ban đầu (ISN) dựa trên bộ đếm thời gian, do đó kẻ tấn công có thể xác định và dự đoán được ISN của kết nối TCP tiếp theo bằng cách phân tích ISN của phiên hiện tại. Nếu dự đoán được ISN, kẻ tấn công có thể thiết lập một kết nối độc hại hoặc quét mạng. Do đó, hệ thống cần sử dụng số thứ tự ban đầu ngẫu nhiên (**Random ISNs**) để đảm bảo tính hợp lệ, duy nhất và tránh rủi ro giả mạo phiên.

### 4. Quá trình thiết lập và kết thúc phiên TCP (Three-way Handshake) - Trang 288-289

TCP ưu tiên thiết lập kết nối trước khi truyền dữ liệu qua cơ chế bắt tay ba bước. Các trạng thái liên quan bao gồm:

- **Bước 1**: Nguồn gửi một gói `SYN` đến đích để khởi tạo.
- **Bước 2**: Khi nhận được gói `SYN`, đích phản hồi bằng cách gửi lại gói `SYN/ACK`.
- **Bước 3**: Nguồn gửi một gói `ACK` để xác nhận đã nhận được gói `SYN/ACK`, chính thức "MỞ" kết nối cho đến khi một gói `FIN` hoặc `RST` được gửi để đóng phiên.

### Công cụ tạo gói (Packet crafting tools):

- **NetScanTools**: Một bộ công cụ điều tra tích hợp nhiều tiện ích mạng, cho phép tạo và gửi gói tin để trích xuất thông tin.
- **Ostinato**: Công cụ tạo và phát lưu lượng mạng (traffic generator) mã nguồn mở, cho phép xây dựng và gửi các gói tin tùy chỉnh để kiểm thử mạng và hệ thống bảo mật.
- **packETH**: Công cụ tạo và chỉnh sửa gói tin Ethernet ở mức thấp (Layer 2), cho phép thao tác trực tiếp trên dữ liệu dạng hex và gửi packet thủ công.
- **LANforge FIRE**: Nền tảng kiểm thử mạng chuyên nghiệp, hỗ trợ tạo lưu lượng lớn để đánh giá hiệu năng, stress test và kiểm tra hệ thống mạng (có bản thương mại).
- **Colasoft Packet Builder**: Hỗ trợ tạo các gói tin mạng tùy chỉnh, thay đổi tham số trong bộ giải mã (decoder), hệ thập lục phân (hex) hoặc ASCII, lưu và gửi gói tin thẳng vào mạng.

Các trạng thái liên quan: `SYN`, `SYN/ACK`, `ACK`, `FIN`.

- **SYN (Synchronize):** Cờ dùng để bắt đầu kết nối TCP, client gửi SYN để yêu cầu thiết lập kết nối.
- **SYN/ACK (Synchronize/Acknowledge):** Server phản hồi SYN bằng SYN/ACK để xác nhận yêu cầu và đồng ý thiết lập kết nối.
- **ACK (Acknowledge):** Cờ xác nhận đã nhận dữ liệu hoặc hoàn tất một bước trong quá trình bắt tay TCP.
- **FIN (Finish):** Cờ dùng để kết thúc kết nối TCP, báo hiệu một bên muốn đóng phiên giao tiếp.

- **Internet Assigned Numbers Authority (IANA):** Tổ chức quản lý và duy trì các registry chính thức như số cổng (port numbers), tên dịch vụ và giao thức trên Internet. — danh sách chính thức các đăng ký số cổng.

## Thu thập dấu vết / trinh sát (Footprinting / Reconnaissance) (Trang 125 - 126)

Thu thập dấu vết (Footprinting) là quá trình thu thập thông tin về mạng và môi trường của mục tiêu để tìm kiếm cơ hội xâm nhập. Các loại trinh sát được phân thành:

- **Thụ động (Passive Footprinting):** Thu thập thông tin mà không có sự tương tác trực tiếp với mục tiêu, rất hữu ích khi kẻ tấn công không muốn bị phát hiện. Phương pháp này bao gồm: thu thập tình báo nguồn mở (OSINT), sử dụng cơ sở dữ liệu độc quyền hoặc dịch vụ trả phí, và chia sẻ thông tin tình báo với các nhóm hoặc tổ chức đối tác.
- **Chủ động (Active Footprinting):** Đòi hỏi sự tương tác trực tiếp với mục tiêu. Hệ thống mục tiêu có thể phát hiện quá trình này vì kẻ tấn công tương tác công khai với mạng lưới. Phương pháp bao gồm: tra cứu/truy vấn DNS, social engineering, quét mạng/cổng (network/port scanning), và liệt kê dịch vụ/người dùng.

### Thông tin thu thập được từ Footprinting (Trang 127 - 128)

- **Thông tin tổ chức (Organization Information)**: Chi tiết nhân viên (tên, chức vụ, kinh nghiệm, địa chỉ liên hệ, điện thoại), thông tin chi nhánh, đối tác, liên kết web, lịch sử tổ chức, công nghệ web, thông cáo báo chí, tài liệu pháp lý, bằng sáng chế và nhãn hiệu.
- **Thông tin mạng (Network Information)**: Tên miền, domain phụ, khối mạng (network blocks), cấu trúc liên kết mạng (network topology), thông tin router/firewall tin cậy, địa chỉ IP của các hệ thống có thể tiếp cận, bản ghi Whois và bản ghi DNS.
- **Thông tin hệ thống (System Information)**: Hệ điều hành máy chủ web (Web server OS), vị trí máy chủ web, địa chỉ email công khai, tên người dùng và mật khẩu (usernames/passwords).

### Mục tiêu và Mối đe dọa của Footprinting (Trang 128 - 129)

- **Mục tiêu**: Xây dựng chiến lược tấn công, tìm ra điểm yếu nhất trong hệ thống bảo mật (weakest link) và xây dựng cơ sở dữ liệu thông tin về mục tiêu.
- **Mối đe dọa (Footprinting Threats)**: Kỹ nghệ xã hội (Social Engineering), Tấn công hệ thống và mạng (System and Network Attacks), Rò rỉ thông tin (Information Leakage), Mất quyền riêng tư (Privacy Loss), Gián điệp doanh nghiệp (Corporate Espionage), Thất thoát doanh thu (Business Loss).

### Google advanced search operators (Toán tử tìm kiếm nâng cao của Google) (Trang 132 - 134)

Kẻ tấn công sử dụng các toán tử này để tạo ra các truy vấn phức tạp nhằm trích xuất thông tin nhạy cảm hoặc bị ẩn.

- `cache:` Hiển thị trang web được lưu trong bộ nhớ cache của Google thay vì phiên bản hiện tại của trang.
- `link:` Liệt kê các trang web có chứa liên kết trỏ tới URL hoặc trang web được chỉ định.
- `related:` Hiển thị các trang web tương tự hoặc có liên quan đến trang web được chỉ định.
- `info:` Hiển thị một số thông tin mà Google có được về một trang web cụ thể.
- `site:` Giới hạn kết quả tìm kiếm chỉ trong một trang web hoặc tên miền cụ thể.
- `allintitle:` Giới hạn kết quả trả về chỉ các trang web có chứa tất cả các từ khóa tìm kiếm nằm trong tiêu đề (title).
- `intitle:` Giới hạn kết quả trả về chỉ các tài liệu có chứa từ khóa tìm kiếm nằm trong tiêu đề.
- `allinurl:` Giới hạn kết quả trả về chỉ những trang có chứa tất cả các từ khóa tìm kiếm nằm trong URL.
- `inurl:` Giới hạn kết quả trả về chỉ những tài liệu có chứa từ khóa được chỉ định trong URL.
- `location:` Tìm thông tin cho một vị trí địa lý cụ thể.
- `filetype:` Tìm kiếm kết quả dựa trên một phần mở rộng tệp tin cụ thể (ví dụ: `filetype:pdf`).
- `source:` Hiển thị thông tin từ một trang web cụ thể trên Google News.
- `phonebook:` Tìm số điện thoại dân cư và doanh nghiệp của một cá nhân hoặc tổ chức.
- `before:` Lọc kết quả tìm kiếm chỉ bao gồm nội dung được xuất bản trước một ngày nhất định (ví dụ: `before:2020-06-29`).
- `after:` Lọc kết quả tìm kiếm chỉ bao gồm nội dung được xuất bản sau một ngày nhất định.
- `inanchor:` Giới hạn kết quả tìm kiếm chỉ những trang chứa từ khóa được chỉ định trong văn bản neo (anchor text) của các liên kết trỏ đến trang đó. (Ví dụ: [Anti-virus inanchor:Norton]).
- `allinanchor:` Giới hạn kết quả tìm kiếm chỉ những trang chứa tất cả các từ khóa được chỉ định trong văn bản neo của các liên kết. (Ví dụ: [allinanchor: best cloud service provider]).

### Hacker có thể làm gì với Google Hacking? (Trang 135)

Bằng cách sử dụng các toán tử Google, kẻ tấn công có thể phát hiện các trang web và máy chủ dễ bị tấn công (SQL injection, buffer overflow) và trích xuất thông tin nhạy cảm. Các thông tin có thể thu thập gồm:

- Thông báo lỗi chứa thông tin nhạy cảm, tệp chứa mật khẩu, các thư mục nhạy cảm.
- Các trang chứa cổng đăng nhập (logon portals).
- Dữ liệu cấu hình, log tường lửa, IDS.
- Mã nguồn ứng dụng web, thông tin phiên bản phần mềm.
- Thiết bị IoT và bảng điều khiển (control panels) không được bảo vệ.
- Các trang web bị ẩn (Intranet, dịch vụ VPN).

### Footprinting bằng AI & Cơ sở dữ liệu Google Hacking (GHDB) (Trang 137 - 143)

- **Khai thác Google Hacking với AI**: Kẻ tấn công có thể sử dụng các công nghệ AI (như ChatGPT hoặc ShellGPT) để tự động hóa việc tìm kiếm. Ví dụ một prompt: _"Use filetype search operator to obtain pdf files on the target website eccouncil.org and store the result in the recon1.txt file"_. AI có thể trả về các lệnh shell nâng cao (như dùng `lynx --dump` kết hợp `grep` và `cut`) để cào dữ liệu nhanh chóng.
- **Google Hacking Database (GHDB)**: Là cơ sở dữ liệu truy vấn giúp tìm kiếm các thông tin nhạy cảm vô tình bị lộ. Các dorks thường tìm: Sensitive files, Exposed directories, Error messages, Vulnerable devices.
- **Các danh mục của Cơ sở dữ liệu Google Hacking (Google Hacking Database Categories):** Footholds (Bàn đạp), Files Containing Usernames (Tệp chứa tên người dùng), Sensitive Directories (Thư mục nhạy cảm), Web Server Detection (Phát hiện máy chủ web), Vulnerable Files (Tệp dễ bị tổn thương), Vulnerable Servers (Máy chủ dễ bị tổn thương), Error Messages (Thông báo lỗi), Files Containing Juicy Info (Tệp chứa thông tin giá trị), Files Containing Passwords (Tệp chứa mật khẩu), Sensitive Online Shopping Info (Thông tin mua sắm trực tuyến nhạy cảm), Network or Vulnerability Data (Dữ liệu mạng hoặc lỗ hổng), Pages Containing Login Portals (Trang chứa cổng đăng nhập), Various Online Devices (Nhiều thiết bị trực tuyến), Advisories and Vulnerabilities (Cảnh báo và lỗ hổng).
- **VPN Footprinting**: GHDB được sử dụng để tìm kiếm cấu hình và portal đăng nhập của các thiết bị VPN. Ví dụ các Google Dorks:
  - `inurl:/sslvpn/Login/Login` (Tìm portal đăng nhập VPN).
  - `intitle:"index of" /etc/openvpn/` (Tìm các thư mục chứa dữ liệu cấu hình VPN).
  - `"-----BEGIN OpenVPN Static key V1-----" ext:key` (Tìm các static keys của OpenVPN lộ lọt).
  - **Một số Google Dorks tìm kiếm VPN nâng cao khác (Bảng 2.1)** [Trang 141]:
    - `inurl:"/sslvpn_logon.shtml" intitle:"User Authentication" "WatchGuard Technologies"` (Tìm cổng đăng nhập WatchGuard).
    - `inurl:weblogin intitle:("USG20-VPN" | "USG20W-VPN" ...)` (Tìm lỗ hổng mật khẩu mặc định/hardcoded của Zyxel).
    - `intext:Please Login SSL VPN inurl:remote/login intext:FortiClient` (Tìm trang đăng nhập Fortinet VPN).
    - `intitle:"index of" "vpn-config.*"` (Lấy các tệp cấu hình vpn-config).
    - `Index of / *.ovpn` (Tìm tệp cấu hình, chứng chỉ và keys của OpenVPN).
    - `inurl:"/vpn/tmindex.html" vpn` (Tìm cổng đăng nhập VPN của Netscaler và Citrix Gateway).
    - `intitle:"SSL VPN Service" + intext:"Your system administrator provided the following information..."` (Tìm trang đăng nhập Cisco ASA).
- **Công cụ SearchSploit**: Cho phép tìm kiếm ngoại tuyến (offline) kho dữ liệu của Exploit-DB/GHDB qua dòng lệnh.

### Các kỹ thuật tìm kiếm nâng cao khác (Trang 146 - 150)

- **Google Advanced Search & Advanced Image Search**: Bằng cách truy cập `https://www.google.com/advanced_search` hoặc `advanced_image_search`, kẻ tấn công có thể lọc chính xác theo từ khóa, màu sắc, tên miền, loại tệp tin mà không cần nhớ cú pháp toán tử phức tạp.
- **Reverse Image Search (Tìm kiếm hình ảnh ngược)**: Cho phép theo dõi nguồn gốc hình ảnh, hồ sơ và vị trí (sử dụng Google Image Search, TinEye, Yahoo/Bing Image Search).
- **Video Search Engines**: Lấy thông tin từ các video bị lộ, sử dụng công cụ như YouTube Metadata, YouTube DataViewer, MW Metadata, EZGif để phân tích thời gian, thumbnail và trích xuất text/thông tin bị ẩn trong các khung hình video.

### Meta search engines (Công cụ tìm kiếm Meta) (Trang 151 - 152)

Các công cụ như Startpage, MetaGer, eTools.ch là dạng tìm kiếm sử dụng các công cụ tìm kiếm khác (Google, Bing...) để tạo ra kết quả trong thời gian rất ngắn. Chúng không có chỉ mục (index) riêng mà gửi truy vấn đồng thời đến các công cụ bên thứ ba, sau đó lọc bỏ các kết quả trùng lặp. Đặc biệt, meta search engines cung cấp tính ẩn danh bằng cách che giấu địa chỉ IP của người dùng.

### Công cụ tìm kiếm FTP (Trang 152 - 154)

Bao gồm: NAPALM FTP Indexer, FreewareWeb FTP File Search, Mamont, globalfilesearch.com. Kẻ tấn công sử dụng chúng để tìm kiếm các tệp và thư mục quan trọng trên các máy chủ FTP không được bảo mật. Thông tin thu được bao gồm: chiến lược kinh doanh, tài liệu thuế, hồ sơ nhân viên, hồ sơ tài chính và phần mềm có bản quyền.

**Google Dorks nâng cao tìm máy chủ FTP:**

- `intitle:"index of" "*/ftp.txt"` hoặc `intext:"index of" "ftp"` (Tìm thư mục chứa thông tin FTP).
- `intitle:"Index of ftp passwords"` (Tìm tệp chứa mật khẩu).
- `inurl:ftp -inurl:(http|https) intext:"@gmail.com" intext:subject fwd|confidential|important|CARD|cvv` (Đọc các email/dữ liệu tài chính bị lưu trữ sai cách trên FTP).
- `"index of" /ftp/logs` (Tìm tệp tin nhật ký).

- **Footprinting VoIP và VPN bằng SHODAN:** Shodan không chỉ dùng để tìm thiết bị IoT/SCADA mà còn cho phép kẻ tấn công thực hiện footprinting ở nhiều cấp độ, phát hiện các thiết bị và mạng có lỗ hổng liên quan đến VoIP và VPN.

### Tìm kiếm SCADA và IoT (Trang 154)

Bao gồm: Shodan, Censys, ZoomEye. Được sử dụng để thu thập thông tin từ các thiết bị IoT và hệ thống SCADA công khai trên Internet (nhiều thiết bị không có mật khẩu hoặc dùng mật khẩu mặc định). Thông tin lấy được bao gồm: chi tiết nhà sản xuất, vị trí địa lý, địa chỉ IP, hostname và các cổng (port) đang mở.

### Tìm tên miền cấp cao (TLDs) và subdomains (Trang 160 - 165)

- **Netcraft (Trang 160):** Lấy danh sách tất cả các tên miền phụ (subdomains) liên quan đến tên miền mục tiêu.
- **DNSdumpster (Trang 161):** Công cụ nghiên cứu tên miền giúp khám phá các máy chủ (hosts) liên quan đến tên miền, địa chỉ IP và các máy chủ DNS đang được sử dụng.
- **Pentest-Tools Find Subdomains (Trang 162):** Khám phá subdomains và IP, bao gồm thông tin mạng, hệ điều hành, máy chủ HTTP và công nghệ nền tảng.
- **Sublist3r (Trang 165):** Sử dụng dòng lệnh (ví dụ: `sublist3r -d domain.com`) để liệt kê subdomains.

### Sử dụng AI để khám phá Subdomain (Trang 164 - 166):

Kẻ tấn công có thể sử dụng ChatGPT để tự động sinh các lệnh terminal kết hợp nhiều công cụ.

- Ví dụ Prompt: _"Discover all the subdomains of 'google.com' using dig command"_. AI sẽ xuất lệnh dạng: `dig +short google.com NS | xargs -I{} dig +nocmd +noall +answer @{} google.com A +noall +answer` để liệt kê tự động.
- Ví dụ Prompt: _"Use Sublist3r to gather a list of subdomains of the target organization eccouncil"_. AI sẽ trả về lệnh `sublist3r -d eccouncil.org -o eccouncil_subdomains.txt`.

### Trích xuất thông tin trang web qua Archive.org (Trang 167 - 168)

Internet Archive's Wayback Machine (`https://archive.org`) lưu trữ các phiên bản cũ của một trang web. Kẻ tấn công sử dụng công cụ này để thu thập thông tin đã bị gỡ bỏ khỏi trang web hiện tại (ví dụ: các tài liệu cũ, cấu hình phần mềm, thông tin nhân viên cũ, cấu trúc trang) để thực hiện tấn công phishing hoặc tìm lỗ hổng ứng dụng web.

### Thu hồi URLs đã lưu trữ bằng Photon (Trang 167 - 169)

Công cụ Photon được dùng để trích xuất các URL và liên kết được lưu trữ của một trang web mục tiêu từ archive.org (Wayback Machine), cho phép kẻ tấn công thu thập lại cả những thông tin đã bị xóa khỏi trang web. Lệnh sử dụng: `photon.py -u <URL> -l 3 -t 200 --wayback`.

### Dịch vụ tìm kiếm người (Trang 170)

**Spokeo** là một dịch vụ tìm kiếm người trực tuyến giúp kẻ tấn công tìm kiếm thông tin về nhân viên của tổ chức mục tiêu. Các dữ liệu thu thập được bao gồm: số điện thoại, địa chỉ email, lịch sử địa chỉ, tuổi, ngày sinh, thành viên gia đình, hồ sơ mạng xã hội và hồ sơ tòa án.

### Footprinting thông qua các trang web tìm việc (Job Sites) (Trang 171 - 172)

Kẻ tấn công thu thập thông tin từ các trang web tuyển dụng (như Dice, LinkedIn, Glassdoor, Simply Hired).

- Các bài đăng tuyển dụng IT/Network Admin thường tiết lộ chi tiết về hạ tầng mạng, hệ điều hành (Windows/Linux), phiên bản phần mềm, tường lửa (firewall), cơ sở dữ liệu và hệ thống máy ảo (Hypervisor/VMs) đang được sử dụng.
- Kẻ tấn công cũng có thể phân tích sơ yếu lý lịch (resumes) của nhân viên mục tiêu trên các nền tảng này để tìm thông tin kỹ thuật chuyên sâu về tổ chức.

### Dark Web Footprinting (Trang 173 - 176)

- **Surface web (Web nổi)**: Lớp ngoài cùng, cho phép tìm kiếm qua các trình duyệt thông thường (Google, Bing).
- **Deep web (Web chìm)**: Nội dung không được lập chỉ mục (unindexed), mở rộng lớn hơn rất nhiều so với Surface web (như dữ liệu cơ quan chính phủ, DB tổ chức).
- **Dark web (Darknet)**: Là một tập con của Deep web, chỉ có thể truy cập qua các trình duyệt chuyên dụng (như Tor Browser), cho phép ẩn danh hoàn toàn.
- **Công cụ Dark Web**: Kẻ tấn công sử dụng Tor Browser, ExoneraTor, OnionLand Search Engine để thu thập thông tin bí mật (thẻ tín dụng, số SSN, hồ sơ y tế bị lộ).
- **Kỹ thuật tìm kiếm**: Kẻ tấn công dùng các toán tử tìm kiếm chuyên biệt với đuôi `.onion` trên Tor:
  - `filetype:pdf site:onion confidential` (Tìm PDF nhạy cảm).
  - `intitle:"index of" /etc/openvpn/` (Tìm thư mục VPN).
  - `inurl:config filetype:txt password` (Tìm cấu hình chứa mật khẩu).
  - **Tìm kiếm Dark Web với các Tham số Tìm kiếm Nâng cao (Advanced Search Parameters) [Trang 174 - 176]:**
    - Hồ sơ cá nhân (Personal profiles): `"John Doe" site:facebook.com OR site:linkedin.com`
    - Ấn phẩm khoa học (Scientific publications): `"John Doe" site:scholar.google.com`
    - Hồ sơ tòa án (Court records): `"John Doe" court records`
    - Danh bạ thành viên (Member directories): `"John Doe" site:example.com "employee directory"`
    - Hồ sơ y tế (Medical records): `"John Doe" medical records`
    - Hồ sơ vị trí (Location records): `"John Doe" location history`
  - **Bảng truy vấn Dark Web mở rộng (Dành cho Tor Browser) [Trang 174 - 176]:**
    - `filetype:xlsx site:onion financial` (Định vị dữ liệu tài chính/Excel).
    - `filetype:sql site:onion dump` (Tìm các bản dump cơ sở dữ liệu SQL).
    - `filetype:csv site:onion email` (Tìm danh sách email).
    - `intitle:"login credentials" filetype:docx` (Tìm tài liệu Word chứa thông tin đăng nhập).
    - `filetype:xml inurl:config server` (Tìm tệp XML cấu hình máy chủ).
    - `filetype:key site:onion private` (Tìm các tệp khóa riêng tư/private keys).
    - `filetype:pdf site:onion "medical records"` (Tìm hồ sơ y tế).
    - `filetype:ppt site:onion "business plan"` (Tìm kế hoạch kinh doanh).
    - `filetype:py site:onion "def "` (Tìm tệp mã nguồn Python).
    - `filetype:docx site:onion "legal document"` (Tìm tài liệu pháp lý).
    - `filetype:pdf site:onion "bank statement"` (Tìm sao kê ngân hàng).
    - `filetype:pdf inurl:patent confidential` (Tìm tài liệu sở hữu trí tuệ/bằng sáng chế mật).
    - `filetype:txt inurl:exploit "security vulnerability"` (Tìm tệp văn bản chi tiết về lỗ hổng).

### Phát hiện hệ điều hành - OS detection (Trang 177 - 179)

Kẻ tấn công sử dụng các công cụ để xác định hệ điều hành (OS fingerprinting) chạy trên mục tiêu.

- **Netcraft:** Dùng ô tìm kiếm "What's that site running?" để xác định hệ điều hành và thông tin web server của domain.
- **Censys / Shodan:** Tìm kiếm các thiết bị kết nối Internet để lấy thông tin hệ điều hành, địa chỉ IP, vị trí địa lý và các giao thức đang được sử dụng.

### Thu thập thông tin cạnh tranh (Competitive Intelligence) (Trang 183 - 186)

Quá trình này giúp kẻ tấn công thu thập kế hoạch, chiến lược kinh doanh của tổ chức từ các nguồn:

- **EDGAR database:** Cơ sở dữ liệu lấy thông tin nhạy cảm về tài chính và doanh nghiệp từ SEC.
- **D&B Hoovers / Experian:** Cung cấp thông tin phân tích tiếp thị, hồ sơ kinh doanh và chiến lược tìm kiếm khách hàng.
- **LexisNexis:** Cơ sở dữ liệu pháp lý và hồ sơ công khai.
- **Business Wire / Factiva:** Phân phối các thông cáo báo chí, tin tức toàn cầu và dữ liệu kinh doanh.
- **MarketWatch / The Wall Street Transcript:** Theo dõi nhịp đập thị trường, tin tức tài chính, báo cáo ngành và ý kiến chuyên gia.
- **Euromonitor:** Phân tích, khảo sát thị trường tiêu dùng và nhân khẩu học.
- **The Search Monitor:** Theo dõi quảng cáo cạnh tranh, tuân thủ liên kết, chia sẻ thị phần và thương hiệu.
- **The Wall Street Transcript:** Website và ấn phẩm trả phí xuất bản các báo cáo ngành, thể hiện quan điểm của các nhà quản lý tiền tệ và chuyên gia phân tích cổ phiếu.
- **Experian:** Cung cấp thông tin chi tiết về các chiến lược tìm kiếm, tiếp thị liên kết, hiển thị và tiếp thị xã hội của đối thủ cạnh tranh để cải thiện kết quả chiến dịch tiếp thị.
- **SEMRush:** Công cụ nghiên cứu từ khóa cạnh tranh. Cung cấp danh sách từ khóa Google và AdWords của bất kỳ trang web nào, cũng như danh sách đối thủ trong kết quả tìm kiếm tự nhiên và trả phí.
- **USPTO:** Tra cứu thông tin hồ sơ bằng sáng chế và đăng ký nhãn hiệu.
- **ABI/INFORM Global / SimilarWeb / SERanking:** Phân tích lưu lượng truy cập web, chiến lược SEO, PPC và nghiên cứu điều kiện kinh doanh tổng thể.

### Các kỹ thuật Internet Research khác (Trang 187 - 193)

- **Tìm kiếm vị trí địa lý (Geographical Location)**: Sử dụng Google Earth, Google Maps, Wikimapia để xem cận cảnh hình ảnh các tòa nhà, vị trí camera an ninh, lối vào/lối ra, chỗ ẩn nấp và khu vực Wi-Fi để phục vụ tấn công vật lý (Surveillance, Dumpster diving).
- **Thông tin từ dịch vụ tài chính (Financial Services)**: Dùng Google Finance, MSN Money, Yahoo Finance để theo dõi tình hình thị trường, thông cáo báo chí tài chính để tìm hiểu công ty.
- **Hồ sơ doanh nghiệp (Business Profile Sites)**: Dùng các nền tảng như opencorporates, Crunchbase, corporationwiki để tìm địa chỉ, hệ thống nhân viên và cơ cấu phòng ban.
- **Theo dõi mục tiêu bằng Alerts (Cảnh báo)**: Dùng Google Alerts, X Alerts, Giga Alerts để thiết lập cảnh báo thời gian thực về email hoặc SMS bất cứ khi nào tên tổ chức/nhân sự được nhắc đến trên tin tức hoặc mạng xã hội.
  - **Theo dõi Danh tiếng Trực tuyến của Mục tiêu (Tracking the Online Reputation of the Target) [Trang 192]**:
    - Quản lý danh tiếng trực tuyến (Online Reputation Management - ORM) là quá trình theo dõi những gì hiển thị khi ai đó tìm kiếm danh tiếng công ty trên Internet. Các tổ chức thường theo dõi phản hồi công khai để cải thiện độ tin cậy. Sự minh bạch này có thể giúp kẻ tấn công thu thập thông tin xác thực về mục tiêu.
    - **Các công cụ theo dõi danh tiếng trực tuyến (Online Reputation Tracking Tools)**: Kẻ tấn công sử dụng các công cụ như Mention, ReviewPush, và Reputology để theo dõi các cuộc trò chuyện, thứ hạng tìm kiếm, nhận thông báo qua email khi công ty được nhắc đến và thu thập tin tức xã hội về tổ chức mục tiêu.
- **Thu thập từ Group, Diễn đàn và Blog**: Kẻ tấn công thường tạo tài khoản giả mạo (Fake profile) tham gia vào Google Groups hoặc LinkedIn Groups của công ty để thu thập thông tin cá nhân và tổ chức bị rò rỉ (employee pictures, work location, email, v.v.).

### Kho mã nguồn công khai (Trang 194 - 195)

Công cụ Recon-ng là một framework trinh sát web mạnh mẽ với các module độc lập, giúp thu thập nhanh chóng các cấu hình, khóa SSH/SSL riêng tư, tệp mã nguồn và các tệp nhạy cảm khác bị rò rỉ trên các kho mã nguồn công khai như GitHub, GitLab.

### Mạng xã hội / Thu thập từ MXH và Thu thập danh sách email (Trang 199 & 201 - 203)

Công cụ theHarvester được dùng để liệt kê (enumerate) thông tin trên LinkedIn để tìm chức danh, vị trí công việc của nhân viên, hoặc để thu thập danh sách email nhạy cảm từ các công cụ tìm kiếm. Ví dụ lệnh: `theHarvester -d microsoft.com -l 200 -b linkedin` (Trang 199 & 203):

- `-d`: Chỉ định domain hoặc tên công ty cần tìm kiếm.
- `-l 200`: Giới hạn số lượng kết quả thu về là 200.
- `-b`: Chỉ định nguồn dữ liệu dùng để tìm kiếm (ví dụ: linkedin, baidu, google).

### Phân tích mạng xã hội (Trang 205)

Công cụ BuzzSumo là một công cụ tìm kiếm xã hội nâng cao giúp tìm ra những nội dung được chia sẻ nhiều nhất theo chủ đề, tác giả hoặc tên miền trên Twitter, Facebook, LinkedIn, Pinterest. Kẻ tấn công dùng nó để theo dõi tài khoản mạng xã hội, URL và thu thập email để thực hiện lừa đảo (phishing).

### Footprinting mạng xã hội với AI (Trang 204 & 210 - 211)

- **Thu thập Email bằng AI**: Kẻ tấn công có thể sử dụng các prompt trên ChatGPT (VD: _"Use theHarvester to gather email accounts associated with 'microsoft.com', limiting results to 200, and leveraging 'baidu' as a data source"_). Trí tuệ nhân tạo sẽ tự động hóa việc xuất câu lệnh chính xác giúp quá trình thu thập thông tin trở nên trơn tru hơn.
- **Sử dụng Sherlock kết hợp AI**: Thay vì tra cứu thủ công, hacker sử dụng prompt yêu cầu AI tạo kịch bản truy vết tên người dùng trên Sherlock (Ví dụ: _"Use Sherlock to gather personal information about Sundar Pichai and save the result in recon2.txt"_).

### Footprinting trên mạng xã hội (Trang 207 - 208)

- **Sherlock:** Công cụ dòng lệnh dùng để tìm kiếm một username (tên người dùng) mục tiêu trên hàng loạt mạng xã hội khác nhau và trả về các URL đầy đủ tới hồ sơ của người đó.
- **SocialSearcher:** Cho phép kẻ tấn công tìm kiếm nội dung và theo dõi hoạt động của mục tiêu trên mạng xã hội trong thời gian thực, đồng thời cung cấp dữ liệu phân tích chuyên sâu.

## WHOIS, DNS Footprinting

### Tra cứu WHOIS (WHOIS Lookup) (Trang 213 - 215)

Whois là một giao thức truy vấn và phản hồi được sử dụng để truy vấn các cơ sở dữ liệu lưu trữ người dùng đăng ký hoặc người được chỉ định của một tài nguyên Internet (như tên miền, khối địa chỉ IP). Có 3 mô hình dữ liệu để lưu trữ và tra cứu thông tin Whois:

- **Thick WHOIS (Mô hình phân tán - Distributed Model):** Lưu trữ thông tin Whois hoàn chỉnh từ tất cả các nhà đăng ký cho một tập dữ liệu cụ thể.
- **Thin WHOIS (Mô hình tập trung - Centralized Model):** Chỉ lưu trữ tên của máy chủ Whois của nhà đăng ký tên miền, máy chủ này sau đó mới chứa các chi tiết hoàn chỉnh về dữ liệu đang được tra cứu.
- **Decentralized WHOIS (Mô hình phi tập trung):** Lưu trữ thông tin WHOIS hoàn chỉnh và có nhiều thực thể độc lập để quản lý cơ sở dữ liệu WHOIS.

### Các Regional Internet Registries (RIRs) (Trang 214)

RIRs duy trì các cơ sở dữ liệu Whois chứa thông tin cá nhân của chủ sở hữu tên miền. Bao gồm:

- **ARIN (American Registry for Internet Numbers)** — Bắc Mỹ
- **AFRINIC (African Network Information Center)** — Châu Phi
- **APNIC (Asia Pacific Network Information Center)** — Châu Á Thái Bình Dương
- **RIPE (Réseaux IP Européens Network Coordination Centre)** — Châu Âu
- **LACNIC (Latin American and Caribbean Network Information Center)** — Mỹ Latinh và Caribe

### Định vị địa lý IP (IP Geolocation) (Trang 217)

- IP Geolocation giúp lấy thông tin về mục tiêu như: quốc gia, khu vực/bang, thành phố, vĩ độ/kinh độ, mã ZIP, múi giờ, tốc độ kết nối, ISP (công ty lưu trữ), tên miền, mã quốc gia IDD, mã vùng, trạm thời tiết, nhà mạng di động và độ cao.
- **Công cụ IP2Location:** Giúp kẻ tấn công xác định vị trí địa lý của người truy cập hoặc lấy thông tin qua cơ sở dữ liệu tra cứu địa chỉ IP độc quyền.

---

## DNS Footprinting

- **Các lệnh thực thi quét DNS bằng Fierce [Trang 222 - 224]:**
  - Quét cơ bản: `fierce --domain <target_domain>`
  - Quét các subdomain cụ thể (như write, admin, mail): `fierce -domain <target_domain> -subdomains write admin mail`
  - Quét các khối IP liền kề (với phạm vi 10): `fierce -domain <target_domain> -subdomains mail -traverse 10`
  - Thử kết nối HTTP trên các subdomain đã phát hiện: `fierce --domain <target_domain> --subdomains mail --connect`
  - Quét chi tiết toàn diện (full detailed scan): `fierce --domain <target_domain> --wide`

### Các loại bản ghi DNS (DNS Record types) (Trang 220)

Thu thập thông tin DNS tiết lộ dữ liệu vùng DNS (DNS zone data) bao gồm tên miền, tên máy tính, địa chỉ IP và nhiều thông tin khác. Các bản ghi DNS giúp xác định mục tiêu:

- **A (Address record):** Trỏ/Ánh xạ (Map) hostname tới địa chỉ IPv4.
- **AAAA (IPv6 address record):** Trỏ hostname tới địa chỉ IPv6.
- **MX (Mail exchange):** Trỏ tới mail server (máy chủ thư) của domain.
- **NS (Name server):** Trỏ tới name server của máy chủ.
- **CNAME (Canonical name):** Gán bí danh (alias) cho một host.
- **SOA (Start of Authority):** Chỉ định quyền hạn (authority) cho một domain.
- **SRV (Service record):** Các bản ghi dịch vụ.
- **PTR (Pointer record):** Ánh xạ địa chỉ IP tới một hostname (thường dùng cho reverse lookup).
- **RP (Responsible person):** Người chịu trách nhiệm (quản trị viên).
- **HINFO (Host information):** Bản ghi thông tin host bao gồm loại CPU và hệ điều hành (OS).
- **TXT (Text Record):** Các bản ghi văn bản không cấu trúc.

### Công cụ DNS (Trang 221 - 229)

- **SecurityTrails (Trang 221):** Công cụ liệt kê DNS nâng cao có khả năng tạo bản đồ DNS của mạng mục tiêu, liệt kê các bản ghi hiện tại và lịch sử (A, AAAA, NS, MX, SOA, TXT).
- **Fierce (Trang 222):** Công cụ trinh sát DNS dùng để quét và thu thập thông tin quan trọng. Giúp liệt kê subdomain, xác định các không gian IP không liền kề và hostname được liên kết với tên miền.
- **DNSRecon (Trang 227 - 228):** Công cụ dùng để liệt kê DNS và thực hiện thao tác Reverse DNS Lookup (tra cứu DNS ngược) bằng phương pháp brute-force trên một dải địa chỉ IP để lấy tên miền.
- **DNSChecker:** Công cụ truy vấn máy chủ DNS để lấy thông tin chi tiết về các bản ghi DNS.
- **zdns:** Công cụ interrogation DNS mạnh mẽ được dùng để lấy cấu trúc bản ghi chứa thông tin về DNS mục tiêu.
- **MXToolbox (Trang 229 & 244):** Được sử dụng cho công việc Reverse Lookup để tìm DNS PTR record, và cũng được dùng làm công cụ theo dõi email (Email Tracking).

### Truy vấn DNS bằng công nghệ AI (Trang 225 - 226)

Hacker có thể kết hợp ChatGPT và công cụ dnsrecon để tự động hóa việc truy vấn DNS.

- Ví dụ prompt: _"Install and use DNSRecon to perform DNS enumeration on the target domain www.certifiedhacker.com"_.
- AI sẽ tạo ra luồng lệnh đầy đủ như `sudo apt-get update && sudo apt-get install -y dnsrecon && dnsrecon -d certifiedhacker.com -t std`.

### Xác định dải mạng (Locate the Network Range) (Trang 230 - 232)

- Xác định dải IP giúp kẻ tấn công lập bản đồ mạng mục tiêu (network topology), tìm ra máy chủ nào đang sống và các thiết bị kiểm soát mạng.
- Sử dụng cơ sở dữ liệu của các Regional Internet Registry (như ARIN Whois database) để lấy dải IP, mặt nạ mạng (subnet mask).
- Dải IP Private (IANA dự trữ): `10.0.0.0/8`, `172.16.0.0/12` và `192.168.0.0/16`. Kẻ tấn công cố gắng lần theo traceroute để lấy các địa chỉ IP nội bộ của Gateway (router).

---

## Traceroute (Traceroute Tools) (Trang 233 - 241)

Traceroute sử dụng giao thức ICMP và trường Time to Live (TTL) trong IP header để tìm đường đi (route) của gói tin đến host mục tiêu. Công cụ Traceroute:

- **NetScanTools Pro (Trang 240):** Công cụ theo dõi các gói tin từ máy kẻ tấn công đến thiết bị mục tiêu qua mạng LAN hoặc Internet. Hỗ trợ traceroute bằng ICMP, UDP, hoặc TCP, giúp xác định các thiết bị trung gian và quốc gia được gán cho mỗi IP.
- **PingPlotter (Trang 241):** Cho phép thu thập dữ liệu traceroute sử dụng gói ICMP, UDP và TCP. Tự động khám phá các network hops, theo dõi độ trễ (latency) và mất gói (packet loss) theo thời gian, hiển thị dưới dạng biểu đồ trực quan.

### Cơ chế Traceroute và Các loại Traceroute (Trang 234 - 239)

- **Phân tích Traceroute**: Kết quả traceroute giúp kẻ tấn công xác định rõ các router trung gian và Firewall bảo vệ (Ví dụ: `1.10.10.20` là Bastion Host/Firewall đầu tiên, sau đó đến DMZ, rồi đến Internal Firewall `1.10.10.50`).
- **ICMP Traceroute**: (Mặc định trên Windows thông qua lệnh `tracert`). Gửi gói ICMP với TTL tăng dần.
- **TCP Traceroute**: Nhiều hệ thống tự động chặn gói ICMP traceroute. Khi đó, kẻ tấn công dùng TCP/UDP (Layer 4 traceroute). Trong Linux, dùng lệnh `tcptraceroute www.google.com`.
- **UDP Traceroute**: (Mặc định trên Linux thông qua lệnh `traceroute`). Sử dụng gói UDP thay vì ICMP.
- **Tự động hóa Traceroute bằng AI**: Kẻ tấn công sử dụng ChatGPT để yêu cầu tạo kịch bản quét (Ví dụ: _"Perform network tracerouting to discover the routers on the path to a target host www.certifiedhacker.com"_).

---

- **Thông tin thu thập được qua các công cụ Theo dõi Email (Email Tracking) [Trang 242]:**
  - **IP hệ thống của người nhận (Recipient's System IP address):** Cho phép theo dõi địa chỉ IP của người nhận.
  - **Vị trí địa lý (Geolocation):** Ước tính và hiển thị vị trí người nhận trên bản đồ, tính khoảng cách từ kẻ tấn công.
  - **Email được nhận và đọc (Email Received and Read):** Thông báo cho kẻ tấn công biết khi nào email được mở.
  - **Thời gian đọc (Read Duration):** Thời gian người nhận dành để đọc email.
  - **Phát hiện Proxy (Proxy Detection):** Thông tin về loại máy chủ mà người nhận đang sử dụng.
  - **Liên kết (Links):** Kiểm tra xem người nhận đã nhấp vào các liên kết đính kèm hay chưa.
  - **Hệ điều hành và Trình duyệt (OS and Browser info):** Thông tin giúp kẻ tấn công tìm lỗ hổng tương ứng để khai thác.
  - **Chuyển tiếp (Forward Email):** Xác định xem email có được chuyển tiếp cho người khác hay không.
  - **Loại thiết bị (Device Type):** Máy tính để bàn, thiết bị di động hay laptop.
  - **Đường đi (Path Travelled):** Theo dõi các Mail Transfer Agents mà email đã đi qua.

## Theo dõi Email (Email Tracking Tools) (Trang 244 - 246)

Công cụ theo dõi email:

- **eMailTrackerPro (Trang 244):** Công cụ phân tích tiêu đề email (email headers) và trích xuất thông tin như vị trí địa lý của người gửi, địa chỉ IP. Cho phép lưu lại các dấu vết để xem lại sau.
- **IP2LOCATION’s Email Header Tracer (Trang 245):** Dịch vụ mã nguồn mở dùng để phân tích và theo dõi đường dẫn email thông qua email header. Giúp kẻ tấn công truy xuất vị trí mục tiêu và các mail servers mà email đi qua.

### Thu thập thông tin từ Tiêu đề Email (Email Header) (Trang 242 - 244)

Email Header chứa nhiều thông tin chi tiết dùng để truy vết nguồn phát thư:

- **System IP address của người nhận**: Theo dõi địa chỉ IP của người đọc thư.
- **Geolocation (Vị trí địa lý)**: Dựa vào IP để tìm tọa độ trên bản đồ.
- **Thông tin Thiết bị, Hệ điều hành và Trình duyệt**: Cho biết loại máy tính (laptop/mobile) và trình duyệt người nhận đang dùng để hacker tìm lỗ hổng tương ứng.
- **Path Travelled (Đường đi)**: Lưu lại các email transfer agents (mail servers) mà email đã đi qua từ nguồn đến đích.
- **Các nền tảng email phổ biến**: eM Client, Mailbird, Hiri, Mozilla Thunderbird, Spike, Claws Mail, SmarterMail Webmail, Outlook, Apple Mail, ProtonMail, AOL Mail, Tuta. Kẻ tấn công trích xuất thông tin Header và dùng các công cụ phân tích tự động.
- **Bảng thu thập thông tin thông qua hoạt động của Người dùng (What Users Do / What Attacker Gets) [Trang 249 - 250]:**
  - Duy trì hồ sơ (Maintain profile) $\rightarrow$ Lấy được thông tin liên hệ, vị trí.
  - Kết nối bạn bè, chat $\rightarrow$ Lấy được danh sách bạn bè, thông tin bạn bè.
  - Chia sẻ hình ảnh, video $\rightarrow$ Biết được danh tính thành viên gia đình, sở thích.
  - Chơi game, tham gia nhóm $\rightarrow$ Biết được sở thích (Interests).
  - Tạo sự kiện (Create events) $\rightarrow$ Biết được các hoạt động (Activities).
- **Bảng thu thập thông tin thông qua hoạt động của Tổ chức (What Organizations Do / What Attacker Gets) [Trang 249 - 250]:**
  - Khảo sát người dùng (User surveys) $\rightarrow$ Lộ chiến lược kinh doanh.
  - Quảng bá sản phẩm $\rightarrow$ Lộ hồ sơ sản phẩm.
  - Hỗ trợ người dùng $\rightarrow$ Tạo đà cho Social engineering.
  - Tuyển dụng (Recruitment) $\rightarrow$ Lộ thông tin về Nền tảng/Công nghệ đang dùng.
  - Kiểm tra lý lịch nhân viên $\rightarrow$ Lộ loại hình kinh doanh.
- **Một số công cụ Footprinting bổ sung [Trang 261]:**
  - **Sudomy** (`https://github.com`)
  - **whatweb** (`https://github.com`)
  - **Raccoon** (`https://github.com`)
  - **Orb** (`https://github.com`)
  - **Web Check** (`https://web-check.xyz`)
  - **OSINT.SH** (`https://osint.sh`)

---

## Kỹ nghệ xã hội (Social Engineering) (Trang 251 - 252)

Kỹ nghệ xã hội là quá trình phi kỹ thuật mà kẻ tấn công lừa nạn nhân vô tình cung cấp thông tin bảo mật.

- **Eavesdropping (Nghe lén - Trang 251):** Hành vi đánh chặn thông tin liên lạc (âm thanh, video, văn bản) mà không có sự đồng ý của các bên, bao gồm cả việc đọc lén tin nhắn hay fax.
- **Shoulder surfing (Nhìn trộm qua vai - Trang 251):** Đứng phía sau nạn nhân và bí mật quan sát các hoạt động trên máy tính như thao tác gõ phím để lấy mật khẩu, mã bảo mật, số tài khoản.
- **Dumpster diving (Bới thùng rác - Trang 251 - 252):** Kẻ tấn công lục lọi thùng rác của công ty để tìm các thông tin giá trị như hóa đơn điện thoại, tài liệu tài chính, mã nguồn, giấy ghi chú (sticky notes).
- **Impersonation (Mạo danh - Trang 252):** Kẻ tấn công giả mạo thành một người hợp pháp hoặc người có thẩm quyền (nhân viên giao hàng, thợ sửa chữa, khách hàng) để lừa mục tiêu tiết lộ thông tin nhạy cảm.

---

## Tự động hóa tác vụ footprinting (Automate Footprinting Tasks) (Trang 253 - 261)

- **Maltego (Trang 253 & 255):** Công cụ tự động dùng để xác định các mối quan hệ và liên kết trong thế giới thực giữa con người, nhóm người, tổ chức, trang web, hạ tầng mạng, và tài liệu.
- **Recon-ng (Trang 253 & 255):** Framework trinh sát web với các module độc lập và tương tác cơ sở dữ liệu, cung cấp môi trường thu thập thông tin mã nguồn mở mạnh mẽ và nhanh chóng.
- **FOCA (Trang 254 & 256):** (Fingerprinting Organizations with Collected Archives) Công cụ chủ yếu dùng để tìm metadata (siêu dữ liệu) và thông tin ẩn trong các tài liệu (MS Office, PDF) mà nó quét. Có các tính năng: Web Search, DNS Search, IP Resolution, PTR Scanning, Bing IP, Common Names.
- **subfinder (Trang 254 & 257):** Công cụ phát hiện subdomain, giúp kẻ tấn công tìm các subdomain hợp lệ cho trang web bằng cách sử dụng các nguồn trực tuyến thụ động.
- **OSINT Framework (Trang 254 & 258):** Framework thu thập tình báo nguồn mở tập trung vào việc lấy thông tin từ các công cụ/tài nguyên miễn phí. Nó cung cấp một giao diện web dạng cây (tree structure) liệt kê phân loại các công cụ OSINT.
- **Recon-dog (Trang 254 & 259):** Công cụ "all-in-one" cho nhu cầu thu thập thông tin cơ bản. Sử dụng API để lấy thông tin mục tiêu với các tính năng: Censys, NS lookup, Port scan, Detect CMS, Whois lookup, Detect honeypot, Find subdomains, và Reverse IP lookup.
- **BillCipher (Trang 254 & 260):** Công cụ thu thập thông tin cho trang web hoặc địa chỉ IP (hỗ trợ Python 2, 3 và Ruby). Bao gồm nhiều tính năng: tra cứu DNS, tra cứu Whois, quét cổng, zone transfer, tìm host và reverse IP lookup.

### Các công cụ OSINT được hỗ trợ bởi AI (AI-Powered OSINT Tools) (Trang 262 - 268)

AI giúp tự động hóa quá trình cào dữ liệu web (Web Scraping), nhận diện mẫu mã (Pattern Recognition), phân tích cảm xúc con người (Sentiment Analysis), và phân tích hình ảnh (Image Recognition).

- **Taranis AI**: Nền tảng OSINT nâng cao giúp gom nhặt, phân tích các tin tức phi cấu trúc và xuất ra báo cáo (PDF).
- **OSS Insight**: Phân tích kho dữ liệu khổng lồ của GitHub bằng tính năng truy vấn bằng ngôn ngữ tự nhiên (GPT-Powered). Theo dõi hoạt động của nhà phát triển, kho lưu trữ và xu hướng Web3/AI.
- **Các công cụ OSINT AI bổ sung**:
  - **DorkGPT / DorkGenius**: Trợ lý AI tự động tạo các câu lệnh Google Dorks chính xác.
  - **Google Word Sniper**: Tinh chỉnh truy vấn Google để tìm thông tin bị ẩn sâu.
  - **Cylect.io**: Giao diện tích hợp nhiều cơ sở dữ liệu OSINT sử dụng AI.
  - **ChatPDF**: Ứng dụng AI để phân tích và tóm tắt nhanh dữ liệu từ tệp PDF.
  - **Bardeen.ai**: Tự động hóa quá trình thu thập và phân tích dữ liệu trực tuyến.
  - **DarkGPT**: Trợ lý AI (sử dụng GPT-4) chuyên tìm kiếm và truy vấn các cơ sở dữ liệu bị rò rỉ (leaked databases) trên môi trường bị xâm nhập.
  - **PenLink Cobwebs**: Nền tảng OSINT nâng cao để phân tích, thu thập tình báo mạng.
  - **Explore AI**: Công cụ tìm kiếm YouTube bằng AI để trích xuất thông tin video.
  - **AnyPicker**: Công cụ cào dữ liệu web trực quan có tích hợp AI (không cần kỹ năng lập trình).

### Tự động hóa Footprinting bằng Custom Python Script và AI (Trang 269 - 273)

Hacker có thể yêu cầu AI viết các kịch bản tự động bằng Python để quét thông tin mục tiêu. Ví dụ: Prompt AI yêu cầu tạo một đoạn script nhận domain làm tham số đầu vào và tự động kích hoạt các công cụ như `dig` (DNS Lookup), `whois` (WHOIS info), `theHarvester` (Email enumeration) thông qua thư viện subprocess.

## Các biện pháp phòng chống Footprinting (Footprinting Countermeasures) (Trang 274 - 276)

Để ngăn chặn các nỗ lực do thám từ kẻ tấn công, các tổ chức cần thực hiện các biện pháp:

- Hạn chế quyền truy cập của nhân viên vào các trang mạng xã hội từ mạng lưới tổ chức.
- Đào tạo nhận thức về bảo mật (Security awareness training) để nhân viên phòng tránh các rủi ro Social Engineering, yêu cầu sử dụng biệt danh (pseudonyms) trên blog, diễn đàn.
- Cấu hình máy chủ web đúng cách để tránh rò rỉ thông tin (Information leakage) và vô hiệu hóa tính năng liệt kê thư mục (Directory listings) trên web server.
- Sử dụng cơ chế DNS phân tách (Split DNS) (Tách biệt internal DNS và external DNS) và hạn chế chuyển vùng (zone transfer) đối với các máy chủ ủy quyền.
- Lựa chọn dịch vụ quyền riêng tư (Privacy services) cho cơ sở dữ liệu Whois để ẩn thông tin chi tiết về người đăng ký.
- Không tiết lộ các thông tin kỹ thuật, tên sản phẩm, công nghệ chiến lược trên các bảng thông báo, ấn phẩm tuyển dụng hay các thông cáo báo chí.
- Ngăn chặn công cụ tìm kiếm lưu trữ trang web trong bộ đệm (Caching) hoặc xóa lịch sử trên archive.org nếu cần thiết.
- Triển khai xác thực đa yếu tố (MFA).
- Giấu địa chỉ IP máy chủ thực đằng sau các Proxy bảo mật hoặc mạng VPN.
- Vô hiệu hóa (Turn off) quyền truy cập và tính năng gắn thẻ địa lý (geo-tagging) trên các thiết bị di động, camera khi không cần thiết để tránh bị theo dõi (geolocation tracking).
- Tránh liên kết chéo cấp tên miền (cross-linking) cho các tài sản quan trọng.
- Mã hóa và bảo vệ bằng mật khẩu các thông tin nhạy cảm.
- Triển khai CAPTCHA và giới hạn tốc độ (rate limiting) trên các dịch vụ công khai để ngăn chặn công cụ tự động thu thập thông tin ở tốc độ cao.
- Không bật các giao thức mạng không cần thiết.
- Luôn sử dụng bộ lọc TCP/IP và IPsec để phòng thủ theo chiều sâu (defense in depth).
- Cấu hình Internet Information Services (IIS) để tránh rò rỉ thông tin qua quá trình banner grabbing.
- Lưu trữ các tài liệu quan trọng như kế hoạch kinh doanh, tài liệu độc quyền ở trạng thái ngoại tuyến (offline) để tránh bị khai thác.
- Đảm bảo không có thông tin quan trọng nào (như kế hoạch chiến lược, thông tin sản phẩm, dự báo doanh số) được hiển thị trên bảng thông báo hoặc tường.
- Vô hiệu hóa hoặc xóa tài khoản của những nhân viên đã rời khỏi tổ chức.
- Cấu hình máy chủ thư (mail servers) để bỏ qua các email từ các cá nhân ẩn danh.
- Triển khai hệ thống Honeypots hoặc Honeynets để thu hút, giăng bẫy và chuyển hướng kẻ tấn công ra khỏi các hệ thống quan trọng.

## 1. Cổng (Ports) và Phân loại

_Lưu ý: Bảng dưới đây cung cấp thông tin các port quan trọng, bao gồm cả cấu hình cổng được trích xuất từ bảng "Reserved ports table" và các công cụ thực tế._

- `0–1023`: Well‑known ports (Cổng được biết đến nhiều)
- `1024–49151`: Registered ports (Cổng đăng ký)
- `49152–65535`: Dynamic/Private ports (Cổng động/riêng tư)

| Port number / Protocol | Dịch vụ (Service)                         |
| ---------------------- | ----------------------------------------- |
| **21/tcp**             | ftp (Lệnh FTP)                            |
| **22/tcp**             | ssh (Secure Shell)                        |
| **23/tcp**             | telnet                                    |
| **25/tcp**             | SMTP (Email server)                       |
| **53/tcp, udp**        | domain (Domain name server - DNS)         |
| **67/udp**             | bootps (Bootp server - DHCP)              |
| **68/udp**             | bootpc (Bootp client - DHCP)              |
| **69/udp**             | tftp (Trivial File Transfer Protocol)     |
| **80/tcp, udp**        | www-http (WWW)                            |
| **88/tcp, udp**        | kerberos                                  |
| **110/tcp**            | Pop3 (PostOffice V.3)                     |
| **123/udp**            | ntp (Network Time Protocol)               |
| **135/tcp**            | msrpc (Microsoft Windows RPC - theo Nmap) |
| **137/tcp, udp**       | netbios-ns (NETBIOS Name Service)         |
| **138/tcp, udp**       | netbios-dgm (NETBIOS Datagram Service)    |
| **139/tcp, udp**       | netbios-ssn (NETBIOS Session Service)     |
| **143/tcp, udp**       | imap (Internet Message Access Protocol)   |
| **161/tcp, udp**       | snmp                                      |
| **389/tcp, udp**       | ldap (Được xác định theo Nmap)            |
| **443/tcp**            | https (Được xác định theo Nmap)           |
| **445/tcp**            | kerberos-ds (Microsoft DS / SMB)          |
| **514/tcp, udp**       | syslog/shell                              |

**Công cụ và Lệnh liên quan:**

- **`CurrPorts`**: Công cụ xem tất cả các cổng đang mở và kết nối TCP/UDP trên máy.
- **`netstat`**: Lệnh dùng để hiển thị các kết nối mạng, bảng định tuyến và các cổng đang lắng nghe.
- **`netstat -b`**: Hiển thị file thực thi của cổng/chương trình đang sử dụng (chỉ có trên Windows, cần quyền admin).

**Trạng thái cổng (Port states):**

- **`CLOSE_WAIT`**: Chờ ứng dụng cục bộ đóng kết nối (phía từ xa đã đóng).
- **`TIME_WAIT`**: Chờ đủ thời gian để đảm bảo mạng không còn gói tin lạc sau khi kết nối đóng.

---

## 2. Giao thức IPv4 và ICMP

- **IPv4**: Hỗ trợ Unicast, Multicast và Broadcast. IPv4 sử dụng các dải Private IP theo chuẩn IANA (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`).
- **ICMP (Lớp mạng)**: Internet Control Message Protocol được sử dụng nhiều cho kỹ thuật Ping Sweep và Traceroute.
  - Các mã thông điệp ICMP phổ biến (ICMP Type):
    - **0**: Echo Reply
    - **3**: Destination unreachable _(Đặc biệt chú trọng khi quét cổng, hệ thống có thể trả về lỗi Type 3 với các Code như 0, 1, 2, 3, 9, 10, hoặc 13)_.
    - **4**: Source quench
    - **5**: Redirect
    - **8**: Echo request
    - **11**: Time exceeded

---

## 3. Ping Sweep và Công cụ (Trang 305, 316-317)

- **Định nghĩa**: Ping sweep (hay ICMP sweep) là kỹ thuật quét mạng cơ bản bằng cách gửi các yêu cầu ICMP ECHO tới nhiều máy chủ cùng lúc để xác định dải IP nào đang hoạt động. Tuy nhiên, phương pháp này khá chậm, "ồn ào" (noisy) và có thể bị tường lửa ngăn chặn.
- **Công cụ quét Ping**:
  - **Angry IP Scanner**: Quét dải IP và port, xác định MAC, hostname và thông tin NetBIOS.
  - **SolarWinds Engineer’s Toolset**
  - **NetScanTools Pro**
  - **Colasoft Ping Tool**
  - **Advanced IP Scanner**
  - **OpUtils**
  - _(Bổ sung)_: **Network Ping**, **Superscan**, **Pinkie** (các công cụ mở rộng thường đi kèm quét Nmap qua TOR).

---

## 4. Kỹ thuật ARP Ping Scan (Trang 301 - 303)

- **Cách hoạt động**: Các gói tin ARP được gửi đi để khám phá thiết bị đang hoạt động trong mạng IPv4 nội bộ (LAN), ngay cả khi bị tường lửa hạn chế. Hệ điều hành phải xác định địa chỉ MAC qua ARP. Nếu máy chủ phản hồi IP với địa chỉ MAC tương ứng, nó đang "sống". ARP hiệu quả và chính xác hơn các phương pháp khác trong mạng LAN.
- **Lệnh Nmap**: `nmap -sn -PR <Target IP>`.
  - Tùy chọn `-PR` dùng để thực hiện quét ARP Ping.
  - Tùy chọn `-sn` dùng để vô hiệu hóa tính năng quét cổng (port scan).

---

## 5. Các kiểu quét cổng (Port Scan Types)

Port scanner hoạt động bằng cách điều khiển các cờ TCP (`SYN`, `ACK`, `RST`, `FIN`, `URG`, `PSH`) để xác định trạng thái cổng. Các phương pháp chuyên sâu bao gồm:

- **TCP Connect / Full Open Scan (Trang 323 - 324)**: Hoàn thành quy trình bắt tay 3 bước (three-way handshake). Nmap sử dụng lệnh gọi hệ thống `connect()`. Nếu cổng mở, mục tiêu trả về `SYN/ACK`, máy quét phản hồi `ACK` rồi lập tức gửi `RST` để đóng kết nối. Đáng tin cậy nhưng dễ bị phát hiện vì tạo ra log trên máy mục tiêu. Lệnh: `nmap -sT`.
- **Stealth Scan / Half-open / SYN Scan (Trang 325 - 326)**: Quét lén lút bằng cách cắt đứt kết nối trước khi hoàn tất bắt tay 3 bước. Kẻ tấn công gửi gói `SYN`, nếu nhận được `SYN/ACK` (cổng mở), họ lập tức gửi `RST` để hủy. Giúp vượt qua quy tắc tường lửa và không bị ghi log. Lệnh: `nmap -sS`.
- **Inverse TCP Flag Scan (Trang 327)**: Gửi gói TCP với các cờ `FIN`, `URG`, `PSH` hoặc không có cờ nào. Nếu cổng mở, mục tiêu sẽ không có phản hồi. Nếu cổng đóng, mục tiêu trả về gói `RST/ACK`. Tránh được IDS nhưng chủ yếu hoạt động trên hệ thống Unix/BSD. Windows thường phớt lờ và báo mọi cổng đều mở. Dùng lệnh `nmap -sF`, `nmap -sN`, `nmap -sX`.
- **XMAS Scan (Trang 328 - 329)**: Một dạng quét đảo ngược (inverse). Bật tất cả các cờ `FIN`, `URG` và `PUSH`. Tương tự như Inverse Scan, cổng mở không phản hồi, cổng đóng trả về `RST`. Không hiệu quả trên các phiên bản Microsoft Windows. Lệnh: `nmap -sX`.
- **ACK Flag Probe Scan (Trang 331 - 333)**: Gửi gói `ACK` và kiểm tra header trả về (Trường TTL hoặc trường Window) của gói `RST` để xác định cổng mở hoặc để kiểm tra cơ chế lọc của tường lửa (stateful firewall). Nếu TTL < 64 hoặc trường Window có giá trị khác 0, cổng đó mở. Lệnh: `nmap -sA`.
- **IDLE / IPID Header Scan (Trang 334 - 336)**: Sử dụng một máy trạm rảnh rỗi (idle zombie) để làm "bia đỡ đạn" và giả mạo IP. Kẻ tấn công đo lường số thứ tự IPID của máy zombie, sau đó gửi gói `SYN` tới mục tiêu bằng địa chỉ IP giả mạo của zombie. Nếu cổng mục tiêu mở, nó gửi `SYN/ACK` cho zombie, khiến zombie gửi `RST` và tăng IPID lên thêm một bậc. Dựa vào bước nhảy của IPID (+1 = đóng, +2 = mở), kẻ tấn công quét được mục tiêu mà không lộ IP thật. Lệnh: `nmap -sI <Zombie IP> <Target>`.

---

## 6. Các công cụ liên quan

- **Nmap (Network Mapper) (Trang 290)**: Là công cụ quét mạng và bảo mật mạnh mẽ. Nmap cho phép cấu hình linh hoạt các gói tin TCP/UDP để khám phá máy chủ, cổng, dịch vụ, hệ điều hành (OS detection), phát hiện tường lửa và thực hiện ping sweep.
- **Hping3 (Trang 292 - 297)**: Công cụ tạo gói tin (packet crafting tool) qua dòng lệnh. Hỗ trợ TCP, UDP, ICMP và raw-IP. Kẻ tấn công dùng Hping3 để kiểm tra tường lửa, vượt qua IDS, IP spoofing, khám phá MTU, SYN flood, ACK scan và quét lén lút (stealth/idle).
- **NetScanTools Pro (Trang 299)**: Công cụ điều tra mạng tổng hợp (active, passive, DNS) giúp chẩn đoán, giám sát và thu thập thông tin người dùng, IP, cổng mở IPv4/IPv6.
- **MIB Info**: _Management Information Base_ - thường được dùng trong quá trình phân tích danh sách (SNMP Enumeration).
