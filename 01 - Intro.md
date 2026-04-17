### CEHv13 - Module 01 - Introduction to Ethical Hacking

---

# Các yếu tố của an ninh thông tin

An ninh thông tin (Information security) là trạng thái bảo vệ sự an toàn của thông tin và cơ sở hạ tầng, trong đó khả năng xảy ra trộm cắp, giả mạo hoặc gián đoạn thông tin và dịch vụ được giữ ở mức thấp hoặc có thể chấp nhận được. Nó đề cập đến việc bảo vệ thông tin và các hệ thống thông tin khỏi sự truy cập, tiết lộ, sửa đổi và phá hủy trái phép.

---

---

- **Bảo mật (Confidentiality):** Đảm bảo thông tin chỉ có thể truy cập bởi những người được ủy quyền. Các biện pháp kiểm soát bao gồm: phân loại dữ liệu (data classification), mã hóa dữ liệu (data encryption), và tiêu hủy thiết bị đúng cách (proper disposal of equipment).
- **Tính toàn vẹn (Integrity):** Đảm bảo sự tin cậy của dữ liệu, ngăn chặn thay đổi trái phép. Các biện pháp bao gồm: sử dụng hàm băm (checksum/hash) và kiểm soát truy cập (access control).
- **Tính sẵn sàng (Availability):** Đảm bảo tài nguyên luôn sẵn sàng cho người dùng hợp pháp khi cần. Các biện pháp bao gồm: hệ thống dự phòng (disk arrays/clustered machines), phần mềm diệt virus, và hệ thống chống DDoS.
- **Tính xác thực (Authenticity):** Đảm bảo tính chính danh của giao tiếp/tài liệu. Các biện pháp kiểm soát: sinh trắc học (biometrics), thẻ thông minh (smart cards), và chứng chỉ số (digital certificates).
- **Phi từ chối (Non-repudiation):** Đảm bảo người gửi không thể chối bỏ việc đã gửi thông điệp. Sử dụng chữ ký số (digital signatures) để đảm bảo yếu tố này.

## Các cuộc tấn công an ninh thông tin: Động cơ, Mục tiêu và Mục đích (Information Security Attacks) (Trang 7 - 17)

- **Công thức tấn công**: Attacks = Motive (Goal) + Method (TTP) + Vulnerability
- **Động cơ (Motives)**: Làm gián đoạn tính liên tục của doanh nghiệp, đánh cắp thông tin và thao túng dữ liệu, tạo sự sợ hãi và hỗn loạn bằng cách phá vỡ các cơ sở hạ tầng quan trọng, gây tổn thất tài chính, tuyên truyền niềm tin tôn giáo hoặc chính trị, đạt mục tiêu quân sự, trả thù, đòi tiền chuộc.

### Lỗ hổng (Vulnerability)

Lỗ hổng là sự tồn tại của điểm yếu trong tài sản có thể bị tác nhân đe dọa khai thác. Các nguyên nhân phổ biến:

- Cấu hình sai phần cứng hoặc phần mềm (Hardware or software misconfiguration).
- Thiết kế mạng và ứng dụng kém/không an toàn (Insecure or poor design of network and application).
- Điểm yếu công nghệ cố hữu (Inherent technology weaknesses).
- Sự bất cẩn của người dùng cuối (Careless approach of end users).
- Hành động cố ý của người dùng (Intentional end-user acts).
- **Bảng ví dụ Lỗ hổng Công nghệ và Cấu hình (Examples of Vulnerabilities) [Trang 11 - 12]:**
  - **Lỗ hổng Công nghệ (Technological Vulnerabilities):**
    - Lỗ hổng giao thức TCP/IP: HTTP, FTP, ICMP, SNMP, SMTP vốn dĩ không an toàn.
    - Lỗ hổng Hệ điều hành: Bản thân OS không an toàn hoặc chưa được cài đặt các bản cập nhật mới nhất.
    - Lỗ hổng Thiết bị mạng: Lỗi do thiếu bảo vệ bằng mật khẩu, thiếu xác thực, giao thức định tuyến không an toàn hoặc lỗ hổng tường lửa.
  - **Lỗ hổng Cấu hình (Configuration Vulnerabilities):**
    - Lỗ hổng tài khoản người dùng: Do truyền tải thông tin tài khoản (username/password) không an toàn qua mạng.
    - Lỗ hổng tài khoản hệ thống: Đặt mật khẩu yếu cho các tài khoản hệ thống.
    - Cấu hình sai dịch vụ Internet: Bật JavaScript, cấu hình sai IIS, Apache, FTP và Terminal services.
    - Mật khẩu và cài đặt mặc định: Để nguyên mật khẩu và cài đặt mặc định của nhà sản xuất.
    - Cấu hình sai thiết bị mạng: Lỗi cấu hình các thiết bị trên hạ tầng mạng.

### Chiến tranh thông tin (Information Warfare)

Chiến tranh thông tin (InfoWar) đề cập đến việc sử dụng công nghệ thông tin và truyền thông (ICT) để giành lợi thế cạnh tranh trước đối thủ.

- **Chiến tranh phòng thủ (Defensive Information Warfare)**: Các chiến lược và hành động được thiết kế để bảo vệ tài sản ICT.
- **Chiến tranh tấn công (Offensive Information Warfare)**: Các cuộc tấn công nhằm vào tài sản ICT của đối thủ.
- **Các loại hình chiến tranh thông tin (Martin Libicki):**
  - **Command and control warfare (C2 warfare):** Trong ngành bảo mật máy tính, chiến tranh C2 đề cập đến tác động mà kẻ tấn công có được đối với một hệ thống hoặc mạng bị xâm phạm mà chúng kiểm soát.
  - **Intelligence-based warfare:** Là công nghệ dựa trên cảm biến làm hỏng trực tiếp các hệ thống công nghệ (bao gồm thiết kế, bảo vệ và từ chối các hệ thống tìm kiếm đủ kiến thức để thống trị không gian chiến đấu).
  - **Electronic warfare:** Sử dụng các kỹ thuật vô tuyến điện tử và mật mã để làm suy giảm thông tin liên lạc (tấn công vào phương tiện vật lý gửi thông tin hoặc phá vỡ các bit/byte).
  - **Psychological warfare:** Sử dụng các kỹ thuật khác nhau như tuyên truyền và khủng bố để làm suy sụp tinh thần đối thủ nhằm giành chiến thắng.
  - **Hacker warfare:** Mục đích có thể thay đổi từ việc đánh sập hệ thống, gây lỗi dữ liệu, trộm cắp thông tin/dịch vụ, giám sát hệ thống, nhắn tin giả mạo. Thường dùng virus, logic bombs, trojan và sniffers.
  - **Economic warfare:** Có thể ảnh hưởng đến nền kinh tế của một doanh nghiệp hoặc quốc gia bằng cách chặn luồng thông tin. Điều này đặc biệt tàn phá đối với các tổ chức kinh doanh nhiều trên thế giới kỹ thuật số.
  - **Cyberwarfare:** Sử dụng hệ thống thông tin chống lại danh tính ảo của cá nhân hoặc nhóm. Đây là loại hình rộng nhất, bao gồm khủng bố thông tin, tấn công ngữ nghĩa (chiếm quyền điều khiển hệ thống mà vẫn giữ vẻ ngoài hoạt động bình thường) và chiến tranh mô phỏng.

## Phân tích rủi ro:

### Ma trận rủi ro

- **Tỷ lệ xảy ra hàng năm (Annual Rate of Occurrence** — ARO)
- **Mức tổn thất đơn lẻ dự kiến (Single Loss Expectancy** — SLE)
- **Giá trị tổn thất dự kiến trong 1 năm (Annual Loss Expectancy** — ALE = SLE × ARO)
- **Kế hoạch duy trì hoạt động (Business Continuity Plan** — BCP)

## Bộ ba CIA (CIA = Confidentiality, Integrity, Availability)

- **Tính Bảo mật (Confidentiality)** — mật khẩu, user ID, danh tính.
- **Tính toàn vẹn (Integrity)** — thay đổi hoặc chỉnh sửa trái phép của dữ liệu; đảm bảo bằng hàm băm (hash function).
- **Tính sẵn sàng (Availability)** — ví dụ: bị ảnh hưởng bởi tấn công từ chối dịch vụ (Denial of Service — DoS).

## Ứng phó sự cố (Incident Response — IR)

### Quy trình cơ bản:

- **Chuẩn bị (Preparation)**: Giai đoạn này bao gồm việc kiểm toán các tài nguyên và tài sản để xác định mục đích bảo mật, đồng thời xác định các quy tắc, chính sách và quy trình định hướng cho toàn bộ quy trình ứng phó sự cố. Nó cũng bao gồm việc xây dựng và đào tạo đội ngũ ứng phó sự cố, thiết lập các quy trình sẵn sàng, thu thập các công cụ cần thiết và đào tạo nhân viên để họ biết cách bảo vệ hệ thống và tài khoản của mình
- **Ghi nhận và phân công (Recording and assignment)**: Là giai đoạn báo cáo và ghi chép ban đầu khi sự cố xảy ra. Giai đoạn này chịu trách nhiệm xác định sự cố, thiết lập các kế hoạch liên lạc nội bộ phù hợp cho nhân viên, và bao gồm các phương thức giao tiếp như thông báo cho nhân sự hỗ trợ CNTT hoặc tạo phiếu hỗ trợ (ticket) tương ứng
- **Phân loại ưu tiên (Triage)**: Trong giai đoạn này, các sự cố bảo mật đã được xác định sẽ được phân tích, xác minh, phân loại và sắp xếp thứ tự ưu tiên. Đội ngũ IH&R sẽ phân tích sâu hơn thiết bị bị xâm phạm để tìm ra các chi tiết của sự cố như: loại hình tấn công, mức độ nghiêm trọng, mục tiêu, tác động, phương thức lây lan và bất kỳ lỗ hổng nào đã bị khai thác
- **Thông báo (Notification)**: Trong giai đoạn thông báo, đội ngũ IH&R sẽ cung cấp thông tin về sự cố đã được xác định cho các bên liên quan khác nhau, bao gồm ban quản lý, nhà cung cấp bên thứ ba và khách hàng
- **Cách ly (Containment)**: Giai đoạn này giúp ngăn chặn sự lây lan của mối đe dọa (hoặc sự lây nhiễm) sang các tài sản khác trong tổ chức, qua đó ngăn ngừa các thiệt hại phát sinh thêm
- **Thu thập bằng chứng và phân tích pháp y (Evidence Gathering and Forensic Analysis)**: Đội ngũ IH&R sẽ thu thập tất cả các bằng chứng có thể có liên quan đến sự cố và nộp cho bộ phận pháp y để điều tra. Phân tích pháp y sẽ tiết lộ các chi tiết như phương thức tấn công, lỗ hổng bị khai thác, các cơ chế bảo mật đã bị vượt qua, các thiết bị mạng bị lây nhiễm và các ứng dụng bị xâm phạm
- **Loại bỏ (Eradication)**: Trong giai đoạn loại bỏ, đội ngũ IH&R tiến hành gỡ bỏ và tiêu diệt nguyên nhân gốc rễ gây ra sự cố, đồng thời đóng tất cả các con đường tấn công (attack vectors) để ngăn chặn các sự cố tương tự xảy ra trong tương lai
- **Phục hồi (Recovery)**: Sau khi loại bỏ các nguyên nhân gây ra sự cố, đội ngũ sẽ tiến hành khôi phục lại các hệ thống, dịch vụ, tài nguyên và dữ liệu bị ảnh hưởng. Đội ngũ ứng phó sự cố có trách nhiệm đảm bảo rằng sự cố không gây ra bất kỳ sự gián đoạn nào đối với các dịch vụ hoặc hoạt động kinh doanh của tổ chức
- **Hoạt động sau sự cố (Post-incident activity)**: Sau khi quá trình xử lý hoàn tất, sự cố bảo mật yêu cầu phải được xem xét và phân tích bổ sung trước khi đóng lại vụ việc. Đánh giá cuối cùng này bao gồm các công việc: lập tài liệu về sự cố, đánh giá tác động của sự cố, xem xét và sửa đổi các chính sách, đóng hồ sơ điều tra và công bố thông tin về sự cố

## Khái niệm Hacking và Ethical Hacking (Hacking & Ethical Hacking Concepts) (Trang 18 - 44)

- **Hacking**: Khai thác các lỗ hổng hệ thống và xâm phạm các biện pháp kiểm soát bảo mật để giành quyền truy cập trái phép vào tài nguyên của hệ thống.
- _Mở rộng khái niệm Hacking:_ Nó liên quan đến việc sửa đổi các tính năng của hệ thống hoặc ứng dụng để đạt được mục tiêu nằm ngoài mục đích ban đầu của người tạo ra nó. Việc hack mạng máy tính thường được thực hiện bằng cách sử dụng các tập lệnh (scripts) hoặc lập trình mạng. Động cơ đằng sau việc hack có thể là để đánh cắp thông tin hoặc dịch vụ quan trọng, vì cảm giác hồi hộp, thử thách trí tuệ, sự tò mò, thử nghiệm, kiến thức, lợi ích tài chính, uy tín, quyền lực, sự công nhận của đồng nghiệp, trả thù hoặc hận thù.
- **Ethical Hacking**: Việc sử dụng các công cụ, thủ thuật và kỹ thuật hacking để xác định lỗ hổng và đảm bảo an ninh hệ thống, được thực hiện một cách hợp pháp với sự cho phép của cơ quan/tổ chức chủ quản.
  - **Sự cần thiết của Ethical Hacking (Why Ethical Hacking is Necessary)** [Trang 29 - 30]:
    - Ethical Hacking cho phép đưa ra các biện pháp phản công chống lại tin tặc độc hại bằng cách dự đoán các phương pháp chúng dùng để đột nhập vào hệ thống.
    - Lý do tổ chức cần thuê Ethical Hackers: Ngăn chặn tin tặc truy cập vào hệ thống thông tin; Khám phá và phân tích các lỗ hổng tiềm tàng; Phân tích và củng cố tư thế bảo mật (chính sách, hạ tầng, thực hành người dùng); Cung cấp biện pháp phòng ngừa để tránh vi phạm; Bảo vệ dữ liệu khách hàng; Nâng cao nhận thức bảo mật.
    - Đánh giá của một Ethical Hacker nhằm trả lời 3 câu hỏi cơ bản:
      - Kẻ tấn công có thể nhìn thấy gì trên hệ thống đích?
      - Kẻ xâm nhập có thể làm gì với những thông tin đó?
      - Các nỗ lực của kẻ tấn công có bị phát hiện trên hệ thống đích hay không?
      - **Ngoài ra, toàn bộ quá trình ethical hacking và việc vá các lỗ hổng phát hiện được phụ thuộc vào các câu hỏi định hướng sau:**
      - Tổ chức đang cố gắng bảo vệ điều gì? (What is the organization trying to protect?)
      - Bảo vệ khỏi ai hoặc cái gì? (Against whom or what are they trying to protect it?)
      - Tất cả các thành phần của hệ thống thông tin đã được bảo vệ, cập nhật và vá lỗi đầy đủ chưa?
      - Khách hàng sẵn sàng đầu tư bao nhiêu thời gian, công sức và tiền bạc để có được sự bảo vệ đầy đủ?
      - Các biện pháp an ninh thông tin có tuân thủ các tiêu chuẩn ngành và pháp lý không?
- **Phạm vi và Giới hạn (Scope and Limitations)**:
  - **Phạm vi**: Là thành phần quan trọng trong đánh giá rủi ro, kiểm toán, chống gian lận; giúp xác định rủi ro, đề xuất hành động khắc phục và giảm chi phí CNTT.
  - **Giới hạn**: Ethical Hacker chỉ có thể giúp tổ chức hiểu rõ hơn về hệ thống bảo mật của họ; việc triển khai các biện pháp bảo vệ phù hợp hoàn toàn là trách nhiệm của tổ chức.
- **Kỹ năng của Ethical Hacker (Skills of an Ethical Hacker)**:
  - **Kỹ năng kỹ thuật**: Kiến thức chuyên sâu về hệ điều hành (Windows, Linux, v.v.), mạng, máy tính, bảo mật và có khả năng thực hiện các cuộc tấn công phức tạp.
  - **Kỹ năng phi kỹ thuật**: Khả năng học hỏi và thích ứng nhanh, đạo đức nghề nghiệp, tuân thủ chính sách bảo mật của tổ chức, nhận thức về luật và tiêu chuẩn địa phương.

## AI-Driven Ethical Hacking (Ethical Hacking được hỗ trợ bởi AI)

Sử dụng các công nghệ trí tuệ nhân tạo (như thuật toán AI, mô hình học máy, framework tự động hóa) để nâng cao khả năng của ethical hacker.

- **Lợi ích**: Cải thiện Hiệu quả (Efficiency), Độ chính xác (Accuracy), Khả năng mở rộng (Scalability), và Hiệu quả chi phí (Cost-Effectiveness).
- **Ứng dụng của Ethical Hacking được hỗ trợ bởi AI (Applications of AI-Driven Ethical Hacking) [Trang 35 - 37]**:
  - **An ninh mạng (Network Security)**: Giám sát lưu lượng mạng để tìm kiếm các hoạt động đáng ngờ và các vi phạm tiềm ẩn.
  - **Bảo mật ứng dụng (Application Security)**: Kiểm thử lỗ hổng trên các ứng dụng Web và di động bằng các công cụ hỗ trợ AI.
  - **Bảo mật đám mây (Cloud Security)**: Xác định và giảm thiểu rủi ro trong môi trường đám mây.
  - **Bảo mật IoT (IoT Security)**: Bảo vệ các thiết bị Internet of Things (IoT) khỏi các mối đe dọa mạng.
  - **Tình báo mối đe dọa (Threat Intelligence)**: Thu thập và phân tích dữ liệu về mối đe dọa để cung cấp các thông tin hữu ích có thể hành động.
- **Cách AI hỗ trợ Ethical Hacker (How AI-Driven Ethical Hacking Helps Ethical Hacker?) [Trang 35 - 37]**:
  - **Tự động hóa các tác vụ lặp đi lặp lại (Automation of Repetitive Tasks)**: Tự động hóa quét lỗ hổng, giám sát lưu lượng mạng và xác định các mối đe dọa tiềm ẩn.
  - **Phân tích dự đoán (Predictive Analysis)**: Dự đoán các vi phạm an ninh tiềm ẩn bằng cách phân tích các mẫu dữ liệu và những điểm bất thường từ các cuộc tấn công trong quá khứ.
  - **Phát hiện mối đe dọa nâng cao (Advanced Threat Detection)**: Phát hiện các mối đe dọa tinh vi và chưa từng được biết đến (như zero-day) thông qua công nghệ deep learning.
  - **Cải thiện ra quyết định (Enhanced Decision Making)**: Cung cấp thông tin chi tiết và khuyến nghị dựa trên phân tích dữ liệu để phân bổ tài nguyên hiệu quả.
  - **Học tập thích ứng (Adaptive Learning)**: Hệ thống AI liên tục học hỏi và cập nhật cơ sở kiến thức để thích ứng với các loại hình tấn công mới mà không cần can thiệp thủ công.
  - **Báo cáo nâng cao (Enhanced Reporting)**: Tạo ra các báo cáo chi tiết và chính xác về lỗ hổng cùng với tác động tiềm ẩn của chúng.
  - **Mô phỏng và kiểm tra (Simulation and Testing)**: Mô phỏng các cuộc tấn công trong thế giới thực để kiểm tra khả năng phục hồi của hệ thống.
  - **Khả năng mở rộng (Scalability)**: Xử lý môi trường quy mô lớn và các hệ thống phức tạp hiệu quả hơn phương pháp thủ công.
  - **Giám sát liên tục (Continuous Monitoring)**: Đánh giá tình trạng bảo mật liên tục, phát hiện và giảm thiểu rủi ro theo thời gian thực.
  - **Cơ chế phòng thủ thích ứng (Adaptive Defense Mechanisms)**: Tự động cập nhật thuật toán và chiến lược phản ứng để chống lại các kỹ thuật hacking mới nhất.
- **Quan niệm sai lầm (Myth) - "AI sẽ thay thế Ethical Hackers"**: AI chỉ là một công cụ hỗ trợ giá trị, KHÔNG thể thay thế con người. Việc hacking đòi hỏi chuyên môn sâu, tính sáng tạo, tư duy phản biện và sự hiểu biết theo ngữ cảnh mà hệ thống AI không thể tự hoạt động độc lập.
- **Các công cụ AI tích hợp ChatGPT (ChatGPT-Powered AI Tools)** [Trang 40 - 44]: Tính năng chi tiết của một số công cụ AI tích hợp ChatGPT:
  - **ShellGPT**: Trợ lý dòng lệnh giúp tạo, hoàn thành lệnh shell, viết code an toàn, tự động tạo tài liệu/comments và trả lời câu hỏi trực tiếp trên terminal.
  - **AutoGPT**: Tự động hóa quá trình xử lý dữ liệu, thực thi tác vụ và tối ưu hóa luồng công việc an ninh mạng.
  - **WormGPT**: Hỗ trợ tạo các kịch bản (scripts) và payload tinh vi giống như mã độc (worm-like) để phục vụ mục đích kiểm thử và phòng thủ.
  - **ChatGPT with DAN prompt**: Phiên bản tùy chỉnh sử dụng kỹ thuật DAN (Do Anything Now) để vượt qua các hạn chế mặc định, hỗ trợ linh hoạt hơn trong kiểm thử.
  - **FreedomGPT**: Vượt qua các bộ lọc nội dung truyền thống để cung cấp quyền truy cập AI không bị hạn chế.
  - **FraudGPT**: Chuyên phân tích mô hình hành vi, xác định giao dịch đáng ngờ và ngăn chặn các hoạt động gian lận.
  - **ChaosGPT**: Khám phá và mô phỏng các hành vi nguy hiểm, khó lường.
  - **PoisonGPT**: Giới thiệu các mô hình độc hại vào hệ thống AI để nghiên cứu và xây dựng phòng thủ chống lại các cuộc tấn công đầu độc mô hình (model poisoning).
  - **HackerGPT**: Hỗ trợ thời gian thực cho ethical hacker trong việc xác định lỗ hổng và tự động hóa tác vụ phức tạp.
  - **BurpGPT**: Tích hợp với Burp Suite để tự động phân tích lỗ hổng web và giảm tỷ lệ cảnh báo sai (false positives).
  - **PentestGPT**: Hỗ trợ tự động hóa các khía cạnh của quy trình kiểm thử xâm nhập, đánh giá và xuất báo cáo.
  - **Các công cụ hỗ trợ khác**:
    - **BugBountyGPT:** Được thiết kế riêng cho các thợ săn tiền thưởng lỗi (bug bounty hunters), cung cấp các công cụ và thông tin chi tiết để xác định và báo cáo các lỗ hổng bảo mật, tự động hóa việc phát hiện và tích hợp liền mạch với các nền tảng bug bounty.
    - **GPT White Hack:** Tập trung vào ethical hacking và cung cấp các công cụ để xác định, giảm thiểu các mối đe dọa. Sử dụng AI để đánh giá rủi ro và phát hiện mối đe dọa, đưa ra các khuyến nghị thời gian thực.
    - **CybGPT:** Công cụ AI toàn diện tích hợp tình báo mối đe dọa, tự động hóa các đánh giá bảo mật và cung cấp khả năng ứng phó sự cố (incident-response) do AI điều khiển.
    - **BugHunterGPT:** Hỗ trợ các nhà nghiên cứu bảo mật xác định và báo cáo lỗi, tự động hóa quy trình phát hiện và tích hợp nhiều nền tảng báo cáo khác nhau.
    - **Hacking APIs GPT:** Tập trung vào việc xác định các lỗ hổng trong API và cung cấp các công cụ để kiểm tra, bảo mật chúng (tự động quét lỗ hổng API và phân tích do AI thúc đẩy).
    - **h4ckGPT:** Một công cụ AI linh hoạt cung cấp hỗ trợ thời gian thực, tự động hóa việc xác định lỗ hổng và cung cấp các đề xuất/thông tin chi tiết.
    - **HackerNewsGPT:** Tận dụng AI để cung cấp tin tức và cập nhật thời gian thực cho các chuyên gia an ninh mạng, tổng hợp tin tức và thực hiện phân tích xu hướng bảo mật.
    - **Ethical Hacker GPT:** Cung cấp các công cụ và thông tin chi tiết được thiết kế riêng cho ethical hackers, bao gồm đánh giá lỗ hổng, hỗ trợ hack thời gian thực và báo cáo toàn diện.
    - **GP(en)T(ester):** Công cụ hỗ trợ tự động hóa các quy trình Red teaming, xác định lỗ hổng bằng AI và tạo báo cáo chi tiết.

## Hành vi tấn công / Phương pháp tấn công và các giai đoạn tấn công (Hacking methodology / CEH Ethical Hacking Framework):

1. **Giai đoạn 1: Thu thập thông tin (Reconnaissance / Footprinting)** - Trang 47 D
   Footprinting và reconnaissance (thu thập thông tin và do thám) cấu thành giai đoạn chuẩn bị, trong đó kẻ tấn công thu thập càng nhiều thông tin càng tốt về mục tiêu trước khi tiến hành một cuộc tấn công. Trong giai đoạn này, kẻ tấn công tạo một hồ sơ về tổ chức mục tiêu và thu được các thông tin như dải địa chỉ IP, namespace và thông tin nhân viên. Footprinting tạo điều kiện thuận lợi cho việc hack hệ thống bằng cách tiết lộ các lỗ hổng. Ví dụ: trang web của tổ chức có thể cung cấp tiểu sử nhân viên hoặc danh bạ nhân sự, mà hacker có thể sử dụng cho các kỹ thuật social engineering. Thực hiện truy vấn Whois trên web có thể cung cấp thông tin về mạng và tên miền được liên kết với một tổ chức cụ thể. Phạm vi mục tiêu của footprinting có thể bao gồm khách hàng, nhân viên, hoạt động, mạng và hệ thống của tổ chức mục tiêu.

Các kỹ thuật do thám được phân loại rộng rãi thành chủ động và thụ động:

- **Do thám thụ động (Passive reconnaissance):** Khi kẻ tấn công sử dụng kỹ thuật do thám thụ động, chúng không tương tác trực tiếp với mục tiêu. Thay vào đó, kẻ tấn công dựa vào thông tin có sẵn công khai, các thông cáo báo chí hoặc các phương pháp không tiếp xúc khác.
- **Do thám chủ động (Active reconnaissance):** Mặt khác, kỹ thuật này liên quan đến các tương tác trực tiếp với hệ thống mục tiêu bằng cách sử dụng các công cụ để phát hiện các cổng mở, các host có thể truy cập, vị trí bộ định tuyến, lập bản đồ mạng, thông tin chi tiết về hệ điều hành và các ứng dụng.

**Quét mạng (Scanning) - Trang 47**
Scanning được sử dụng để xác định các host đang hoạt động, các cổng mở và các dịch vụ không cần thiết được bật trên các host cụ thể. Trong giai đoạn này, kẻ tấn công sử dụng các thông tin chi tiết thu thập được trong quá trình do thám để quét mạng nhằm tìm kiếm các thông tin cụ thể. Scanning là một sự mở rộng hợp lý của do thám chủ động; trên thực tế, một số chuyên gia không phân biệt scanning với do thám chủ động. Tuy nhiên, có một sự khác biệt nhỏ là scanning bao gồm việc thăm dò sâu hơn từ phía kẻ tấn công. Thông thường, các giai đoạn do thám và quét mạng đan xen vào nhau, và không phải lúc nào cũng có thể tách rời chúng.

**Liệt kê (Enumeration) - Trang 47**
Enumeration liên quan đến việc tạo các kết nối tích cực (active connections) đến hệ thống mục tiêu hoặc gửi các truy vấn trực tiếp. Đây là phương pháp thăm dò xâm nhập (intrusive probing) qua đó kẻ tấn công thu thập thông tin như danh sách người dùng mạng, bảng định tuyến, lỗ hổng bảo mật, người dùng được chia sẻ, nhóm, ứng dụng và các banner.

2. **Giai đoạn 2: Quét lỗ hổng (Vulnerability Scanning)** - Trang 48
   Đánh giá lỗ hổng là quá trình kiểm tra khả năng chống chịu tấn công của một hệ thống hoặc ứng dụng, bao gồm các quy trình và kiểm soát bảo mật hiện tại của nó. Quá trình này nhận diện, đo lường và phân loại các lỗ hổng bảo mật trong hệ thống máy tính, mạng và các kênh liên lạc. Kẻ tấn công thực hiện phân tích lỗ hổng để xác định các điểm yếu bảo mật trong cơ sở hạ tầng mạng, cơ sở hạ tầng truyền thông và các hệ thống đầu cuối của tổ chức mục tiêu. Các lỗ hổng được xác định sẽ được kẻ tấn công sử dụng để thực hiện việc khai thác sâu hơn mạng mục tiêu.

3. **Giai đoạn 3: Đột nhập (Gaining Access)** - Trang 48
   Đây là giai đoạn mà quá trình hack thực sự diễn ra. Các giai đoạn trước giúp kẻ tấn công xác định các lỗ hổng và điểm yếu bảo mật trong các tài sản CNTT của tổ chức mục tiêu. Kẻ tấn công sử dụng những thông tin này, cùng với các kỹ thuật như bẻ khóa mật khẩu và khai thác lỗ hổng bao gồm cả tràn bộ đệm, để giành quyền truy cập vào hệ thống tổ chức.

Đột nhập (Gaining access) đề cập đến thời điểm mà kẻ tấn công có được quyền truy cập vào hệ điều hành (OS) hoặc các ứng dụng trên máy tính hoặc mạng. Cơ hội giành quyền truy cập thành công vào hệ thống mục tiêu của hacker phụ thuộc vào một số yếu tố, chẳng hạn như kiến trúc và cấu hình của hệ thống mục tiêu, trình độ kỹ năng của kẻ thù và mức độ truy cập ban đầu đạt được. Một khi kẻ tấn công giành được quyền truy cập vào hệ thống mục tiêu, chúng cố gắng leo thang đặc quyền để nắm quyền kiểm soát hoàn toàn. Trong quá trình này, chúng cũng xâm phạm các hệ thống trung gian được kết nối với nó.

**Leo thang đặc quyền (Escalating Privileges)** - Trang 48
Sau khi giành được quyền truy cập vào hệ thống bằng tài khoản người dùng có đặc quyền thấp, kẻ tấn công có thể cố gắng tăng đặc quyền của mình lên mức quản trị viên để thực hiện các hoạt động hệ thống được bảo vệ, để từ đó chúng có thể tiến tới cấp độ tiếp theo của giai đoạn hack hệ thống, đó là thực thi các ứng dụng. Kẻ tấn công khai thác các lỗ hổng hệ thống đã biết để leo thang đặc quyền của người dùng.

4. **Giai đoạn 4: Duy trì truy cập (Maintaining Access)** - Trang 48
   Duy trì truy cập đề cập đến giai đoạn mà kẻ tấn công cố gắng duy trì quyền sở hữu hệ thống. Khi kẻ tấn công đã giành được quyền truy cập vào hệ thống mục tiêu với đặc quyền admin hoặc root (tức là làm chủ hệ thống), chúng có thể tùy ý sử dụng cả hệ thống và tài nguyên của nó. Kẻ tấn công có thể sử dụng hệ thống này như một bệ phóng để quét và khai thác các hệ thống khác hoặc giữ một vị thế ẩn mình và tiếp tục quá trình khai thác. Cả hai hành động này đều có thể gây ra thiệt hại đáng kể.

Kẻ tấn công có thể tải lên, tải xuống hoặc thao tác dữ liệu, ứng dụng và cấu hình trên hệ thống đã bị chiếm quyền, đồng thời sử dụng phần mềm độc hại để chuyển tên người dùng, mật khẩu và bất kỳ thông tin nào khác được lưu trữ trong hệ thống. Chúng có thể duy trì quyền kiểm soát hệ thống trong một thời gian dài bằng cách đóng các lỗ hổng để ngăn chặn những hacker khác khai thác chúng. Đôi khi, trong quá trình này, kẻ tấn công có thể cung cấp một mức độ bảo vệ nhất định cho hệ thống khỏi các cuộc tấn công khác. Kẻ tấn công sử dụng các hệ thống đã bị xâm phạm để khởi chạy các cuộc tấn công tiếp theo.

5. **Giai đoạn 5: Xóa dấu vết (Clearing Tracks)** - Trang 49
   Để không bị phát hiện, điều quan trọng đối với những kẻ tấn công là phải xóa bỏ mọi bằng chứng về việc hệ thống đã bị xâm phạm. Để đạt được điều này, chúng có thể sửa đổi hoặc xóa các bản ghi nhật ký (logs) trong hệ thống bằng cách sử dụng một số tiện ích xóa nhật ký, từ đó loại bỏ tất cả bằng chứng về sự hiện diện của chúng.

## Quản lý sự kiện và sự cố bảo mật (Security Information and Event Management — SIEM) — ví dụ: Splunk.

## 1. Cyber Kill Chain (Chuỗi tiêu diệt không gian mạng) - Trang 50-53

Phương pháp luận Cyber Kill Chain là một thành phần của phòng thủ dựa trên thông tin tình báo nhằm xác định và ngăn chặn các hoạt động xâm nhập độc hại. Theo Lockheed Martin, các cuộc tấn công mạng thường diễn ra qua 7 giai đoạn:

- **Trinh sát (Reconnaissance):** Hoạt động của kẻ tấn công bao gồm thu thập thông tin qua mạng xã hội, phân tích website, thực hiện Whois, DNS, network footprinting, và quét cổng/dịch vụ (scanning).
- **Vũ khí hóa (Weaponization):** Dựa trên lỗ hổng đã xác định, kẻ tấn công tạo payload độc hại. Hoạt động bao gồm: xác định payload phù hợp, tạo/sửa đổi malware payload, tạo chiến dịch email phishing, hoặc tận dụng exploit kits và botnets.
- **Giao chuyển (Delivery):** Payload được truyền tải tới nạn nhân. Hoạt động bao gồm: gửi email phishing, phân phát USB chứa mã độc, hoặc thực hiện tấn công watering hole trên các website bị xâm phạm.
- **Khai thác (Exploitation):** Mã độc được kích hoạt để khai thác lỗ hổng. Hoạt động bao gồm: khai thác các lỗ hổng phần mềm/phần cứng để giành quyền truy cập từ xa vào hệ thống mục tiêu.
- **Cài đặt (Installation):** Cài đặt malware để duy trì truy cập. Hoạt động bao gồm: tải và cài đặt backdoors, sử dụng các phương pháp để ẩn giấu backdoor khỏi tường lửa/IDS.
- **Điều khiển và chỉ huy (Command and Control):** Kẻ tấn công thiết lập kênh giao tiếp hai chiều. Hoạt động bao gồm: liên lạc với máy chủ C&C qua web traffic, email, DNS messages, thực hiện leo thang đặc quyền và dùng mã hóa để xóa dấu vết.
- **Hành động theo mục tiêu (Actions on Objectives):** Điều khiển hệ thống nạn nhân từ xa để hoàn thành mục tiêu cuối cùng (đánh cắp, phá hoại, hoặc dùng làm bàn đạp tấn công).

---

## 2. Xác định hành vi kẻ tấn công (Adversary Behavioral Identification) - Trang 56-58

Xác định hành vi của kẻ thù liên quan đến việc nhận diện các phương pháp và kỹ thuật phổ biến mà kẻ tấn công sử dụng. Các hành vi này bao gồm:

- **Trinh sát nội bộ (Internal Reconnaissance) - Trang 56:** Khi đã xâm nhập mạng, kẻ tấn công liệt kê các hệ thống, tiến trình, và thực thi các lệnh bất thường trong Batch scripts hoặc PowerShell để thu thập thông tin cấu hình.
- **Sử dụng PowerShell - Trang 56:** Công cụ này bị kẻ tấn công lạm dụng để tự động hóa việc đánh cắp (exfiltration) dữ liệu và phát động các cuộc tấn công.
- **Các hoạt động Proxy không xác định (Unspecified Proxy Activities) - Trang 57:** Kẻ tấn công tạo và cấu hình nhiều tên miền cùng trỏ về một máy chủ để luân chuyển nhanh chóng nhằm tránh bị phát hiện.
- **Sử dụng Giao diện Dòng lệnh (Command-Line Interface) - Trang 57:** Tương tác với hệ thống mục tiêu để đọc, sửa file, tạo tài khoản và tải mã độc.
- **HTTP User Agent - Trang 57:** Sửa đổi trường HTTP user agent để thiết lập giao tiếp với hệ thống đã bị xâm phạm và che giấu lưu lượng.
- **Máy chủ C&C (Command and Control Server) - Trang 57:** Sử dụng các máy chủ C&C thông qua kênh mã hóa để đánh cắp, xóa dữ liệu và phát động tấn công.
- **Sử dụng DNS Tunneling - Trang 57:** Che giấu lưu lượng độc hại bên trong các giao thức hợp lệ của mạng để giao tiếp với máy chủ C&C và qua mặt các chốt kiểm soát.
- **Sử dụng Web Shell - Trang 57 & 58:** Tạo một shell trên trang web để giành quyền thao túng máy chủ từ xa, thực hiện chuyển file và đánh cắp dữ liệu.
- **Chuẩn bị dữ liệu (Data Staging) - Trang 58:** Thu thập và kết hợp càng nhiều dữ liệu (nhạy cảm, cấu trúc mạng, thông tin nhân viên) càng tốt trước khi tiến hành trích xuất hoặc tiêu hủy.

---

## 3. TTPs — Tactics, Techniques, Procedures (Chiến thuật, Kỹ thuật, Thủ tục) - Trang 9 & 53-55

Thuật ngữ TTPs đề cập đến các kiểu hoạt động và phương pháp gắn liền với các tác nhân đe dọa.

- **Tactics (Chiến thuật) - Trang 9 & 53:** Được định nghĩa là chiến lược mà kẻ tấn công áp dụng để thực hiện cuộc tấn công từ đầu đến cuối. Nó mô tả cách kẻ đe dọa hoạt động trong các giai đoạn khác nhau để thu thập thông tin, thỏa hiệp ban đầu và di chuyển ngang.
- **Techniques (Kỹ thuật) - Trang 9 & 54:** Là các phương pháp kỹ thuật cụ thể mà kẻ tấn công sử dụng để đạt được kết quả trung gian trong suốt cuộc tấn công. Các kỹ thuật này bao gồm sử dụng công cụ để leo thang đặc quyền, thiết lập kênh C&C và xóa dấu vết.
- **Procedures (Thủ tục) - Trang 9 & 55:** Là cách tiếp cận có hệ thống hoặc chuỗi các hành động thực tế do kẻ tấn công thực hiện để triển khai các bước trong vòng đời của cuộc tấn công.

---

## 4. Chỉ báo xâm phạm (Indicator of Compromise — IoC) - Trang 58-59

IoC là các manh mối, hiện vật và mẩu dữ liệu pháp y được tìm thấy trên mạng hoặc hệ thống, cho thấy một sự xâm nhập tiềm ẩn hoặc hoạt động độc hại. Chúng được chia thành 4 danh mục chính:

- **Chỉ báo email (Email Indicators) - Trang 59:** Thông tin về các email lừa đảo (phishing) bao gồm địa chỉ người gửi, tiêu đề email (subject), và các loại tệp đính kèm hoặc liên kết.
- **Chỉ báo mạng (Network Indicators) - Trang 59:** Hữu ích cho việc phát hiện Command & Control và phân phát mã độc, bao gồm: URL, tên miền (domain name), và địa chỉ IP.
- **Chỉ báo trên host (Host-Based Indicators) - Trang 59:** Được tìm thấy qua việc phân tích hệ thống bị nhiễm, bao gồm: tên tệp (filenames), mã băm (file hashes), khóa registry (registry keys), DLLs và mutex.
- **Chỉ báo hành vi (Behavioral Indicators) - Trang 59:** Xác định các dấu hiệu xâm nhập bất thường như: thực thi tài liệu chứa lệnh PowerShell, yêu cầu DNS bất thường (Unusual DNS requests), đăng nhập thất bại nhiều lần, lưu lượng mạng gọi ra ngoài bất thường, hoặc thay đổi hệ thống/registry đáng ngờ.
  - Lưu lượng mạng gọi ra ngoài bất thường (Unusual outbound network traffic).
  - Hoạt động bất thường thông qua tài khoản người dùng đặc quyền.
  - Sự bất thường về vị trí địa lý (Geographical anomalies).
  - Đăng nhập thất bại nhiều lần.
  - Khối lượng đọc cơ sở dữ liệu tăng đột biến.
  - Kích thước phản hồi HTML lớn bất thường.
  - Nhiều yêu cầu (requests) đối với cùng một tệp tin.
  - Lưu lượng giữa cổng và ứng dụng không khớp (Mismatched port-application traffic).
  - Các thay đổi đáng ngờ đối với registry hoặc tệp hệ thống.
  - Yêu cầu DNS bất thường.
  - Các bản vá hệ thống xuất hiện không mong muốn (Unexpected patching of systems).
  - Dấu hiệu hoạt động của Tấn công từ chối dịch vụ (DDoS).
  - Các gói dữ liệu (Bundles of data) nằm sai vị trí.
  - Lưu lượng web với hành vi "siêu phàm" (Web traffic with superhuman behavior - dấu hiệu của bot/script).

## 5. MITRE ATT&CK Framework (Trang 61 - 62)

MITRE ATT&CK là một cơ sở kiến thức có thể truy cập toàn cầu về các chiến thuật (tactics) và kỹ thuật (techniques) của kẻ tấn công, được xây dựng dựa trên các quan sát trong thế giới thực. Nó được sử dụng làm nền tảng để phát triển các mô hình mối đe dọa (threat models) và phương pháp luận trong khu vực tư nhân, chính phủ, và cộng đồng sản phẩm/dịch vụ an ninh mạng.

MITRE ATT&CK bao gồm 3 bộ chiến thuật và kỹ thuật: Enterprise, Mobile, và PRE-ATT&CK. Trong đó, 14 danh mục chiến thuật (Tactics) của ATT&CK dành cho Enterprise được bắt nguồn từ các giai đoạn sau của chuỗi Cyber Kill Chain:

- Reconnaissance (Trinh sát)
- Resource Development (Phát triển tài nguyên)
- Initial Access (Truy cập ban đầu)
- Execution (Thực thi)
- Persistence (Duy trì)
  **Các trường hợp sử dụng (Use Cases) của MITRE ATT&CK cho Enterprise [Trang 62]:**
- Ưu tiên nỗ lực phát triển và mua sắm cho việc phòng thủ mạng máy tính.
- Tiến hành phân tích, đánh giá các giải pháp thay thế giữa các tính năng phòng thủ mạng khác nhau.
- Xác định độ "phủ" (coverage) của một nhóm các khả năng phòng thủ.
- Mô tả chuỗi sự kiện xâm nhập một cách xuyên suốt dựa trên kỹ thuật dùng chung.
- Xác định các điểm chung và đặc điểm phân biệt giữa các chiêu thức của kẻ thù.
- Kết nối trực tiếp giữa các biện pháp giảm nhẹ rủi ro (mitigations), điểm yếu (weaknesses) và kẻ tấn công (adversaries).

- Privilege Escalation (Leo thang đặc quyền)
- Defense Evasion (Lẩn tránh phòng thủ)
- Credential Access (Truy cập thông tin xác thực)
- Discovery (Khám phá)
- Lateral Movement (Di chuyển ngang)
- Collection (Thu thập)
- Command and Control (Điều khiển và Chỉ huy)
- Exfiltration (Trích xuất dữ liệu)
- Impact (Tác động)

_(Lưu ý: Mặc dù phân đoạn này không trực tiếp định nghĩa "Subtechniques", các khái niệm cơ bản đã được định nghĩa chi tiết ở phần TTPs - Trang 53-55, trong đó Tactics là chiến lược tổng thể, Techniques là phương pháp kỹ thuật, Procedures là chuỗi các hành động thực tế)._

## 6. Mô hình Diamond (Diamond Model of Intrusion Analysis) (Trang 63 - 66)

Mô hình này cung cấp một khuôn khổ để xác định các sự kiện có tương quan với nhau trong một cuộc xâm nhập, xoay quanh 4 tính năng cốt lõi tạo thành hình viên kim cương:

- **Adversary (Kẻ tấn công - WHO):** Đối thủ đứng sau cuộc tấn công. Kẻ tấn công lợi dụng khả năng (capability) nhắm vào nạn nhân để trục lợi hoặc phá hoại. Họ có thể là người trong cuộc (insiders) hoặc tổ chức đối thủ.
- **Capability (Khả năng - HOW):** Các chiến lược, phương pháp và thủ tục liên quan đến cuộc tấn công, hay "cách thức" cuộc tấn công được thực hiện. Bao gồm cả các công cụ (malware, công cụ kỹ thuật) và các kỹ thuật từ đơn giản đến phức tạp như brute forcing hoặc ransomware.
- **Infrastructure (Cơ sở hạ tầng - WHAT):** Phần cứng hoặc phần mềm "cái gì" mà kẻ tấn công sử dụng để kết nối và tiếp cận nạn nhân (ví dụ: máy chủ email, server C&C, địa chỉ IP).
- **Victim (Nạn nhân - WHERE):** Mục tiêu đã bị khai thác hoặc môi trường nơi cuộc tấn công diễn ra. Nạn nhân có thể là cá nhân, tổ chức, tổ chức tài chính hoặc các thông tin mạng (IP, tên miền, email).

**Các tính năng bổ sung (Extended Diamond Model / Meta-Features):** Ngoài 4 yếu tố trên, mô hình còn sử dụng các tính năng meta để cung cấp thêm thông tin giúp phân tích và liên kết các sự kiện:

- **Timestamp:** Tiết lộ thời gian và ngày tháng của sự kiện. Giúp xác định điểm bắt đầu, kết thúc và chu kỳ của sự kiện.
- **Phase:** Giúp xác định tiến trình của một cuộc tấn công hoặc hoạt động độc hại (dựa theo các giai đoạn trong Cyber Kill Chain như reconnaissance, weaponization, delivery...).
- **Result:** Kết quả của bất kỳ sự kiện nào (thành công, thất bại hoặc không xác định). Có thể phân loại theo nguyên tắc bảo mật như CIA bị xâm phạm.
- **Direction:** Hướng của cuộc tấn công (Ví dụ: từ nạn nhân đến cơ sở hạ tầng, từ kẻ tấn công đến cơ sở hạ tầng, hoặc hai chiều).
- **Methodology:** Bất kỳ kỹ thuật nào được kẻ tấn công sử dụng (Ví dụ: email spear-phishing, DDoS, drive-by-compromise).
- **Resource:** Việc sử dụng các tài nguyên bên ngoài như công cụ, phần cứng, phần mềm, quyền truy cập hoặc dữ liệu để thực hiện cuộc tấn công.
- **Socio-political meta-feature:** Mô tả mối quan hệ giữa kẻ tấn công và nạn nhân, dùng để xác định mục tiêu hoặc động cơ (lợi ích tài chính, gián điệp, hacktivism).
- **Technology meta-feature:** Mô tả mối quan hệ giữa cơ sở hạ tầng và khả năng (cách công nghệ kích hoạt giao tiếp và hoạt động, giúp phát hiện công nghệ độc hại).

## 7. Bảo đảm thông tin (Information Assurance — IA) (Trang 68 - 69)

IA là sự bảo đảm rằng tính toàn vẹn (integrity), tính sẵn sàng (availability), tính bảo mật (confidentiality), và tính xác thực (authenticity) của thông tin và hệ thống thông tin được bảo vệ trong suốt quá trình sử dụng, xử lý, lưu trữ và truyền tải.
Bao gồm 8 quy trình cốt lõi để đạt được Bảo đảm thông tin:

- Phát triển chính sách, quy trình và hướng dẫn nội bộ (Developing local policy, process, and guidance).
- Thiết kế chiến lược xác thực mạng và người dùng (Designing network and user authentication strategies).
- Xác định các lỗ hổng và mối đe dọa mạng (Identifying network vulnerabilities and threats).
- Xác định các vấn đề và yêu cầu về tài nguyên (Identifying problem and resource requirements).
- Tạo kế hoạch đáp ứng các yêu cầu tài nguyên (Creating plans for identified resource requirements).
- Áp dụng các biện pháp kiểm soát bảo đảm thông tin phù hợp (Applying appropriate information assurance controls).
- Thực hiện cấp chứng nhận và công nhận hệ thống (Performing certification and accreditation - C&A).
- Cung cấp đào tạo về bảo đảm thông tin cho toàn bộ nhân sự (Providing information assurance training).

## 8. Chiến lược an ninh liên tục / thích ứng (Continual/Adaptive Security Strategy) (Trang 70 - 71)

Chiến lược bảo mật thích ứng yêu cầu các hành động dự đoán, phòng ngừa, phát hiện và ứng phó phải được thực hiện liên tục để đảm bảo phòng thủ mạng toàn diện. Quy trình này bao gồm 4 góc phần tư:

- **Predict (Dự đoán):** Đánh giá Rủi ro và Lỗ hổng (Risk and Vulnerability Assessment), Phân tích bề mặt tấn công (Attack Surface Analysis), Tình báo mối đe dọa (Threat Intelligence).
- **Protect (Bảo vệ):** Áp dụng chiến lược phòng thủ theo chiều sâu (Defense-in-depth), bảo vệ thiết bị đầu cuối, bảo vệ mạng lưới, và bảo vệ dữ liệu.
- **Detect (Phát hiện):** Giám sát mối đe dọa liên tục (Continuous Threat Monitoring).
- **Respond (Ứng phó):** Ứng phó sự cố (Incident Response).

## Phòng thủ chiều sâu (Defense-in-Depth) (Trang 72)

- Defense-in-depth là một chiến lược bảo mật trong đó nhiều lớp bảo vệ (several protection layers) được đặt xuyên suốt hệ thống thông tin.
- Chiến lược này sử dụng nguyên tắc quân sự, giúp ngăn chặn các cuộc tấn công trực tiếp vào hệ thống và dữ liệu. Nếu kẻ tấn công phá vỡ được một lớp, chúng sẽ tiếp tục phải đối mặt và bị chặn lại bởi lớp bảo vệ tiếp theo.
- Các lớp bảo vệ (từ ngoài vào trong): Policies, Procedures, and Awareness (Chính sách, quy trình và nhận thức) -> Physical (Vật lý) -> Perimeter (Vành đai) -> Internal Network (Mạng nội bộ) -> Host (Máy chủ/Máy trạm) -> Application (Ứng dụng) -> Data (Dữ liệu).
  - **Các Cấp độ Rủi ro (Risk Levels)**:
    - **Extreme or High (Nghiêm trọng hoặc Cao)** - Mối nguy hiểm nghiêm trọng hoặc sắp xảy ra: Yêu cầu các biện pháp tức thời để chống lại rủi ro; phải xác định và áp dụng các kiểm soát để giảm rủi ro xuống mức thấp hợp lý.
    - **Medium (Trung bình)** - Mối nguy hiểm vừa phải: Không yêu cầu hành động tức thời nhưng cần triển khai nhanh chóng; thực hiện các biện pháp kiểm soát càng sớm càng tốt để giảm rủi ro.
    - **Low (Thấp)** - Mối nguy hiểm không đáng kể: Thực hiện các bước phòng ngừa (preventive steps) để giảm thiểu tác động.

## 9. Công thức tính rủi ro (Risk) (Trang 73 - 74)

Rủi ro là mức độ không chắc chắn hoặc dự báo về thiệt hại tiềm ẩn do một sự kiện bất lợi gây ra cho hệ thống. Mối quan hệ này được thể hiện qua các công thức sau:

- **RISK = Threats × Vulnerabilities × Impact** (Rủi ro = Mối đe dọa × Lỗ hổng × Tác động) - Trang 73
- **RISK = Threat × Vulnerability × Asset Value** (Rủi ro = Mối đe dọa × Lỗ hổng × Giá trị tài sản) - Trang 73
- **Level of Risk = Consequence × Likelihood** (Mức độ Rủi ro = Hậu quả × Khả năng xảy ra) - Trang 74 (Thường được sử dụng để xây dựng Ma trận rủi ro - Risk Matrix).

## Mục tiêu của Quản lý rủi ro (Risk Management Objectives) (Trang 76)

- Xác định các rủi ro tiềm ẩn — đây là mục tiêu chính của quản lý rủi ro.
- Xác định tác động của rủi ro và giúp tổ chức phát triển các chiến lược, kế hoạch quản lý rủi ro tốt hơn.
- Ưu tiên các rủi ro, tùy thuộc vào tác động hoặc mức độ nghiêm trọng, và sử dụng các phương pháp, công cụ kỹ thuật đã thiết lập để hỗ trợ.
- Hiểu và phân tích các rủi ro, đồng thời báo cáo các sự kiện rủi ro đã xác định.
- Kiểm soát rủi ro và giảm thiểu tác động của nó.
- Tạo nhận thức cho đội ngũ an ninh và phát triển các kế hoạch bảo vệ lâu dài.

## Quy trình Quản lý rủi ro (Risk Management Phases) (Trang 76 - 78)

Quản lý rủi ro là quá trình giảm thiểu và duy trì rủi ro ở mức có thể chấp nhận được thông qua một chương trình bảo mật được xác định rõ ràng. Quy trình này bao gồm 4 giai đoạn chính:

- **Nhận dạng rủi ro (Risk Identification)**: Xác định các nguồn gốc, nguyên nhân, hậu quả và các chi tiết khác của rủi ro nội bộ và bên ngoài ảnh hưởng đến an ninh của tổ chức.
- **Đánh giá rủi ro (Risk Assessment)**: Đánh giá rủi ro của tổ chức và ước tính khả năng xảy ra (likelihood) cũng như tác động (impact) của rủi ro đó.
- **Xử lý rủi ro (Risk Treatment)**: Lựa chọn và thực hiện các biện pháp kiểm soát thích hợp đối với các rủi ro đã được xác định.
  - Để xử lý rủi ro hiệu quả, tổ chức cần thu thập các thông tin sau trước khi tiến hành xử lý:
    - Phương pháp điều trị phù hợp (The appropriate method of treatment).
    - Người chịu trách nhiệm xử lý (The people responsible for the treatment).
    - Chi phí liên quan (The costs involved).
    - Lợi ích của việc điều trị (The benefits of treatment).
    - Khả năng thành công (The likelihood of success).
    - Các cách đo lường và đánh giá việc xử lý (Ways to measure and assess the treatment).
- **Theo dõi và Đánh giá (Risk Tracking and Review)**: Đảm bảo các biện pháp kiểm soát phù hợp được triển khai để xử lý các rủi ro đã biết và đánh giá hiệu suất của các chiến lược quản lý rủi ro.

## 10. Tình báo mối đe dọa mạng (Cyber Threat Intelligence — CTI) (Trang 79 - 82)

**Định nghĩa:** CTI là quá trình thu thập và phân tích thông tin về các mối đe dọa và kẻ thù, từ đó phác thảo các kiểu mẫu cung cấp khả năng đưa ra quyết định có hiểu biết cho việc chuẩn bị, phòng ngừa và phản ứng trước các cuộc tấn công mạng. Việc này giúp chuyển đổi các "mối đe dọa chưa biết" thành đã biết để phòng vệ chủ động.

**Các loại Tình báo Mối đe dọa (Trang 80 - 82):**

- **Strategic intelligence (Tình báo chiến lược):** Dành cho lãnh đạo điều hành và ban quản lý (như CISO). Cung cấp thông tin cấp cao về rủi ro an ninh mạng, xu hướng tấn công, tác động tài chính và các quyết định chiến lược.
- **Tactical intelligence (Tình báo chiến thuật):** Dành cho các chuyên gia an ninh mạng, quản trị viên, và nhân viên NOC. Cung cấp thông tin về TTPs (Chiến thuật, Kỹ thuật, Thủ tục) của kẻ tấn công, giúp họ đánh giá và thiết lập các chiến lược phát hiện và giảm thiểu.
- **Operational intelligence (Tình báo hoạt động):** Dành cho các nhà quản lý bảo mật, đội phản ứng sự cố (IR) và pháp y. Cung cấp thông tin bối cảnh về các sự kiện bảo mật, giúp thấu hiểu ý định, phương pháp và cơ hội của kẻ tấn công để phản ứng lại các rủi ro cụ thể.
- **Technical intelligence (Tình báo kỹ thuật):** Cung cấp thông tin về các tài nguyên cụ thể kẻ tấn công sử dụng (Kênh C&C, mã băm, URL, IP). Loại này có tuổi thọ ngắn, tập trung vào các Chỉ báo xâm phạm (IoC) cụ thể và được dùng trực tiếp cho các hệ thống như SIEM, Tường lửa, IDS/IPS và đội SOC.

---

## 11. Vòng đời CTI (Threat Intelligence Lifecycle) (Trang 83 - 85)

Vòng đời CTI là một quá trình liên tục bao gồm 5 giai đoạn để phát triển tình báo từ dữ liệu thô:

- **Planning and Direction (Lên kế hoạch và Định hướng - Trang 83):** Xác định các yêu cầu về tình báo, thiết lập phương pháp thu thập dữ liệu và xây dựng đội ngũ tình báo cũng như kế hoạch lấy thông tin (OSINT, v.v.).
- **Collection (Thu thập - Trang 84):** Tiến hành thu thập dữ liệu qua các phương tiện kỹ thuật hoặc con người (HUMINT, IMINT, MASINT, OSINT, logs mạng, v.v.).
- **Processing and Exploitation (Xử lý và Khai thác - Trang 84):** Chuyển đổi, làm sạch dữ liệu thô thành định dạng có thể sử dụng (chuẩn hóa, giải mã, dịch ngôn ngữ, lọc và tổng hợp).
- **Analysis and Production (Phân tích và Sản xuất):** Áp dụng các kỹ thuật phân tích để biến dữ liệu đã xử lý thành báo cáo tình báo. Để trích xuất thông tin chính xác, các nhà phân tích cần triển khai 4 kỹ thuật suy luận (reasoning techniques): suy diễn (deduction), quy nạp (induction), suy luận giả định (abduction), và phương pháp khoa học dựa trên độ tin cậy (scientific method based on confidence).
- **Dissemination and Integration (Phân phối và Tích hợp - Trang 84-85):** Phân phối thông tin tình báo đã được phân tích (báo cáo, IoC) đến người dùng phù hợp (bộ phận quản lý, đội SOC). Quy trình này cũng đi kèm với Feedback (Phản hồi) để đánh giá xem tình báo có đáp ứng yêu cầu hay không, từ đó cải thiện chu kỳ tiếp theo.

---

## 12. Mô hình hóa mối đe dọa (Threat Modeling) (Trang 86 - 89)

Mô hình hóa mối đe dọa là một phương pháp đánh giá rủi ro để phân tích bảo mật của một ứng dụng bằng cách nắm bắt, tổ chức và phân tích tất cả các thông tin ảnh hưởng đến ứng dụng đó. Quy trình thực hiện bao gồm 5 bước:

- **Identify Security Objectives:** Xác định các mục tiêu bảo mật (Tính bảo mật, toàn vẹn, sẵn sàng) và điều kiện tuân thủ.
- **Application Overview (Tổng quan ứng dụng):** Xác định các thành phần, luồng dữ liệu, ranh giới tin cậy và các vai trò. Nó bao gồm các bước:
  - _(Chi tiết về Tổng quan ứng dụng)_: Sơ đồ triển khai cần chứa các yếu tố sau: Cấu trúc liên kết mạng đầu cuối (End-to-end deployment topology), Các lớp logic (Logical layers), Các thành phần chính (Key components), Các dịch vụ chính (Key services), Cổng và giao thức giao tiếp (Communication ports and protocols), Danh tính (Identities), và Các phụ thuộc bên ngoài (External dependencies).
  - **Xác định các vai trò (Identify Roles):** Xác định các nhóm người dùng có đặc quyền cao, ai được đọc/cập nhật/xóa dữ liệu.
  - **Xác định kịch bản sử dụng (Identify Key Usage Scenarios):** Xác định mục tiêu qua các trường hợp sử dụng (use cases).
  - **Xác định công nghệ (Identify Technologies):** OS, web server, database, ngôn ngữ phát triển.
  - **Xác định cơ chế bảo mật (Identify Application Security Mechanisms):** Xác thực, quản lý phiên, mật mã, xác thực đầu vào, v.v.
- **Decompose the Application (Phân tách ứng dụng):** Phân tách ứng dụng để tìm các thông tin chi tiết. Bao gồm:
  - **Xác định Ranh giới tin cậy (Identify Trust Boundaries).**
  - **Xác định Luồng dữ liệu (Identify Data Flows).**
  - **Xác định Điểm vào (Identify Entry Points).**
  - **Xác định Điểm ra (Identify Exit Points).**
- **Identify Threats:** Xác định các mối đe dọa liên quan tới kịch bản kiểm soát, phân nhóm chúng theo các danh mục.
- **Identify Vulnerabilities:** Xác định các điểm yếu gắn liền với mối đe dọa để tìm cách vá và sửa chữa trước khi bị kẻ tấn công khai thác.

**Mô hình hóa mối đe dọa giúp (Threat modeling helps to) [Trang 86 - 87]:**

- Xác định các mối đe dọa liên quan đến một kịch bản ứng dụng cụ thể.
- Xác định các lỗ hổng chính trong thiết kế của một ứng dụng.
- Cải thiện thiết kế bảo mật.

**Hướng dẫn (Guidelines):**

- Cố gắng không quá cứng nhắc về các bước cụ thể; hãy tập trung vào phương pháp tiếp cận. Nếu một bước bế tắc, hãy bỏ qua và chuyển ngay đến bước 4 (Identify Threats) để tìm ra vấn đề.
- Sử dụng các kịch bản (scenarios) để xác định phạm vi hoạt động mô hình hóa.
- Tận dụng các tài liệu thiết kế hiện có (như documented use cases, user stories, sơ đồ kiến trúc, sơ đồ luồng dữ liệu...).
- Bắt đầu với một bảng trắng (whiteboard) trước khi ghi lại thông tin vào tài liệu để tránh bị lạc vào các chi tiết.
- Sử dụng phương pháp lặp (iterative approach). Liên tục bổ sung chi tiết và cải thiện mô hình khi quá trình thiết kế/phát triển tiếp tục.
- Thu thập thông tin đầu vào về các ràng buộc mạng/máy chủ từ quản trị viên hệ thống để hiểu rõ cấu hình tường lửa, cổng, giao thức, v.v.

---

## 13. Quản lý sự cố (Incident Management) (Trang 90 - 91)

Quản lý sự cố là tập hợp các quy trình được xác định để xác định, phân tích, ưu tiên và giải quyết các sự cố bảo mật nhằm khôi phục hoạt động dịch vụ bình thường càng nhanh càng tốt và ngăn ngừa sự cố lặp lại. Các hoạt động chính bao gồm: Phân tích lỗ hổng, phân tích hiện vật (Artifact handling), đào tạo nhận thức bảo mật, phát hiện xâm nhập, thông báo, và xử lý sự cố.

**Quy trình quản lý sự cố được thiết kế nhằm (The incident management process is designed to) [Trang 90 - 91]:**

- Cải thiện chất lượng dịch vụ.
- Giải quyết vấn đề một cách chủ động.
- Giảm thiểu tác động của sự cố đối với tổ chức hoặc hoạt động kinh doanh.
- Đáp ứng các yêu cầu về tính sẵn sàng của dịch vụ.
- Tăng hiệu quả và năng suất của nhân viên.
- Cải thiện sự hài lòng của người dùng và khách hàng.
- Hỗ trợ xử lý các sự cố trong tương lai.

**Những người thực hiện các hoạt động quản lý sự cố bao gồm:**

- **Nhân sự (Human resources personnel):** Thực hiện các bước sa thải những nhân viên bị tình nghi có hoạt động máy tính gây hại.
- **Cố vấn pháp lý (The legal counsel):** Đặt ra các quy tắc và quy định ảnh hưởng đến chính sách bảo mật nội bộ (đặc biệt khi kẻ tấn công là người trong tổ chức).
- **Quản trị viên tường lửa (The firewall manager):** Giữ cho các bộ lọc hoạt động, do đây thường xuyên là nơi nhắm tới của các cuộc tấn công từ chối dịch vụ.
- **Nhà cung cấp dịch vụ thuê ngoài (An outsourced service provider):** Hỗ trợ sửa chữa các hệ thống bị nhiễm virus và phần mềm độc hại.

**Ứng phó sự cố (Incident Handling and Response - IH&R) - (Trang 92-93):** Như đã nhắc lại quy trình, nó bao gồm 9 bước cốt lõi:

- Preparation (Chuẩn bị)
- Incident Recording and Assignment (Ghi nhận và phân công)
- Incident Triage (Phân loại ưu tiên)
- Notification (Thông báo)
- Containment (Cách ly)
- Evidence Gathering and Forensic Analysis (Thu thập bằng chứng và Phân tích pháp y)
- Eradication (Loại bỏ nguyên nhân gốc rễ)
- Recovery (Phục hồi lại hệ thống)
- Post-Incident Activities (Hoạt động sau sự cố như viết tài liệu, báo cáo).

---

## Vai trò của AI và ML trong An ninh mạng (Role of AI and ML in Cyber Security) (Trang 94 - 97)

Học máy (ML) và Trí tuệ nhân tạo (AI) giúp xác định các điểm yếu và lỗ hổng mới, từ đó phân tích để giảm thiểu các cuộc tấn công tiếp theo.

- **Các kỹ thuật phân loại ML (ML classification techniques)**:
  - **Học có giám sát (Supervised Learning)**: Sử dụng tập dữ liệu huấn luyện được gắn nhãn (labeled training data) để học sự khác biệt giữa các nhãn. Phân thành hai danh mục phụ: Classification (Phân loại) và Regression (Hồi quy).
  - **Học không giám sát (Unsupervised Learning)**: Sử dụng dữ liệu đầu vào không được gắn nhãn (unlabeled training data) để tự suy luận ra các danh mục. Phân thành: Dimensionality Reduction (Giảm chiều dữ liệu) và Clustering (Phân cụm).
- **Cách AI và ML ngăn chặn tấn công mạng**:
  - **Bảo vệ mật khẩu và Xác thực:** Trí tuệ nhân tạo cung cấp các mô hình mới nhất để nhận diện khuôn mặt bằng cách theo dõi các tương quan và mô hình cốt lõi, cải thiện độ chính xác của bảo mật sinh trắc học và chống lại các vi phạm thông tin đăng nhập.
  - **Phát hiện và Phòng ngừa Phishing:** AI và ML có thể quét và xác định các email lừa đảo (phishing) nhanh hơn nhiều so với con người, đồng thời phân biệt nhanh chóng các trang web độc hại và hợp pháp.
  - **Phát hiện mối đe dọa (Threat Detection):** Học máy hỗ trợ thực hiện phân tích dữ liệu logic liên tục (deep learning) để dự đoán và thông báo cho quản trị viên về các cuộc tấn công mạng ngay trước khi hệ thống bị xâm phạm.
  - **Quản lý lỗ hổng:** Các hệ thống dựa trên AI/ML liên tục quét động mọi loại lỗ hổng và cảnh báo ngay lập tức, đồng thời có thể dự báo cách thức và thời điểm một lỗ hổng có thể bị khai thác.
  - **Phân tích hành vi (Behavioral Analytics):** AI kết hợp ML tạo ra các mẫu người dùng cụ thể dựa trên việc sử dụng thông thường. Nếu một kẻ tấn công đánh cắp chứng chỉ và đăng nhập, phần mềm AI sẽ ngay lập tức cảnh báo quản trị viên về bất kỳ sự sai lệch nào so với hành vi chuẩn.
  - **An ninh mạng lưới:** Quản trị viên áp dụng AI để tự động thực hiện phân tích lưu lượng mạng và đề xuất các chính sách bảo mật hiệu quả (thay vì làm thủ công rất tốn thời gian).
  - **Antivirus dựa trên AI:** Thay vì quét file để khớp chữ ký virus (cần thời gian cập nhật), các chương trình diệt virus AI sử dụng "phát hiện điểm bất thường" (anomaly detection) để thấu hiểu hành vi của chương trình và ngăn chặn mã độc mới.
  - **Phát hiện gian lận:** Các thuật toán AI và ML phát hiện sự bất thường trong thanh toán, tự động khám phá mô hình giao dịch và phân biệt/chặn các giao dịch không hợp pháp.
  - **Phát hiện Botnet:** Botnet thường vượt qua IDS truyền thống do mã tinh vi. AI và ML có thể phát hiện các hành vi đáng ngờ của mạng để nhận diện các xâm nhập trái phép do botnet gây ra.
  - **Dùng AI để chống lại các mối đe dọa từ AI:** Kẻ tấn công ngày càng dùng AI, do đó tổ chức cũng phải sử dụng phần mềm AI để phát hiện các cuộc tấn công "được tăng cường bằng AI" ngay lập tức trước khi mạng bị thỏa hiệp.

## 14. Luật và Tiêu chuẩn (Laws and Standards) (Trang 99 - 114)

- **PCI DSS (Payment Card Industry Data Security Standard) - Trang 99-100:** Là tiêu chuẩn bảo mật dữ liệu độc quyền dành cho các tổ chức lưu trữ, xử lý, hoặc truyền tải dữ liệu chủ thẻ thanh toán (thẻ tín dụng, ghi nợ). Việc không tuân thủ có thể dẫn đến phạt tiền hoặc bị tước quyền xử lý thẻ.
  - **12 Yêu cầu chi tiết của Tiêu chuẩn Bảo mật Dữ liệu PCI DSS (High Level Overview):**
    1. Cài đặt và duy trì cấu hình tường lửa để bảo vệ dữ liệu chủ thẻ.
    2. Không sử dụng mật khẩu hệ thống và các tham số bảo mật mặc định do nhà cung cấp cung cấp.
    3. Bảo vệ dữ liệu chủ thẻ được lưu trữ.
    4. Mã hóa việc truyền tải dữ liệu chủ thẻ qua các mạng công cộng mở.
    5. Sử dụng và cập nhật thường xuyên các phần mềm/chương trình diệt virus.
    6. Phát triển và duy trì các hệ thống, ứng dụng an toàn.
    7. Hạn chế quyền truy cập vào dữ liệu chủ thẻ theo nguyên tắc cần-biết (business need-to-know).
    8. Gán một ID duy nhất cho mỗi cá nhân có quyền truy cập máy tính.
    9. Hạn chế quyền truy cập vật lý vào dữ liệu chủ thẻ.
    10. Theo dõi và giám sát tất cả các truy cập vào tài nguyên mạng và dữ liệu chủ thẻ.
    11. Thường xuyên kiểm tra các hệ thống và quy trình bảo mật.
    12. Duy trì một chính sách giải quyết vấn đề an toàn thông tin cho toàn bộ nhân sự.
- **ISO/IEC 27001 - Trang 101:** Tiêu chuẩn quốc tế cung cấp yêu cầu và framework để thiết lập, thực hiện, duy trì và cải tiến liên tục một Hệ thống Quản lý An toàn Thông tin (ISMS) nhằm bảo đảm tính bảo mật, toàn vẹn và sẵn sàng của dữ liệu.
  - **Các tiêu chuẩn ISO/IEC liên quan khác (Other Relevant ISO/IEC Standards)** [Trang 101 - 103]:
    - **ISO/IEC 27701:2019**: Mở rộng ISO/IEC 27001 để bao gồm quản lý quyền riêng tư, thiết lập Hệ thống Quản lý Thông tin Quyền riêng tư (PIMS) và bảo vệ dữ liệu PII.
    - **ISO/IEC 27002:2022**: Nêu các biện pháp thực hành tốt nhất (best practices) và mục tiêu kiểm soát cho các lĩnh vực an ninh mạng quan trọng như kiểm soát truy cập và mật mã.
    - **ISO/IEC 27005:2022**: Cung cấp hướng dẫn toàn diện về quản lý rủi ro an ninh thông tin để hỗ trợ ISMS.
    - **ISO/IEC 27018:2019**: Bộ quy tắc thực hành tập trung vào việc bảo vệ thông tin nhận dạng cá nhân (PII) trên nền tảng đám mây công cộng.
    - **ISO/IEC 27032:2023**: Cung cấp tổng quan về an ninh mạng Internet (Internet security) và xác định vai trò của các bên liên quan.
    - **ISO/IEC 27033-7:2023**: Hướng dẫn triển khai an ninh mạng ảo hóa (Network virtualization security).
    - **ISO/IEC 27036-3:2023**: Hướng dẫn bảo mật chuỗi cung ứng phần cứng, phần mềm và dịch vụ.
    - **ISO/IEC 27040:2024**: Các yêu cầu và hướng dẫn kỹ thuật để đạt được bảo mật cho thiết bị và mạng lưu trữ dữ liệu (Data storage security).
- **HIPAA (Health Insurance Portability and Accountability Act):** Đạo luật cung cấp các biện pháp bảo vệ liên bang đối với thông tin sức khỏe cá nhân (PII). Bao gồm:
  - **Electronic Transactions and Code Set Standards:** Chuẩn hóa các giao dịch điện tử.
  - **Privacy Rule:** Thiết lập tiêu chuẩn bảo vệ hồ sơ y tế và giới hạn việc tiết lộ.
  - **Security Rule:** Yêu cầu các biện pháp bảo vệ hành chính, vật lý và kỹ thuật cho dữ liệu y tế điện tử.
  - **Employer Identifier Standard:** Mã số quốc gia chuẩn cho người sử dụng lao động.
  - **National Provider Identifier Standard (NPI):** Mã định danh số 10 chữ số duy nhất cho nhà cung cấp dịch vụ y tế.
  - **Enforcement Rule:** Các điều khoản về tuân thủ, điều tra và hình phạt.
- **SOX (Sarbanes-Oxley Act):** Được ban hành vào năm 2002 để bảo vệ nhà đầu tư, yêu cầu tính chính xác của báo cáo tài chính. Gồm 11 danh mục (Titles), tiêu biểu:
  - Title I: Public Company Accounting Oversight Board (PCAOB).
  - Title II: Auditor Independence (Tính độc lập của kiểm toán viên).
  - Title III: Corporate Responsibility (Trách nhiệm doanh nghiệp).
  - Title IV: Enhanced Financial Disclosures.
  - Title VIII, IX, XI: Các điều khoản về trách nhiệm giải trình và hình phạt tội phạm gian lận/cổ cồn trắng.
- **DMCA (Digital Millennium Copyright Act):** Luật bản quyền của Hoa Kỳ bảo vệ tài sản trí tuệ kỹ thuật số, cấm phá vỡ các biện pháp bảo vệ công nghệ. Gồm 5 Titles:
  - Title I: WIPO Treaty Implementation.
  - Title II: Online Copyright Infringement Liability Limitation (Giới hạn trách nhiệm cho ISP về Transitory communications, System caching, User-directed storage, Information location tools).
  - Title III: Computer Maintenance or Repair.
  - Title IV: Miscellaneous Provisions.
  - Title V: Protection of Certain Original Designs.
- **FISMA (Federal Information Security Management Act) - Trang 110:** Đạo luật cung cấp một khuôn khổ toàn diện đảm bảo các biện pháp kiểm soát bảo mật thông tin hỗ trợ hoạt động của liên bang Mỹ (áp dụng cho các cơ quan chính phủ và các nhà thầu).
  - **Khung FISMA (FISMA Framework) bao gồm:**
    - Tiêu chuẩn phân loại thông tin và hệ thống thông tin theo tác động sứ mệnh (mission impact).
    - Tiêu chuẩn về các yêu cầu bảo mật tối thiểu đối với thông tin và hệ thống thông tin.
    - Hướng dẫn lựa chọn các biện pháp kiểm soát bảo mật (security controls) phù hợp cho các hệ thống.
    - Hướng dẫn đánh giá các biện pháp kiểm soát bảo mật để xác định tính hiệu quả của chúng.
    - Hướng dẫn cấp phép bảo mật (security authorization) cho hệ thống thông tin.
- **DPA 2018 (UK Data Protection Act 2018) & GDPR - Trang 111-113:** DPA 2018 là luật bảo vệ dữ liệu cá nhân của Vương quốc Anh, cập nhật luật từ năm 1998, kiểm soát việc xử lý dữ liệu cá nhân của các tổ chức, trao quyền cho người dùng và thiết lập chức năng của Ủy viên Thông tin (Information Commissioner). Nó hoạt động song song với GDPR của Liên minh Châu Âu (EU) vốn đưa ra 7 nguyên tắc cốt lõi về xử lý dữ liệu (Tính hợp pháp, giới hạn mục đích, giảm thiểu dữ liệu, độ chính xác, giới hạn lưu trữ, tính bảo mật & tính trách nhiệm giải trình) kèm theo các hình phạt rất khắt khe đối với vi phạm.
  - **Bảo vệ dữ liệu cá nhân (Protection of personal data):**
    1. Đạo luật DPA bảo vệ các cá nhân liên quan đến việc xử lý dữ liệu cá nhân, cụ thể bằng cách:
       a. Yêu cầu dữ liệu cá nhân phải được xử lý hợp pháp và công bằng, dựa trên sự đồng ý của chủ thể dữ liệu hoặc cơ sở được chỉ định khác.
       b. Trao quyền cho chủ thể dữ liệu để lấy thông tin về việc xử lý dữ liệu cá nhân của họ và yêu cầu sửa chữa dữ liệu cá nhân không chính xác.
       c. Trao các chức năng cho Ủy viên (Commissioner), giao cho người giữ chức vụ đó trách nhiệm giám sát và thực thi các quy định.
    2. Khi thực hiện các chức năng theo GDPR và Đạo luật này, Ủy viên phải quan tâm đến tầm quan trọng của việc đảm bảo mức độ bảo vệ thích hợp cho dữ liệu cá nhân, tính đến lợi ích của chủ thể dữ liệu, người kiểm soát và những người khác, cũng như các vấn đề vì lợi ích công cộng.

- **Luật an ninh mạng ở các quốc gia khác (Cyber Law in Different Countries) (Trang 115 - 118)**: Mỗi quốc gia có các bộ luật và quy định riêng để bảo vệ Internet và công nghệ truyền thông (về quyền riêng tư, tự do ngôn luận và quyền tài phán), ví dụ:
  - **Hoa Kỳ (United States)**: Online Copyright Infringement Liability Limitation Act, The Electronic Communications Privacy Act, Privacy Act of 1974, Computer Security Act of 1987, Freedom of Information Act (FOIA), California Consumer Privacy Act (CCPA), v.v.
  - **Úc (Australia)**: Cybercrime Act 2001, The Copyright Act 1968, Trademarks Act 1995.
  - **Vương quốc Anh (United Kingdom)**: Computer Misuse Act 1990, Investigatory Powers Act 2016, The Network and Information Systems Regulations 2018.
  - **Trung Quốc (China)**: Copyright Law, Trademark Law.
  - **Ấn Độ (India)**: Information Technology Act.
  - **Đức (Germany)**: Section 202a (Data Espionage), Section 303a/b (Computer Sabotage).
  - **Các quốc gia/khu vực khác**: Canada (PIPEDA), Singapore (Computer Misuse Act), Brazil (LGPD - Luật bảo vệ dữ liệu chung), Ý, Nhật Bản, Nam Phi, Hàn Quốc, Bỉ, Hong Kong, Philippines.

## 15. Thuật ngữ về hacker và phân loại (Hacking terminology / Hacker Classes)

- **Bảng Tổng hợp Động cơ và Mục tiêu của các nhóm Hacker (Hacker and their Motivations):**
  - **Script Kiddies:** Hành động vì mục tiêu vui vẻ, tìm kiếm sự chú ý. Hoạt động cyber: Tấn công DDoS đơn giản, thay đổi giao diện (defacing). Mục tiêu: Các website nhỏ, game online, diễn đàn.
  - **White Hat Hackers:** Cải thiện bảo mật, uy tín, thu nhập. Hoạt động cyber: Penetration test, đánh giá lỗ hổng. Mục tiêu: Doanh nghiệp, cơ quan chính phủ.
  - **Black Hat Hackers:** Trục lợi tài chính, phá hoại. Hoạt động cyber: Tạo malware, phishing, ransomware. Mục tiêu: Tổ chức tài chính, cá nhân, doanh nghiệp lớn.
  - **Gray Hat Hackers:** Khẳng định bản thân, tò mò, tiền thưởng. Hoạt động cyber: Khám phá lỗ hổng trái phép và báo cáo. Mục tiêu: Các tổ chức uy tín cao (high-profile).
  - **Hacktivists:** Thúc đẩy công lý xã hội, bảo vệ lý tưởng. Hoạt động cyber: DDoS, rò rỉ dữ liệu, defacing. Mục tiêu: Website chính phủ, tập đoàn, nhóm chính trị.
  - **State-Sponsored Hackers:** An ninh quốc gia, gián điệp chính trị. Hoạt động cyber: Gián điệp mạng, phá hoại hạ tầng. Mục tiêu: Cơ quan chính phủ nước khác, tập đoàn quốc gia.
  - **Cyber Terrorists:** Reo rắc sợ hãi, mục đích ý thức hệ. Hoạt động cyber: Tấn công hạ tầng trọng yếu, lan truyền tuyên truyền độc hại. Mục tiêu: Cơ sở hạ tầng công cộng, dịch vụ trọng yếu.
  - **Corporate Spies:** Lợi thế cạnh tranh, tài chính. Hoạt động cyber: Đánh cắp dữ liệu, gián điệp công nghiệp. Mục tiêu: Các công ty đối thủ.
  - **Blue Hat Hackers:** Cải thiện bảo mật sản phẩm. Hoạt động cyber: Audit, pentest trước khi ra mắt phần mềm. Mục tiêu: Công ty phần mềm/công nghệ.
  - **Red Hat Hackers:** Thực thi "công lý không gian mạng". Hoạt động cyber: Tấn công và đánh sập hạ tầng của Black hat. Mục tiêu: Các nhóm tội phạm mạng.
  - **Green Hat Hackers:** Học tập, tìm kiếm sự công nhận. Hoạt động cyber: Thử nghiệm kỹ thuật hacking cơ bản. Mục tiêu: Các mục tiêu có mức rủi ro thấp.

- **Script Kiddies (Trang 21):** Là những cá nhân thiếu kinh nghiệm, thường là người trẻ tuổi, thao túng hệ thống bằng cách sử dụng các kịch bản (scripts) hoặc công cụ (tools) có sẵn được phát triển bởi các hacker thực thụ mà không hiểu rõ về chúng. Họ thường tập trung vào số lượng hơn là chất lượng của cuộc tấn công, nhằm mục đích tìm kiếm sự hồi hộp, niềm vui hoặc sự công nhận.
- **White Hat Hackers (Trang 21 - 22):** (Hacker mũ trắng hoặc Penetration testers) Là những chuyên gia an ninh mạng sử dụng kỹ năng của họ cho mục đích phòng thủ. Họ có sự cho phép của chủ sở hữu hệ thống để đánh giá, tìm ra lỗ hổng và bảo vệ mạng lưới khỏi các cuộc tấn công độc hại.
- **Black Hat Hackers (Trang 21 - 22):** (Hacker mũ đen hoặc Crackers) Là những cá nhân sử dụng kỹ năng máy tính xuất chúng cho các mục đích bất hợp pháp hoặc độc hại. Họ thường liên quan đến các hoạt động tội phạm, trộm cắp dữ liệu, tạo mã độc, ransomware để gây hại hoặc thu lợi tài chính.
- **Gray Hat Hackers (Trang 21 - 22):** (Hacker mũ xám) Là những cá nhân hoạt động ở ranh giới giữa đạo đức và phi đạo đức. Họ có thể tấn công để tìm lỗ hổng mà không cần phép, sau đó báo cáo lại cho tổ chức hoặc giúp các nhà cung cấp khắc phục nhằm nhận lại sự công nhận hoặc tiền thưởng.
- **Hacktivists (Trang 21 - 22):** Những cá nhân hoặc nhóm có động cơ chính trị, xã hội. Họ đột nhập vào các hệ thống máy tính của chính phủ hoặc doanh nghiệp như một hành động phản đối nhằm thúc đẩy một chương trình nghị sự xã hội, làm mất mặt mục tiêu, hoặc rò rỉ dữ liệu ra công chúng.
- **State-Sponsored Hackers (Trang 21 - 22):** Những chuyên gia có tay nghề cao được chính phủ các quốc gia tuyển dụng/tài trợ. Mục tiêu của họ là xâm nhập, thu thập thông tin tình báo tuyệt mật, gián điệp mạng hoặc phá hoại cơ sở hạ tầng của các quốc gia hoặc tổ chức khác.
- **Cyber Terrorists (Trang 21 - 22):** (Khủng bố mạng) Những kẻ cực đoan sử dụng các cuộc tấn công mạng để thúc đẩy niềm tin tôn giáo hoặc chính trị. Mục tiêu của chúng là gieo rắc nỗi sợ hãi hoặc phá hoại các cơ sở hạ tầng quan trọng trên quy mô lớn.
- **Corporate Spies / Industrial Spies (Trang 21 - 22):** Những cá nhân được các công ty thuê để tiến hành hoạt động gián điệp doanh nghiệp. Họ đánh cắp các thông tin quan trọng như bản thiết kế, công thức, chiến lược tiếp thị, bí mật thương mại của các đối thủ cạnh tranh nhằm giành lợi thế tài chính.
- **Blue Hat Hackers (Trang 21 - 23):** Các chuyên gia an ninh mạng làm việc theo hợp đồng, được tổ chức thuê để kiểm tra (test) hệ thống hoặc phần mềm trước khi phát hành sản phẩm nhằm cải thiện bảo mật.
- **Red Hat Hackers (Trang 21 - 23):** Hacker mũ đỏ áp dụng các chiến thuật tấn công quyết liệt (aggressive tactics) giống như black hat để triệt hạ các tổ chức tội phạm mạng. Họ tìm cách phá hủy các cơ sở hạ tầng độc hại thay vì chỉ phòng thủ, và không tuân thủ các quy tắc đạo đức thông thường.
- **Green Hat Hackers (Trang 21 - 23):** Những người mới làm quen (newcomers) khao khát học hỏi các kỹ năng hacking. Họ thường tham gia vào các diễn đàn trực tuyến, cộng đồng để tìm hiểu kiến thức và thực hành các cuộc tấn công đơn giản.
- **Suicide Hackers (Trang 23):** Những kẻ sẵn sàng đánh sập cơ sở hạ tầng quan trọng vì một "nghĩa cử/lý tưởng" (cause) mà không hề quan tâm đến hậu quả, kể cả việc phải đối mặt với án tù.
- **Hacker Teams (Trang 23):** Một liên minh các hacker lành nghề có tài nguyên và nguồn quỹ riêng. Họ hợp tác để nghiên cứu công nghệ tiên tiến, phát hiện lỗ hổng và phát triển các công cụ tấn công bài bản.
- **Insiders (Trang 23):** Bất kỳ nhân viên hoặc người được tin tưởng nào trong tổ chức có quyền truy cập vào các tài sản quan trọng. Họ lạm dụng quyền này để vi phạm nguyên tắc, vượt qua các kiểm soát bảo mật và đánh cắp thông tin (thường là nhân viên bất mãn hoặc người thiếu đào tạo).
- **Criminal Syndicates (Trang 23):** Các nhóm tham gia vào hoạt động tội phạm có tổ chức, có kế hoạch và kéo dài. Mục đích chính là thực hiện các tấn công tinh vi để biển thủ tiền bất hợp pháp và rửa tiền.
- **Organized Hackers (Trang 23):** Nhóm tội phạm hoạt động cùng nhau với cấu trúc quản lý phân cấp. Chúng thường thuê thiết bị, sử dụng botnet hoặc dịch vụ crimeware để lấy tiền từ nạn nhân, đánh cắp tài sản trí tuệ và có khả năng ẩn danh trong thời gian dài.

---

## 16. Các loại tấn công (Attack Types)

- **Passive attacks (Trang 13):** (Tấn công thụ động) Các cuộc tấn công này liên quan đến việc chặn bắt (intercepting) và giám sát (monitoring) lưu lượng mạng và luồng dữ liệu mà hoàn toàn không can thiệp hay thay đổi dữ liệu. Rủi ro bị phát hiện rất thấp do kẻ tấn công không có sự tương tác chủ động với hệ thống mục tiêu. Ví dụ: Footprinting, Sniffing, eavesdropping, phân tích lưu lượng mạng, và giải mã các lưu lượng mã hóa yếu.
- **Active attacks (Trang 13 - 14):** (Tấn công chủ động) Kẻ tấn công chủ động gửi lưu lượng vào mạng để can thiệp vào dữ liệu đang truyền tải hoặc làm gián đoạn thông tin liên lạc/dịch vụ nhằm vượt qua các hệ thống bảo mật. Loại tấn công này dễ bị phát hiện hơn. Ví dụ: Tấn công từ chối dịch vụ (DoS/DDoS), Vượt qua các cơ chế bảo vệ (Bypassing protection mechanisms), Tấn công phần mềm độc hại (Malware), Thay đổi thông tin, Spoofing, Tấn công Replay, Tấn công dựa trên mật khẩu, Cướp phiên (Session hijacking), Man-in-the-Middle, Đầu độc DNS/ARP, Khóa bị xâm phạm (Compromised-key), Tấn công Tường lửa/IDS, Profiling, Thực thi mã tùy ý (Arbitrary code execution), Leo thang đặc quyền, Truy cập Backdoor, Tấn công mật mã, SQL injection, XSS, Directory traversal, và Khai thác phần mềm ứng dụng/hệ điều hành.
- **Close-in Attacks (Trang 14):** (Tấn công cự ly gần) Được thực hiện khi kẻ tấn công ở gần hệ thống hoặc mạng mục tiêu về mặt vật lý. Mục đích là thu thập, sửa đổi thông tin hoặc phá hoại quyền truy cập. Ví dụ: Social engineering (như shoulder surfing, dumpster diving).
- **Insider Attacks (Trang 14 - 15):** Được thực hiện bởi những người được tin tưởng (insiders) đã có đặc quyền truy cập vật lý vào các tài sản quan trọng của tổ chức. Họ có thể dễ dàng vượt qua các quy tắc bảo mật để đánh cắp hoặc phá hoại dữ liệu. Ví dụ: Eavesdropping, trộm cắp thiết bị vật lý, cấy keylogger hoặc backdoor.
- **Các ví dụ khác về tấn công nội bộ (Insider attacks):** Pod slurping (đánh cắp dữ liệu qua thiết bị lưu trữ di động), cấy keylogger, backdoor hoặc malware, và phá hoại dữ liệu (Data theft and spoliation).
- **Distribution Attacks (Trang 15):** Xảy ra khi kẻ tấn công can thiệp vào phần cứng hoặc phần mềm trước khi chúng được cài đặt (tại nguồn sản xuất hoặc trong quá trình vận chuyển bàn giao cho khách hàng). Kẻ tấn công tận dụng các backdoor này để giành quyền truy cập trái phép.

---

## 17. Khung quy trình thực hiện kiểm toán bảo mật (Framework for performing a security audit)

Các bước sau đây cung cấp một khuôn khổ để thực hiện kiểm toán bảo mật (hoặc kiểm thử xâm nhập) cho một tổ chức nhằm đảm bảo cuộc kiểm thử có tổ chức, hiệu quả và có đạo đức:

- Trò chuyện với khách hàng và thảo luận về các nhu cầu cần giải quyết trong quá trình kiểm thử (Talk to the client and discuss the needs).
- Chuẩn bị và ký kết các tài liệu Thỏa thuận bảo mật thông tin (NDA) với khách hàng (Prepare and sign NDA documents).
- Tổ chức nhóm ethical hacking và chuẩn bị lịch trình kiểm thử (Organize an ethical hacking team and prepare the schedule).
- Tiến hành thực hiện bài kiểm tra thực tế (Conduct the test).
- Phân tích kết quả kiểm thử và chuẩn bị báo cáo (Analyze the results of the testing and prepare a report).
- Trình bày các phát hiện trong báo cáo cho khách hàng (Present the report findings to the client).
