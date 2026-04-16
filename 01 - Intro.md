-------
# Các yếu tố của an ninh thông tin
---

---

- **Bảo mật (Confidentiality)** - chỉ cho phép những người được cấp quyền truy cập.
- **Tính toàn vẹn (Integrity)** - ngăn chặn thay đổi trái phép để dữ liệu đáng tin cậy.
- **Tính sẵn sàng (Availability)** - tài nguyên có sẵn cho người dùng được ủy quyền.
- **Tính xác thực (Authenticity)** - có thể tin rằng mọi thứ, bao gồm file và giao tiếp, là chính chủ.
- **Phi từ chối (Non-repudiation)** - đảm bảo người gửi không thể chối rằng họ đã gửi dữ liệu.
- ***

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

## 9. Công thức tính rủi ro (Risk) (Trang 73 - 74)

Rủi ro là mức độ không chắc chắn hoặc dự báo về thiệt hại tiềm ẩn do một sự kiện bất lợi gây ra cho hệ thống. Mối quan hệ này được thể hiện qua các công thức sau:

- **RISK = Threats × Vulnerabilities × Impact** (Rủi ro = Mối đe dọa × Lỗ hổng × Tác động) - Trang 73
- **RISK = Threat × Vulnerability × Asset Value** (Rủi ro = Mối đe dọa × Lỗ hổng × Giá trị tài sản) - Trang 73
- **Level of Risk = Consequence × Likelihood** (Mức độ Rủi ro = Hậu quả × Khả năng xảy ra) - Trang 74 (Thường được sử dụng để xây dựng Ma trận rủi ro - Risk Matrix).

## Tình báo mối đe dọa mạng (Cyber Threat Intelligence — CTI) — kiến thức dựa trên bằng chứng về các mối đe dọa, giúp tổ chức đưa ra quyết định an ninh tốt hơn.

### Các loại:

- **Strategic intelligence** — cho lãnh đạo điều hành.
- **Tactical intelligence** — cho các đội an ninh.
- **Operational intelligence** — cho đội Ứng phó sự cố.
- **Technical intelligence** — cho hệ thống, SIEM, IDS, v.v.

### Vòng đời CTI:

Direction (what to know) → Collection (thu thập dữ liệu, logs, OSINT) → Processing (làm sạch, chuẩn hoá, enrich) → Analysis (chuyển dữ liệu thành intelligence) → Dissemination (gửi tới người phù hợp) → Feedback

## Threat modeling — quá trình xác định những gì có thể xảy ra, cách tấn công và biện pháp giảm thiểu.

## Quản lý sự cố (Incident management) — xác định, ưu tiên, phân tích, giải quyết, cải thiện. Hoặc: Detect, Contain, Recover, Improve.

## Ứng phó sự cố (nhắc lại quy trình): Preparation, Recording and assignment, Triage, Notification, Containment, Evidence gathering, Eradication, Recovery, Post incident activity.

**Laws and standards**

- **PCI DSS** — Payment Card Industry Data Security Standard
- **ISO/IEC 27001** — framework để thiết lập, duy trì và cải tiến an ninh thông tin
- **HIPAA** — Health Insurance Portability and Accountability Act (bảo vệ thông tin y tế nhận diện được)
- **SOX** — Sarbanes‑Oxley Act (bảo vệ nhà đầu tư, yêu cầu báo cáo công ty)
- **DMCA** — Digital Millennium Copyright Act (bảo vệ nội dung bản quyền kỹ thuật số)
- **FISMA** — Federal Information Security Management Act (áp dụng cho cơ quan liên bang Mỹ và nhà thầu)
- **DPA 2018** — UK Data Protection Act 2018 (luật bảo vệ dữ liệu cá nhân của Vương quốc Anh)

## Thuật ngữ về hacker (Hacking terminology):

- **White hat** — ethical hackers
- **Black hat** — tội phạm mạng
- **Gray hat** — ở giữa tốt/xấu
- **Script kiddies** — kẻ thiếu kỹ năng, copy/paste công cụ
- **Cyber terrorists** — động cơ tôn giáo hoặc chính trị
- **State sponsored** — được nhà nước tài trợ để tấn công
- **Hacktivists** — động cơ chính trị
- **Hacker teams** — nhóm hacker có kỹ năng
- **Industrial spies** — gián điệp công nghiệp
- **Insiders** — người trong tổ chức thực hiện tấn công
- **Criminal syndicates** — tội phạm có tổ chức vì lợi ích tài chính
- **Organized hackers** — cho thuê tài nguyên, lấy tiền từ nạn nhân

## Các loại tấn công (Attack types):

- **Passive attack** — theo dõi như sniffing, eavesdropping; không thay đổi dữ liệu.
- **Active attack** — cố gắng thay đổi, xóa hoặc thao túng dữ liệu; rủi ro bị phát hiện cao hơn.
- **Close‑in attacks** — tấn công khi ở gần mục tiêu (ví dụ shoulder surfing).
- **Insider attacks** — tấn công bởi người đã có quyền truy cập.
- **Distribution attacks** — tấn công được thực hiện trước khi hệ thống/thiết bị được bàn giao cho khách hàng.

## Các pha kiểm thử xâm nhập (Pen test phases):

- **Preparation** — xác định thời gian, phạm vi, loại tấn công được cho phép, nhân sự.
- **Assessment** — thực hiện pentest.
- **Conclusion (post‑assessment)** — soạn báo cáo, kết luận, khuyến nghị.
