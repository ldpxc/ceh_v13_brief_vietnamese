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

## Bộ ba CIA (CIA = Confidentiality, Integrity, Availability) — ví dụ: mật khẩu, user ID, danh tính.

- **Tính toàn vẹn (Integrity)** — thay đổi hoặc chỉnh sửa trái phép của dữ liệu; đảm bảo bằng hàm băm (hash function).
- **Tính sẵn sàng (Availability)** — ví dụ: bị ảnh hưởng bởi tấn công từ chối dịch vụ (Denial of Service — DoS).

## Ứng phó sự cố (Incident Response — IR)

### Quy trình cơ bản:

- **Chuẩn bị (Preparation)**
- **Ghi nhận và phân công (Recording and assignment)**
- **Phân loại ưu tiên (Triage)**
- **Thông báo (Notification)**
- **Cách ly (Containment)**
- **Thu thập bằng chứng (Evidence gathering)**
- **Loại bỏ (Eradication)**
- **Phục hồi (Recovery)**
- **Hoạt động sau sự cố (Post-incident activity)**

## Hành vi tấn công / Phương pháp tấn công (Hacking methodology):

**1. Footprinting**

Thu thập thông tin và bằng chứng. Footprinting thụ động (passive footprinting) thu thập thông tin mà không tương tác trực tiếp với mục tiêu; footprinting chủ động (active footprinting) yêu cầu hành động tương tác.

**2. Scanning và 3. Enumeration**

- Scanning: xác định mạng hoặc host, phát hiện hệ điều hành, kiến trúc và các điểm yếu.
- Enumeration: thường xảy ra trong mạng nội bộ (intranet), thu thập thông tin chi tiết về dịch vụ và người dùng.

**3. Phân tích lỗ hổng (Vulnerability analysis)**

**4. System hacking**

- Đột nhập (Gaining access) — bẻ mật khẩu, SQL injection.
- Leo thang đặc quyền (Escalation of privileges) — tăng quyền, thay đổi mật khẩu, xóa file.
- Duy trì truy cập (Maintain access) — đảm bảo con đường trở lại máy chủ.
- Xóa log (Clearing logs) — che giấu dấu vết bằng cách thay đổi file log, ẩn file bằng thuộc tính hoặc thư mục ẩn, hoặc dùng kênh tunnel để giao tiếp với hệ thống.

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
