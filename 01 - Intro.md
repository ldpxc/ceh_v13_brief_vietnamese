-------
# Các yếu tố của an ninh thông tin
---

---

- **Bảo mật (Confidentiality)** - chỉ cho phép những người được cấp quyền truy cập.
- **Tính toàn vẹn (Integrity)** - ngăn chặn thay đổi trái phép để dữ liệu đáng tin cậy.
- **Tính sẵn sàng (Availability)** - tài nguyên có sẵn cho người dùng được ủy quyền.
- **Tính xác thực (Authenticity)** - có thể tin rằng mọi thứ, bao gồm file và giao tiếp, là chính chủ.
- **Phi từ chối (Non-repudiation)** - đảm bảo người gửi không thể chối rằng họ đã gửi dữ liệu.

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

### Chiến tranh thông tin (Information Warfare)

Chiến tranh thông tin (InfoWar) đề cập đến việc sử dụng công nghệ thông tin và truyền thông (ICT) để giành lợi thế cạnh tranh trước đối thủ.

- **Chiến tranh phòng thủ (Defensive Information Warfare)**: Các chiến lược và hành động được thiết kế để bảo vệ tài sản ICT.
- **Chiến tranh tấn công (Offensive Information Warfare)**: Các cuộc tấn công nhằm vào tài sản ICT của đối thủ.
- **Các loại hình chiến tranh thông tin (Martin Libicki)**: Command and control warfare (C2), Intelligence-based warfare, Electronic warfare, Psychological warfare, Hacker warfare, Economic warfare, Cyberwarfare.

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
- **Ethical Hacking**: Việc sử dụng các công cụ, thủ thuật và kỹ thuật hacking để xác định lỗ hổng và đảm bảo an ninh hệ thống, được thực hiện một cách hợp pháp với sự cho phép của cơ quan/tổ chức chủ quản.
- **Phạm vi và Giới hạn (Scope and Limitations)**:
  - **Phạm vi**: Là thành phần quan trọng trong đánh giá rủi ro, kiểm toán, chống gian lận; giúp xác định rủi ro, đề xuất hành động khắc phục và giảm chi phí CNTT.
  - **Giới hạn**: Ethical Hacker chỉ có thể giúp tổ chức hiểu rõ hơn về hệ thống bảo mật của họ; việc triển khai các biện pháp bảo vệ phù hợp hoàn toàn là trách nhiệm của tổ chức.
- **Kỹ năng của Ethical Hacker (Skills of an Ethical Hacker)**:
  - **Kỹ năng kỹ thuật**: Kiến thức chuyên sâu về hệ điều hành (Windows, Linux, v.v.), mạng, máy tính, bảo mật và có khả năng thực hiện các cuộc tấn công phức tạp.
  - **Kỹ năng phi kỹ thuật**: Khả năng học hỏi và thích ứng nhanh, đạo đức nghề nghiệp, tuân thủ chính sách bảo mật của tổ chức, nhận thức về luật và tiêu chuẩn địa phương.

## AI-Driven Ethical Hacking (Ethical Hacking được hỗ trợ bởi AI)

Sử dụng các công nghệ trí tuệ nhân tạo (như thuật toán AI, mô hình học máy, framework tự động hóa) để nâng cao khả năng của ethical hacker.

- **Lợi ích**: Cải thiện Hiệu quả (Efficiency), Độ chính xác (Accuracy), Khả năng mở rộng (Scalability), và Hiệu quả chi phí (Cost-Effectiveness).
- **Cách AI hỗ trợ**: Tự động hóa các tác vụ lặp đi lặp lại, Phân tích dự đoán (Predictive Analysis), Phát hiện mối đe dọa nâng cao, Cải thiện ra quyết định, Học tập thích ứng (Adaptive Learning), Mô phỏng và kiểm tra, Giám sát liên tục.
- **Quan niệm sai lầm (Myth) - "AI sẽ thay thế Ethical Hackers"**: AI chỉ là một công cụ hỗ trợ giá trị, KHÔNG thể thay thế con người. Việc hacking đòi hỏi chuyên môn sâu, tính sáng tạo, tư duy phản biện và sự hiểu biết theo ngữ cảnh mà hệ thống AI không thể tự hoạt động độc lập.
- **Các công cụ AI tích hợp ChatGPT (ChatGPT-Powered AI Tools)**: ShellGPT, AutoGPT, WormGPT, ChatGPT with DAN prompt, FreedomGPT, FraudGPT, ChaosGPT, PoisonGPT, HackerGPT, BurpGPT, BugBountyGPT, PentestGPT, GPT White Hack, CybGPT, BugHunterGPT, Hacking APIs GPT, h4ckGPT, HackerNewsGPT, Ethical Hacker GPT, GP(en)T(ester).

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

- **Trinh sát (Reconnaissance) - Trang 51:** Kẻ tấn công thu thập càng nhiều thông tin về mục tiêu càng tốt để thăm dò các điểm yếu trước khi thực sự tấn công. Các hoạt động bao gồm tìm kiếm trên Internet, kỹ nghệ xã hội (social engineering), Whois, DNS, và quét cổng/dịch vụ.
- **Vũ khí hóa (Weaponization) - Trang 51:** Dựa trên các lỗ hổng đã được xác định, kẻ tấn công tạo ra một payload độc hại có thể phân phát được (ví dụ: malware truy cập từ xa) bằng cách sử dụng một mã khai thác (exploit) và một backdoor.
- **Giao chuyển (Delivery) - Trang 52:** Payload đã được vũ khí hóa sẽ được truyền tải tới nạn nhân thông qua email đính kèm (phishing), USB, hoặc qua các lỗ hổng ứng dụng web (watering hole).
- **Khai thác (Exploitation) - Trang 52:** Mã độc của kẻ tấn công được kích hoạt để khai thác lỗ hổng trong hệ điều hành, ứng dụng hoặc máy chủ trên hệ thống mục tiêu nhằm giành quyền truy cập.
- **Cài đặt (Installation) - Trang 52 & 53:** Kẻ tấn công tải xuống và cài đặt thêm phần mềm độc hại (như backdoor) trên hệ thống mục tiêu để duy trì quyền truy cập từ xa trong thời gian dài.
- **Điều khiển và chỉ huy (Command and Control — C2) - Trang 53:** Kẻ tấn công thiết lập một kênh giao tiếp hai chiều giữa hệ thống của nạn nhân và máy chủ C&C. Chúng sử dụng mã hóa hoặc ngụy trang qua các kênh như web traffic, email, hoặc DNS để ẩn giấu dấu vết.
- **Hành động theo mục tiêu (Actions on Objectives) - Trang 53:** Kẻ tấn công điều khiển hệ thống nạn nhân từ xa để hoàn thành các mục tiêu cuối cùng: truy cập dữ liệu bảo mật, phá vỡ dịch vụ mạng, làm hỏng dữ liệu, hoặc dùng hệ thống làm bàn đạp tấn công hệ thống khác.

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

## 5. MITRE ATT&CK Framework (Trang 61 - 62)

MITRE ATT&CK là một cơ sở kiến thức có thể truy cập toàn cầu về các chiến thuật (tactics) và kỹ thuật (techniques) của kẻ tấn công, được xây dựng dựa trên các quan sát trong thế giới thực. Nó được sử dụng làm nền tảng để phát triển các mô hình mối đe dọa (threat models) và phương pháp luận trong khu vực tư nhân, chính phủ, và cộng đồng sản phẩm/dịch vụ an ninh mạng.

MITRE ATT&CK bao gồm 3 bộ chiến thuật và kỹ thuật: Enterprise, Mobile, và PRE-ATT&CK. Trong đó, 14 danh mục chiến thuật (Tactics) của ATT&CK dành cho Enterprise được bắt nguồn từ các giai đoạn sau của chuỗi Cyber Kill Chain:

- Reconnaissance (Trinh sát)
- Resource Development (Phát triển tài nguyên)
- Initial Access (Truy cập ban đầu)
- Execution (Thực thi)
- Persistence (Duy trì)
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

**Các tính năng bổ sung (Extended Diamond Model / Meta-Features):** Ngoài 4 yếu tố trên, mô hình còn sử dụng các tính năng meta để liên kết sự kiện: Timestamp (Thời gian), Phase (Giai đoạn của tấn công), Result (Kết quả), Direction (Hướng tấn công), Methodology (Phương pháp luận), Resource (Tài nguyên), cùng với Socio-political meta-feature (động cơ chính trị/xã hội) và Technology meta-feature (mối quan hệ công nghệ).

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

## 9. Công thức tính rủi ro (Risk) (Trang 73 - 74)

Rủi ro là mức độ không chắc chắn hoặc dự báo về thiệt hại tiềm ẩn do một sự kiện bất lợi gây ra cho hệ thống. Mối quan hệ này được thể hiện qua các công thức sau:

- **RISK = Threats × Vulnerabilities × Impact** (Rủi ro = Mối đe dọa × Lỗ hổng × Tác động) - Trang 73
- **RISK = Threat × Vulnerability × Asset Value** (Rủi ro = Mối đe dọa × Lỗ hổng × Giá trị tài sản) - Trang 73
- **Level of Risk = Consequence × Likelihood** (Mức độ Rủi ro = Hậu quả × Khả năng xảy ra) - Trang 74 (Thường được sử dụng để xây dựng Ma trận rủi ro - Risk Matrix).

## Quy trình Quản lý rủi ro (Risk Management Phases) (Trang 76 - 78)

Quản lý rủi ro là quá trình giảm thiểu và duy trì rủi ro ở mức có thể chấp nhận được thông qua một chương trình bảo mật được xác định rõ ràng. Quy trình này bao gồm 4 giai đoạn chính:

- **Nhận dạng rủi ro (Risk Identification)**: Xác định các nguồn gốc, nguyên nhân, hậu quả và các chi tiết khác của rủi ro nội bộ và bên ngoài ảnh hưởng đến an ninh của tổ chức.
- **Đánh giá rủi ro (Risk Assessment)**: Đánh giá rủi ro của tổ chức và ước tính khả năng xảy ra (likelihood) cũng như tác động (impact) của rủi ro đó.
- **Xử lý rủi ro (Risk Treatment)**: Lựa chọn và thực hiện các biện pháp kiểm soát thích hợp đối với các rủi ro đã được xác định.
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
- **Analysis and Production (Phân tích và Sản xuất - Trang 84):** Áp dụng các kỹ thuật phân tích (định lượng, định tính, thống kê, suy luận) để biến dữ liệu đã xử lý thành các báo cáo tình báo (intelligence) có thể hành động, khách quan và kịp thời.
- **Dissemination and Integration (Phân phối và Tích hợp - Trang 84-85):** Phân phối thông tin tình báo đã được phân tích (báo cáo, IoC) đến người dùng phù hợp (bộ phận quản lý, đội SOC). Quy trình này cũng đi kèm với Feedback (Phản hồi) để đánh giá xem tình báo có đáp ứng yêu cầu hay không, từ đó cải thiện chu kỳ tiếp theo.

---

## 12. Mô hình hóa mối đe dọa (Threat Modeling) (Trang 86 - 89)

Mô hình hóa mối đe dọa là một phương pháp đánh giá rủi ro để phân tích bảo mật của một ứng dụng bằng cách nắm bắt, tổ chức và phân tích tất cả các thông tin ảnh hưởng đến ứng dụng đó. Quy trình thực hiện bao gồm 5 bước:

- **Identify Security Objectives:** Xác định các mục tiêu bảo mật (Tính bảo mật, toàn vẹn, sẵn sàng) và điều kiện tuân thủ.
- **Application Overview:** Xác định các thành phần, luồng dữ liệu (data flows), ranh giới tin cậy (trust boundaries) và các vai trò (roles) trong hệ thống.
- **Decompose the Application:** Phân tách ứng dụng để tìm điểm vào (entry points), điểm ra (exit points) và các điểm giao tiếp chi tiết.
- **Identify Threats:** Xác định các mối đe dọa liên quan tới kịch bản kiểm soát, phân nhóm chúng theo các danh mục.
- **Identify Vulnerabilities:** Xác định các điểm yếu gắn liền với mối đe dọa để tìm cách vá và sửa chữa trước khi bị kẻ tấn công khai thác.

---

## 13. Quản lý sự cố (Incident Management) (Trang 90 - 91)

Quản lý sự cố là tập hợp các quy trình được xác định để xác định, phân tích, ưu tiên và giải quyết các sự cố bảo mật nhằm khôi phục hoạt động dịch vụ bình thường càng nhanh càng tốt và ngăn ngừa sự cố lặp lại. Các hoạt động chính bao gồm: Phân tích lỗ hổng, phân tích hiện vật (Artifact handling), đào tạo nhận thức bảo mật, phát hiện xâm nhập, thông báo, và xử lý sự cố.

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
  - Bảo vệ mật khẩu và Xác thực (Password Protection and Authentication).
  - Phát hiện và Phòng ngừa Phishing (Phishing Detection and Prevention).
  - Phát hiện mối đe dọa (Threat Detection).
  - Quản lý lỗ hổng (Vulnerability Management).
  - Phân tích hành vi (Behavioral Analytics).
  - An ninh mạng lưới (Network Security).
  - Antivirus dựa trên AI (Phát hiện theo hành vi bất thường thay vì dựa vào chữ ký virus).
  - Phát hiện gian lận (Fraud Detection).
  - Phát hiện Botnet (Botnet Detection).
  - Dùng AI để chống lại các mối đe dọa từ AI (AI to Combat AI Threats).

## 14. Luật và Tiêu chuẩn (Laws and Standards) (Trang 99 - 114)

- **PCI DSS (Payment Card Industry Data Security Standard) - Trang 99-100:** Là tiêu chuẩn bảo mật dữ liệu độc quyền dành cho các tổ chức lưu trữ, xử lý, hoặc truyền tải dữ liệu chủ thẻ thanh toán (thẻ tín dụng, ghi nợ). Việc không tuân thủ có thể dẫn đến phạt tiền hoặc bị tước quyền xử lý thẻ.
- **ISO/IEC 27001 - Trang 101:** Tiêu chuẩn quốc tế cung cấp yêu cầu và framework để thiết lập, thực hiện, duy trì và cải tiến liên tục một Hệ thống Quản lý An toàn Thông tin (ISMS) nhằm bảo đảm tính bảo mật, toàn vẹn và sẵn sàng của dữ liệu.
- **HIPAA (Health Insurance Portability and Accountability Act) - Trang 104-105:** Đạo luật cung cấp các biện pháp bảo vệ liên bang đối với thông tin sức khỏe cá nhân có thể nhận diện được (PII). Nó bao gồm các quy tắc như Privacy Rule (bảo vệ hồ sơ y tế) và Security Rule (yêu cầu biện pháp bảo vệ an ninh kỹ thuật, vật lý).
- **SOX (Sarbanes-Oxley Act) - Trang 106-108:** Được ban hành vào năm 2002 để bảo vệ các nhà đầu tư và công chúng bằng cách yêu cầu tính chính xác và độ tin cậy của các báo cáo tài chính từ doanh nghiệp (ngăn chặn gian lận kế toán và doanh nghiệp). Được tổ chức thành 11 danh mục (titles).
- **DMCA (Digital Millennium Copyright Act) - Trang 109:** Luật bản quyền của Hoa Kỳ thực thi các hiệp ước quốc tế nhằm bảo vệ nội dung và tài sản trí tuệ kỹ thuật số. Nó nghiêm cấm việc phá vỡ các biện pháp bảo vệ công nghệ được áp dụng bởi chủ sở hữu bản quyền.
- **FISMA (Federal Information Security Management Act) - Trang 110:** Đạo luật cung cấp một khuôn khổ toàn diện đảm bảo các biện pháp kiểm soát bảo mật thông tin hỗ trợ hoạt động của liên bang Mỹ (áp dụng cho các cơ quan chính phủ và các nhà thầu).
- **DPA 2018 (UK Data Protection Act 2018) & GDPR - Trang 111-113:** DPA 2018 là luật bảo vệ dữ liệu cá nhân của Vương quốc Anh, cập nhật luật từ năm 1998, kiểm soát việc xử lý dữ liệu cá nhân của các tổ chức, trao quyền cho người dùng và thiết lập chức năng của Ủy viên Thông tin (Information Commissioner). Nó hoạt động song song với GDPR của Liên minh Châu Âu (EU) vốn đưa ra 7 nguyên tắc cốt lõi về xử lý dữ liệu (Tính hợp pháp, giới hạn mục đích, giảm thiểu dữ liệu, độ chính xác, giới hạn lưu trữ, tính bảo mật & tính trách nhiệm giải trình) kèm theo các hình phạt rất khắt khe đối với vi phạm.

- **Luật an ninh mạng ở các quốc gia khác (Cyber Law in Different Countries) (Trang 115 - 118)**: Mỗi quốc gia có các bộ luật và quy định riêng để bảo vệ Internet và công nghệ truyền thông (về quyền riêng tư, tự do ngôn luận và quyền tài phán), ví dụ:
  - **Hoa Kỳ (United States)**: Online Copyright Infringement Liability Limitation Act, The Electronic Communications Privacy Act, Privacy Act of 1974, Computer Security Act of 1987, Freedom of Information Act (FOIA), California Consumer Privacy Act (CCPA), v.v.
  - **Úc (Australia)**: Cybercrime Act 2001, The Copyright Act 1968, Trademarks Act 1995.
  - **Vương quốc Anh (United Kingdom)**: Computer Misuse Act 1990, Investigatory Powers Act 2016, The Network and Information Systems Regulations 2018.
  - **Trung Quốc (China)**: Copyright Law, Trademark Law.
  - **Ấn Độ (India)**: Information Technology Act.
  - **Đức (Germany)**: Section 202a (Data Espionage), Section 303a/b (Computer Sabotage).
  - **Các quốc gia/khu vực khác**: Canada (PIPEDA), Singapore (Computer Misuse Act), Brazil (LGPD - Luật bảo vệ dữ liệu chung), Ý, Nhật Bản, Nam Phi, Hàn Quốc, Bỉ, Hong Kong, Philippines.

## 15. Thuật ngữ về hacker và phân loại (Hacking terminology / Hacker Classes)

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
- **Active attacks (Trang 13 - 14):** (Tấn công chủ động) Kẻ tấn công chủ động gửi lưu lượng vào mạng để can thiệp vào dữ liệu đang truyền tải hoặc làm gián đoạn thông tin liên lạc/dịch vụ nhằm vượt qua các hệ thống bảo mật. Loại tấn công này dễ bị phát hiện hơn. Ví dụ: DoS/DDoS, Session hijacking, SQL injection, Man-in-the-Middle, DNS/ARP poisoning.
- **Close-in Attacks (Trang 14):** (Tấn công cự ly gần) Được thực hiện khi kẻ tấn công ở gần hệ thống hoặc mạng mục tiêu về mặt vật lý. Mục đích là thu thập, sửa đổi thông tin hoặc phá hoại quyền truy cập. Ví dụ: Social engineering (như shoulder surfing, dumpster diving).
- **Insider Attacks (Trang 14 - 15):** Được thực hiện bởi những người được tin tưởng (insiders) đã có đặc quyền truy cập vật lý vào các tài sản quan trọng của tổ chức. Họ có thể dễ dàng vượt qua các quy tắc bảo mật để đánh cắp hoặc phá hoại dữ liệu. Ví dụ: Eavesdropping, trộm cắp thiết bị vật lý, cấy keylogger hoặc backdoor.
- **Distribution Attacks (Trang 15):** Xảy ra khi kẻ tấn công can thiệp vào phần cứng hoặc phần mềm trước khi chúng được cài đặt (tại nguồn sản xuất hoặc trong quá trình vận chuyển bàn giao cho khách hàng). Kẻ tấn công tận dụng các backdoor này để giành quyền truy cập trái phép.

---

## 17. Các pha kiểm thử xâm nhập (Pen test phases)

_(Lưu ý: Trong tài liệu CEHv13 Module 01 được cung cấp, các bước này không được đặt tên là "Pen test phases" mà được trình bày cụ thể dưới dạng "Khung quy trình thực hiện kiểm toán bảo mật" - Framework for performing a security audit ở Trang 32 với nội dung tương đồng hoàn toàn)._ Cụ thể:

- **Preparation (Chuẩn bị):** Giai đoạn này bao gồm việc nói chuyện với khách hàng và thảo luận về các nhu cầu cần giải quyết trong quá trình kiểm thử. Đội ngũ chuẩn bị và ký kết các tài liệu Thỏa thuận bảo mật thông tin (NDA). Sau đó, tổ chức một nhóm ethical hacking và chuẩn bị lịch trình, giới hạn để tiến hành kiểm thử.
- **Assessment (Đánh giá):** Tiến hành thực hiện bài kiểm tra thực tế (Conduct the test) theo đúng phạm vi đã được ủy quyền.
- **Conclusion (Kết luận/Hậu đánh giá):** Phân tích các kết quả sau khi thử nghiệm (Analyze the results of the testing) và chuẩn bị báo cáo. Cuối cùng, trình bày các phát hiện và khuyến nghị trong báo cáo cho khách hàng.
