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

## Hành vi tấn công / Phương pháp tấn công (Hacking methodology):

1. **Giai đoạn 1: Thu thập thông tin (Reconnaissance / Footprinting)** - Trang 47 Đây là giai đoạn chuẩn bị, trong đó kẻ tấn công thu thập càng nhiều thông tin càng tốt về mục tiêu trước khi tiến hành tấn công để tạo hồ sơ về tổ chức mục tiêu (ví dụ: dải địa chỉ IP, không gian tên, thông tin nhân viên). Kỹ thuật này được chia làm hai loại:

   **Footprinting thụ động (Passive reconnaissance):** Kẻ tấn công không tương tác trực tiếp với mục tiêu mà dựa vào các thông tin công khai có sẵn trên internet, các thông cáo báo chí hoặc các phương pháp không tiếp xúc khác.
   **Footprinting chủ động (Active reconnaissance):** Yêu cầu tương tác trực tiếp với hệ thống mục tiêu thông qua các công cụ để phát hiện cổng mở, host có thể truy cập, vị trí bộ định tuyến, lập bản đồ mạng và chi tiết về hệ điều hành cũng như ứng dụng.

2. **Giai đoạn Quét và Liệt kê (Scanning và Enumeration)** - Trang 47

   **Scanning (Quét mạng):** Là phần mở rộng hợp lý của việc thu thập thông tin chủ động nhằm thăm dò sâu hơn. Scanning được sử dụng để xác định các host đang hoạt động, các cổng mở (open ports) và các dịch vụ không cần thiết đang được bật trên các host cụ thể.

   **Enumeration (Liệt kê):** Liên quan đến việc tạo các kết nối tích cực (active connections) đến hệ thống mục tiêu hoặc gửi các truy vấn trực tiếp. Đây là phương pháp thăm dò xâm nhập (intrusive probing) để thu thập thông tin chi tiết như: danh sách người dùng mạng, bảng định tuyến, lỗ hổng bảo mật, người dùng được chia sẻ, nhóm, ứng dụng và banner.

3. **Giai đoạn 2: Quét lỗ hổng / Phân tích lỗ hổng (Vulnerability Scanning)** - Trang 48 Giai đoạn này kiểm tra khả năng chống chịu tấn công của hệ thống hoặc ứng dụng, bao gồm các quy trình và kiểm soát bảo mật hiện tại. Kẻ tấn công thực hiện phân tích lỗ hổng để:

   Nhận diện, đo lường và phân loại các lỗ hổng bảo mật trong hệ thống máy tính, mạng và các kênh liên lạc.
   Xác định các lỗ hổng trong cơ sở hạ tầng mạng, cơ sở hạ tầng truyền thông và các hệ thống đầu cuối của tổ chức mục tiêu để sử dụng cho việc khai thác sau này.

4. **Khai thác hệ thống (System Hacking)** - Trang 48 & 49 Đây là giai đoạn mà quá trình hack thực sự diễn ra, sử dụng thông tin từ các bước trước đó. Giai đoạn này bao gồm các bước sau:

   **Giai đoạn 3:** Đột nhập (Gaining Access) - Trang 48: Kẻ tấn công sử dụng các kỹ thuật như bẻ khóa mật khẩu (password cracking) và khai thác lỗ hổng (ví dụ: tràn bộ đệm - buffer overflows) để giành quyền truy cập vào hệ điều hành hoặc ứng dụng trên mục tiêu. Cơ hội thành công phụ thuộc vào kiến trúc hệ thống, cấu hình, kỹ năng của kẻ tấn công và mức độ truy cập ban đầu.
   **Leo thang đặc quyền (Escalating Privileges) - Trang 48:** Sau khi truy cập thành công bằng tài khoản người dùng có đặc quyền thấp, kẻ tấn công khai thác các lỗ hổng hệ thống đã biết để nâng quyền của mình lên mức quản trị viên (administrator/root) nhằm thực hiện các thao tác hệ thống được bảo vệ và kiểm soát hoàn toàn.
   **Giai đoạn 4:** Duy trì truy cập (Maintaining Access) - Trang 48: Khi đã có quyền admin/root (tức là làm chủ hệ thống), kẻ tấn công sẽ cố gắng duy trì sự kiểm soát này. Chúng có thể sử dụng hệ thống này làm bàn đạp để quét và tấn công các hệ thống khác, tải lên/tải xuống dữ liệu, sử dụng phần mềm độc hại để lấy cắp mật khẩu. Chúng cũng có thể duy trì quyền kiểm soát lâu dài bằng cách tự "vá" các lỗ hổng để ngăn những hacker khác xâm nhập.
   **Giai đoạn 5:** Xóa dấu vết (Clearing Tracks) - Trang 49: Để không bị phát hiện, kẻ tấn công phải xóa mọi bằng chứng về việc hệ thống đã bị xâm phạm. Chúng thực hiện điều này bằng cách sửa đổi hoặc xóa các tệp nhật ký (logs) bằng các tiện ích xóa nhật ký (log-wiping utilities), qua đó loại bỏ hoàn toàn dấu vết về sự hiện diện của chúng.

## Quản lý sự kiện và sự cố bảo mật (Security Information and Event Management — SIEM) — ví dụ: Splunk.

## Cyber kill chain — các bước phổ biến:

**1. Trinh sát (Reconnaissance)** — thu thập dữ liệu, xác định lỗ hổng.\*\*
**2. Vũ khí hóa (Weaponization)** — tạo payload độc hại sử dụng lỗ hổng, backdoor, v.v.\*\*
**3. Giao chuyển (Delivery)** — gửi payload tới mục tiêu.\*\*
**4. Khai thác (Exploitation)** — thực thi mã đã gửi trên hệ thống mục tiêu.\*\*
**5. Cài đặt (Installation)** — cài đặt ứng dụng độc hại trên hệ thống.\*\*
**6. Điều khiển và chỉ huy (Command and Control** — C2) — tạo kênh C2 để gửi/nhận dữ liệu.\*\*
**7. Hành động theo mục tiêu (Actions on Objectives)** — thực hiện hành động để hoàn thành nhiệm vụ: đánh cắp hoặc làm hỏng dữ liệu, thiết lập botnet, v.v.\*\*

![[Pasted image 20251221190622.png]]

## Xác định hành vi kẻ tấn công (Adversary behavioral identification) — nhận diện các phương pháp thường dùng của kẻ tấn công.

## TTPs — Tactics, Techniques, Procedures (chiến thuật, kỹ thuật, thủ tục):

- **Tactics** — cách kẻ đe dọa hoạt động trong các pha khác nhau của cuộc tấn công (ví dụ APT).
- **Techniques** — kỹ thuật cụ thể để đạt mục tiêu (thường phụ thuộc vào công cụ kỹ thuật để leo thang quyền).
- **Procedures** — chuỗi hành động thực tế.

## Chỉ báo xâm phạm (Indicator of Compromise — IOC):

- Chỉ báo email: địa chỉ người gửi, subject, loại tệp đính kèm.
- Chỉ báo mạng: URL, domain, địa chỉ IP.
- Chỉ báo trên host: tên file, hash, khóa registry.
- Chỉ báo hành vi: thực thi PowerShell hoặc lệnh từ xa.

![[Pasted image 20251221191048.png]]

## MITRE ATT&CK — là một framework phi lợi nhuận, miễn phí, dùng để phân loại hệ thống hành vi của kẻ tấn công một cách có hệ thống và hỗ trợ chuẩn bị ứng phó.

- **Tactics** — tại sao kẻ tấn công thực hiện hành động.
- **Techniques** — cách kẻ tấn công đạt được mục tiêu.
- **Subtechniques** — mô tả chi tiết hơn về hành vi đối kháng.
- **Procedures** — cách triển khai cụ thể của kỹ thuật/subtechnique trên thực tế (in the wild).

### Các pha/ma trận thông thường (ví dụ ATT&CK):

- **Resource Development**
- **Initial Access**
- **Execution**
- **Persistence**
- **Privilege Escalation**
- **Defense Evasion**
- **Credential Access**
- **Discovery**
- **Lateral Movement**
- **Collection**
- **Command and Control**
- **Exfiltration**
- **Impact**

Memorize[[https://oreil.ly/gQEcH]]m

## Mô hình Diamond:

- **Adversary** — WHO (ai: APT, nhóm tội phạm mạng, v.v.)
- **Capability** — WHAT (các công cụ: malware, exploits, ransomware)
- **Infrastructure** — WHERE (server C2, domain độc hại, địa chỉ IP)
- **Victim** — WHO bị nhắm đến (tổ chức, cá nhân)

## Bảo đảm thông tin (Information Assurance — IA) — bắt đầu từ chính sách, kết thúc ở con người; giữa hai là quản lý rủi ro.

**Quy trình:** Plan → Design → Find problems → Get resources → Plan fixes → Apply controls → Verify → Train people

## Chiến lược an ninh liên tục / thích ứng:

![[Pasted image 20251221194558.png]]

**RISK = threats × vulnerabilities × impact**
**RISK = threat × vulnerability × asset value**
**Mức độ RISK = consequence × likelihood**

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
