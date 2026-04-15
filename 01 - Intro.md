-------
Elements of information security
---

---

- Confidentiality - chỉ được truy cập bởi những người có quyền
- Integrity - ngăn chặn các thay đổi trái phép để dữ liệu đáng tin cậy
- Availability - tài nguyên sẵn sàng cho người dùng được phép
- Authenticity - đảm bảo mọi thứ, bao gồm files và liên lạc, là xác thực
- Non-repudiation - đảm bảo người gửi không thể phủ nhận đã gửi bất kỳ thông tin nào
- ***

Phân tích rủi ro:

Ma trận rủi ro

ARO - annual rate of occurrence (tần suất xảy ra hàng năm)

SLE - single loss expectancy (mức thiệt hại kỳ vọng cho một sự kiện đơn lẻ)

ALE = SLE × ARO (annualized loss expectancy — tổn thất kỳ vọng hàng năm)

BCP - business continuity plan (kế hoạch đảm bảo hoạt động liên tục của doanh nghiệp)

CIA = Confidentiality, Integrity, Availability

Integrity - sự thay đổi hoặc chỉnh sửa trái phép của dữ liệu; đảm bảo bằng hash function

Availability - DoS (Denial of Service — tấn công từ chối dịch vụ)

IR - Incident Response (Ứng phó sự cố)

- Preparation (Chuẩn bị)
- Recording and assignment (Ghi nhận và phân công)
- Triage (Phân loại / ưu tiên)
- Notification (Thông báo)
- Containment (Hạn chế / cô lập)
- Evidence gathering (Thu thập bằng chứng)
- Eradication (Loại bỏ nguyên nhân)
- Recovery (Phục hồi)
- Post-incident activity (Hoạt động sau sự cố)

Hacking methodology:

1: footprinting

Thu thập bằng chứng và thông tin. Passive footprinting thu thập thông tin mà không tương tác trực tiếp với mục tiêu. Active footprinting đòi hỏi hành động trực tiếp.

2 and 3: Scanning and enumeration:

Scanning: xác định mạng hoặc hosts, phát hiện OS, kiến trúc và lỗ hổng.

Enumeration: thường xảy ra trong intranet.

4: Vulnerability analysis

5: **System hacking**

- Gaining access - password cracking, SQL injection
- Escalation of privileges - tăng quyền truy cập, thay đổi mật khẩu, xóa file
- Maintain access - đảm bảo đường quay lại vào máy
- Clearing logs - che giấu thành công bằng cách sửa file log, ẩn file bằng thuộc tính/thư mục ẩn hoặc dùng tunneling để giao tiếp với hệ thống
- **SIEM** - security incident and event management (quản lý sự kiện và sự cố bảo mật). Splunk

**Cyber kill chain** (mô hình chuỗi giai đoạn tấn công mạng)

1. Reconnaissance - Thu thập dữ liệu, xác định lỗ hổng
2. Weaponization - Tạo payload độc hại sử dụng lỗ hổng, backdoors, v.v. (tạo "vũ khí")
3. Delivery - Gửi payload tới mục tiêu
4. Exploitation - Thực thi mã được gửi lên hệ thống mục tiêu
5. Installation - Cài đặt phần mềm độc hại trên mục tiêu
6. Command and control - Thiết lập kênh C2 để trao đổi dữ liệu
7. Actions and objectives - Thực hiện hành động để hoàn thành mục tiêu (đánh cắp hoặc làm hỏng dữ liệu, thiết lập botnet, ...)

Adversary behavioral identification - xác định các phương thức phổ biến của kẻ tấn công.

TTPs (Tactics, Techniques, Procedures — chiến thuật, kỹ thuật, thủ tục):

- Tactics - cách tác nhân đe dọa vận hành trong các giai đoạn khác nhau của cuộc tấn công
- Techniques - các phương thức kỹ thuật cụ thể, quan trọng khi phân tích hiệu quả
- Procedures - chuỗi hành động hoặc cách triển khai cụ thể

**IOC** - indicator of compromise (chỉ báo xâm phạm: dấu hiệu kẻ tấn công để lại)

- Email indicators: các địa chỉ gửi, tên miền, chủ đề, loại tệp đính kèm
- Network indicators: URLs, domains, IP addresses
- Host-based indicators: tên file cụ thể, hashes, registry keys
- Behavioral indicators: thực thi PowerShell hoặc lệnh từ xa

![[Pasted image 20251221190622.png]]
![[Pasted image 20251221191048.png]]

**Mitre ATT&CK framework** — nonprofit, free-to-use framework để hệ thống hóa hành vi của kẻ tấn công; giúp chuẩn bị và phòng ngừa.

- Tactics — tại sao kẻ tấn công thực hiện hành động
- Techniques — cách họ đạt được mục tiêu
- Subtechniques — mô tả chi tiết hơn ở mức thấp hơn
- Procedures — cách triển khai cụ thể trong thực tế

- Resource Development
- Initial Access
- Execution
- Persistence
- Privilege Escalation
- Defense Evasion
- Credential Access
- Discovery
- Lateral Movement
- Collection
- Command and Control
- Exfiltration
- Impact

Ghi nhớ: [[https://oreil.ly/gQEcH]]

**Diamond model**:

- Adversary — WHO (nhóm APT, tội phạm mạng, ...)
- Capability — WHAT (malware, exploit, ransomware)
- Infrastructure — WHERE (C2 servers, malicious domains, IP addresses)
- Victim — WHO is targeted (tổ chức, cá nhân)

Information assurance (IA) — IA bắt đầu từ chính sách, kết thúc ở con người, và mọi thứ ở giữa là quản lý rủi ro.
Plan → Design → Find problems → Get resources → Plan fixes → Apply controls → Verify → Train people

Continual/Adaptive security strategy:
![[Pasted image 20251221194558.png]]

RISK = threats × vulnerabilities × impact
RISK = threat × vulnerability × asset value
Level of RISK = consequence × likelihood

Cyber threat intelligence (CTI) — evidence-based knowledge about threats that helps organizations make better security decisions.
Types:

- Strategic intelligence — cho lãnh đạo
- Tactical intelligence — cho đội bảo mật
- Operational intelligence — cho incident response
- Technical intelligence — cho hệ thống, SIEM, IDS, v.v.

Lifecycle (CTI):
Direction (what to know) → Collection (gather data, logs, OSINT) → Processing (clean, normalize, enrich) → Analyse (data → intelligence) → Dissemination (trao intelligence cho người phù hợp) → Feedback

Threat modeling — quá trình xác định những gì có thể sai, cách bị tấn công và cách giảm thiểu.

Incident management — identify, prioritize, analyze, resolve, improve.
Hoặc: detect, contain, recover, improve.

Incident response — Preparation, Recording and assignment, triage, notification, containment, evidence gathering, eradication, recovery and post incident activity.

**Laws and standards**

- PCI DSS — Payment Card Industry Data Security Standard (tiêu chuẩn bảo mật dữ liệu thẻ)
- ISO/IEC 27001 — framework để thiết lập, duy trì và cải tiến information security management
- HIPAA — Health Insurance Portability and Accountability Act (bảo vệ thông tin y tế cá nhân)
- SOX — (Sarbanes-Oxley) quy định về báo cáo tài chính, bảo vệ nhà đầu tư
- DMCA — US copyright law (bảo vệ nội dung có bản quyền, DRM)
- FISMA — Federal Information Security Management Act (áp dụng cho cơ quan liên bang Mỹ và nhà thầu)
- DPA 2018 — UK primary personal data protection law (luật bảo vệ dữ liệu cá nhân của Vương quốc Anh)

**Hacking terminology**

- White hat — ethical hackers
- Black hat — malicious attackers
- Grey hat — ở giữa
- script kiddies — kẻ ít kinh nghiệm, sao chép mã
- Cyber terrorists — có động cơ chính trị/ý thức hệ
- State sponsored — do nhà nước tài trợ
- Hacktivists — motivated by political agenda (thực hiện tấn công vì lý do chính trị)
- hacker teams — nhóm hacker có kỹ năng và tài nguyên
- Industrial spies — gián điệp công nghiệp
- insiders — người có quyền truy cập bên trong tổ chức
- Criminal syndicates — tội phạm có tổ chức
- organized hackers — thuê mướn tài nguyên, kiếm tiền từ nạn nhân

**Attack types**

- Passive attack — giám sát như sniffing và eavesdropping; không thay đổi dữ liệu
- Active attack — cố gắng thay đổi, sửa hoặc xóa dữ liệu; rủi ro bị phát hiện cao hơn
- Close in attacks — tiếp cận vật lý gần mục tiêu (shoulder surfing)
- Insider attacks — thực hiện bởi người đã có một số quyền truy cập
- Distribution attacks — tấn công trước khi hệ thống được giao cho khách hàng (ví dụ: supply-chain)

**Pen test phases**

- Preparation — xác định thời gian, phạm vi, loại tấn công được phép, người thực hiện
- Assessment — tiến hành pentest thực tế
- Conclusion (post-assessment) — chuẩn bị báo cáo, nêu findings và recommendations

-
