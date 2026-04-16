## 1. Các khái niệm Kỹ thuật xã hội (Social Engineering Concepts)

- **Lừa chuyển hướng giao hàng (Diversion theft)** [Trang 1396, 1398-1399]: Còn được gọi là "Round the Corner Game" hay "Cornet Game". Kẻ tấn công nhắm vào nhân viên giao hàng hoặc công ty vận tải, lừa người chịu trách nhiệm giao hàng đưa lô hàng đến sai địa điểm, qua đó chiếm đoạt tài sản. Trên môi trường Internet, kỹ thuật này cũng được dùng để lừa nạn nhân gửi các tệp tin bí mật cho một người không liên quan.
- **Đổi chác (Quid pro quo)** [Trang 1397, 1400]: Bắt nguồn từ cụm từ tiếng Latinh mang nghĩa "có qua có lại". Kẻ tấn công gọi đến các số ngẫu nhiên trong công ty và tự xưng là từ bộ phận hỗ trợ kỹ thuật. Khi bắt gặp người dùng đang có sự cố thật, chúng vờ đề nghị "cung cấp dịch vụ giải quyết sự cố" để đổi lấy việc nạn nhân phải cung cấp dữ liệu bí mật, thông tin đăng nhập hoặc nhập lệnh để cài mã độc.
- **Khai thác thông tin qua trò chuyện (Elicitation)** [Trang 1397, 1400]: Kỹ thuật trích xuất thông tin cụ thể từ nạn nhân bằng cách lôi kéo họ vào một cuộc trò chuyện bình thường và làm họ mất cảnh giác. Dựa trên sở thích của nạn nhân, kẻ tấn công dẫn dắt khéo léo để lấy quyền truy cập vào tài sản mục tiêu.
- **Mồi nhử và đánh tráo (Bait and switching)** [Trang 1387, 1400]: Thu hút sự chú ý của nạn nhân bằng lời đề nghị hấp dẫn (như phần mềm giá rẻ/đồ miễn phí) thông qua một liên kết hoặc tệp tải xuống. Ngay khi nạn nhân thao tác, kẻ tấn công thực hiện mục đích thực sự là cài đặt phần mềm độc hại, đánh cắp thông tin hoặc xâm phạm bảo mật (thường nhắm vào khách hàng thương mại điện tử).
- **Kỹ thuật xã hội trên máy tính (Computer-based social engineering)** [Trang 1388, 1401]: Dựa trên máy tính và hệ thống Internet để thực hiện các cuộc tấn công thay vì tương tác vật lý. Các kỹ thuật điển hình bao gồm: Phishing, Spam email, tấn công qua cửa sổ Pop-up, Scareware, sử dụng video Deepfake và nhân bản giọng nói (Voice Cloning).
- **Pharming (Phishing without a Lure / Domain spoofing)** [Trang 1406, 1407, 1433]: Kẻ tấn công tự động chuyển hướng lưu lượng truy cập từ một trang web hợp pháp sang trang lừa đảo của chúng để đánh cắp thông tin bí mật. Được thực hiện thông qua 2 cách:
  - **Đầu độc bộ nhớ cache DNS (DNS cache poisoning):** Đổi IP hợp pháp thành IP độc hại trên máy chủ DNS.
  - **Sửa đổi tệp Host (Host file modifications):** Cài mã độc qua tệp đính kèm email để chỉnh sửa trực tiếp cấu hình tệp `hosts` trên máy nạn nhân.
- **Spimming (SPIM - Spam over Instant Messaging)** [Trang 1406, 1408]: Lợi dụng các nền tảng nhắn tin tức thời. Kẻ tấn công (Spimmer) dùng các mạng bot tự động để thu thập ID tin nhắn và phát tán hàng loạt tin nhắn rác chứa quảng cáo hoặc siêu liên kết độc hại nhằm thu thập chi tiết thẻ tín dụng.
- **Clone phishing (Lừa đảo nhân bản)** [Trang 1406, 1408]: Kẻ tấn công tạo ra một bản sao (clone) gần như giống hệt một giao tiếp/email hợp pháp mà nạn nhân đã nhận trước đó. Sau đó, chúng thay thế liên kết hoặc tệp đính kèm bên trong bằng các nội dung chứa mã độc.
- **Lừa đảo ví điện tử (E-wallet phishing)** [Trang 1406, 1408]: Nhắm vào người dùng ví điện tử. Kẻ tấn công gửi email/tin nhắn giả mạo nhà cung cấp ví hợp pháp, dụ nạn nhân nhấp vào liên kết đến trang web giả. Khi nạn nhân điền thông tin, kẻ tấn công chiếm đoạt thông tin đăng nhập và dữ liệu tài chính theo thời gian thực.
- **Tabnabbing và Reverse tabnabbing** [Trang 1406, 1408-1409]: Khai thác thói quen mở nhiều tab trên trình duyệt của người dùng.
  - **Tabnabbing:** Một trang web độc hại phát hiện khi người dùng chuyển sang tab khác, nó liền tự động thay đổi nội dung để ngụy trang thành một trang đăng nhập hợp pháp (như ngân hàng) chờ người dùng quay lại.
  - **Reverse tabnabbing:** Kẻ tấn công lừa trang web hợp pháp mở một liên kết độc hại trong tab mới. Liên kết này chứa mã chạy ngầm để viết đè và thay đổi nội dung của tab gốc (tab hợp pháp) thành trang lừa đảo.
- **Lừa xin quyền (Consent phishing)** [Trang 1406, 1409]: Lợi dụng giao thức xác thực OAuth (của Google, Facebook, Microsoft). Kẻ tấn công lập ra ứng dụng/trang web giả, dụ nạn nhân nhấp vào và bấm "cấp quyền" (grant permissions). Kẻ tấn công lấy được quyền truy cập email, danh bạ mà không cần biết mật khẩu.
- **Lừa qua kết quả tìm kiếm (Search engine phishing)** [Trang 1406, 1409]: Thao túng kết quả của công cụ tìm kiếm (như dùng kỹ thuật SEO, nhồi từ khóa) để đưa các trang web giả mạo lên top đầu. Khi người dùng nhấp vào kết quả thao túng, họ bị dẫn tới trang mạo danh ngân hàng hoặc chợ trực tuyến.
- **Angler phishing** [Trang 1425]: Một trò gian lận lừa đảo nhắm vào những người dùng đang bất mãn/đăng lời phàn nàn trên mạng xã hội. Kẻ tấn công tạo tài khoản giả mạo bộ phận hỗ trợ (helpdesk) của công ty và trả lời khách hàng bằng một liên kết dịch vụ giả. Nạn nhân nhấp vào sẽ bị cài mã độc hoặc mất dữ liệu.
- **QR code jacking (QRL jacking)** [Trang 1441 - 1442]: Khai thác phương thức "Đăng nhập bằng mã QR" trên các ứng dụng web để chiếm đoạt phiên (hijack login sessions). Kẻ tấn công sao chép (clone) mã QR hợp pháp, nhúng vào trang lừa đảo kèm kịch bản tự động làm mới mã. Khi nạn nhân dùng điện thoại quét mã QR này, thông tin thiết bị (IMEI, Device ID) và phiên đăng nhập sẽ tự động được gửi cho kẻ tấn công để chiếm tài khoản.

## 2. Công cụ tấn công lừa đảo và khai thác AI

### 2.1. Công cụ tấn công lừa đảo (Phishing tools) [Trang 1410 - 1412]

- **ShellPhish:** Công cụ mã nguồn mở dùng để lừa lấy thông tin đăng nhập từ nhiều nền tảng mạng xã hội (như Instagram, Facebook, Twitter, LinkedIn). Ngoài ra, nó có khả năng hiển thị địa chỉ IP công cộng, thông tin trình duyệt, tên máy chủ và định vị (geolocation) của nạn nhân.
- **Social-Engineer Toolkit (SET):** Nền tảng mã nguồn mở bằng Python phục vụ kiểm thử xâm nhập chuyên biệt cho social engineering. Có chức năng phân loại và thực hiện các cuộc tấn công qua email, web và USB (Ví dụ: Spear-Phishing, QRCode Generator, Infectious Media).
- _(Các công cụ bổ sung)_: **Dark-Phish**, **BLACKEYE**, **SocialFish**, **Modlishka**, **Trape**, **Gophish**, **King Phisher**, **LUCY SECURITY**, **Zphisher**.

### 2.2. Công cụ Deepfake/AI (AI Deepfake tools) [Trang 1421 - 1422]

- Yêu cầu mô hình Deep Learning (như CNNs, GANs). Được dùng để tạo video/audio giả mạo dựa trên nguồn dữ liệu sẵn có của mục tiêu để lừa đảo hoặc tống tiền.
- **Công cụ:** **DeepFaceLab** (Công cụ end-to-end cho phép thay thế khuôn mặt, thay đổi tuổi, thao tác môi giữa video nguồn và đích), **Vidnoz**, **Deepfakesweb**, **Synthesia**, **DeepBrain AI**, **Hoodem**.

### 2.3. Công cụ nhân bản giọng nói bằng AI (AI voice cloning tools) [Trang 1423 - 1424]

- Sử dụng thuật toán Máy học (ML) và tổng hợp giọng nói để bắt chước tinh vi giọng nói của một cá nhân, bao gồm cả cao độ, ngữ điệu và phong cách. Kẻ tấn công dùng nó để gọi điện mạo danh tống tiền hoặc vượt qua bảo mật sinh trắc học.
- **Công cụ:** **VEED.IO** (Chuyển văn bản thành vô số đoạn âm thanh chỉ với một mẫu giọng nói), **Murf.AI**, **Resemble.AI**, **ElevenLabs**, **PlayHT**, **voice.ai**.

### 2.4. Công cụ nhân bản mã QR (QR Code Cloning tools) [Trang 1441 - 1443]

- **QR TIGER** [Trang 1441 - 1442]: Trình tạo mã QR cho phép sao chép mã hợp pháp (tĩnh hoặc động). Công cụ này cho phép kẻ tấn công theo dõi dữ liệu sâu (số lần quét, thời gian quét, vị trí).
- _(Các công cụ khác)_: **QR Code Generator**, **Soti MobiControl**, **QR Code KIT**.

## 3. Công cụ phòng thủ và mô phỏng

### 3.1. Thanh công cụ chống lừa đảo (Anti-phishing toolbar) [Trang 1455 - 1456]

- **Netcraft:** Hoạt động như một "kế hoạch theo dõi khu phố khổng lồ" (giant neighborhood watch scheme). Cung cấp thông tin cập nhật liên tục để chặn người dùng truy cập các trang web độc hại/lừa đảo đã được báo cáo trong cộng đồng.
- **PhishTank:** Là trung tâm lưu trữ thông tin hợp tác về lừa đảo trực tuyến. Cung cấp API mở để các nhà phát triển và nghiên cứu tích hợp dữ liệu chống phishing vào phần mềm của họ.
- _(Các công cụ phát hiện khác)_: **Scanurl**, **Isitphishing**, **Threatcop**, **e.Veritas**, **Virustotal**.

### 3.2. Công cụ mô phỏng lừa đảo (Phishing simulation tool) [Trang 1459 - 1460]

- **OhPhish:** Cổng thông tin dựa trên web để kiểm tra mức độ dễ bị tổn thương của nhân viên. Nền tảng này cho phép khởi chạy các chiến dịch lừa đảo giả lập (Entice to Click, Credential Harvesting, Send Attachment, Vishing, Smishing), theo dõi phản hồi theo thời gian thực và xuất báo cáo MIS giúp tổ chức giảm thiểu rủi ro.
