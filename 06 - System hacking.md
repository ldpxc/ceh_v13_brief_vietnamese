## Chiếm quyền truy cập (Gaining access)

## Windows

Cách mật khẩu được lưu trong SAM của Windows (SAM):

    Trình quản lý tài khoản bảo mật của Windows (SAM) hoặc cơ sở dữ liệu AD (AD) dùng để quản lý tài khoản và lưu mật khẩu ở dạng băm (hash — một chiều).

    Không lưu mật khẩu ở dạng plaintext — dùng hash.
    Tệp SAM được sử dụng như một file registry database.

    Không thể sao chép tệp SAM sang vị trí khác trong khi Windows đang chạy.

    Có thể dump nội dung trên đĩa bao gồm SAM bằng nhiều kỹ thuật khác nhau.

    SAM sử dụng chức năng SYSKEY (SYSKEY) để mã hóa một phần các hash mật khẩu.

Cách mật khẩu được lưu trong SAM:

- Vị trí: %SystemRoot%\system32\config\SAM -> trong registry HKEY_LOCAL_MACHINE\SAM
- Lưu các giá trị băm LM hoặc NTLM (LM/NTLM)

NTLM authentication (NTLM):
NT LAN Manager (NTLM) — giao thức xác thực mặc định trên một số hệ thống cũ

- Không dựa trên một đặc tả giao thức chính thức nên không có bảo đảm hoạt động hoàn toàn nhất quán
- NTLMv2 được coi là tương đối an toàn nhưng vẫn yếu hơn Kerberos
- Vista và các bản Windows sau này đã vô hiệu hóa hashing LM (LM)
- Giá trị LM thường để trống trên các phiên bản mới

Công cụ trích xuất hash mật khẩu:

- pwdump7
- Mimikatz
- DSinternals
- hashcat
- PyCrack

Quy trình xác thực NTLM (tóm tắt):
Client request access -> Server gửi challenge -> Client tính response -> Server xác thực (AD hoặc SAM)

Kerberos authentication (Kerberos):

- Dùng mật mã khóa bí mật (secret key cryptography)
- KDC — Key Distribution Center (KDC)
- AS — Authentication Server (AS)
- TGS — Ticket Granting Server (TGS)
- Nâng cấp so với NTLM

Quy trình Kerberos (tóm tắt):
Đăng nhập và yêu cầu ticket -> Nhận Ticket-Granting Ticket (TGT) -> Yêu cầu quyền truy cập dịch vụ -> Nhận Service ticket -> Truy cập dịch vụ

Các phương án lấy mật khẩu / bẻ khóa:

- Dump credentials từ bộ nhớ
- Lấy bản sao cục bộ của cơ sở dữ liệu SAM
- Lấy bản sao của AD file `ntds.dit`
- Trích xuất SYSKEY (boot key)
- Chặn (intercept) credentials truyền qua mạng:
  - Passive sniffing (nghe lén thụ động)
  - MITM (Man-in-the-Middle)
  - Plaintext password (mật khẩu dạng văn bản)
  - LM, NTLM, NTLMv2, Kerberos

Tấn công brute-force trên dịch vụ mạng:

- Đăng nhập/SMB/File and Print server (TCP 139, 445)
- Web servers (80, 443)
- MS Exchange (TCP 25, 110, 143)
- MSSQL (1433)

Brute force dịch vụ điều khiển từ xa:

- RDP (TCP 3389)
- Telnet (23)

## Password cracking

Tấn công không điện tử — social engineering, dumpster diving, v.v.

Tấn công online chủ động — đoán mật khẩu, dictionary và brute-force, password spraying, mask attack, hash injection, LLMNR/NBT-NS poisoning, trojans/spyware/keyloggers, internal monologue attacks, Markov-chain, v.v.

- Dictionary attack — dùng file từ điển chạy với ứng dụng bẻ khóa trên các tài khoản
- Brute force attack — thử mọi kết hợp cho tới khi bẻ được mật khẩu
- Rule-based attack — khi có một số thông tin về mật khẩu; hybrid (kết hợp với dictionary), syllable attack
- Password spraying — tấn công nhiều tài khoản cùng lúc với một danh sách mật khẩu phổ biến
- Hash injection / Pass-the-Hash (PtH) — chèn hash đã bị lộ vào phiên cục bộ để xác thực tài nguyên mạng
- LLMNR/NBT-NS poisoning — lợi dụng LLMNR/NBT-NS để thực hiện name resolution trên cùng link (công cụ: Responder). (LLMNR = Link-Local Multicast Name Resolution; NBT-NS = NetBIOS Name Service)
- Cracking Kerberos — AS-REP roasting (nhắm vào tài khoản không yêu cầu Kerberos pre-authentication)
- Kerberoasting — trích xuất và bẻ khóa service account hashes để leo thang quyền (công cụ: hashcat)
- Pass-the-ticket — xác thực không dùng mật khẩu bằng cách dùng TGT/ST (công cụ: Mimikatz)
- NTLM Relay — chặn và relay yêu cầu xác thực NTLM (công cụ: Responder, ntlmrelayx)

Tấn công online thụ động — không thay đổi hệ thống, lấy mật khẩu bằng cách giám sát dữ liệu truyền qua mạng.

Tấn công offline — phục hồi mật khẩu từ bản dump hash.

Công cụ password spraying và brute:

- `thc-hydra` (ví dụ: `hydra -l <login> -p <password> -L <logins> -P <passwords>`)
- Metasploit
- Rubeus
- adfsbrute
- CrackMapExec

Mask attack — brute-force theo mẫu mật khẩu được biết trước (hashcat `-m` để chỉ định hash mode)

Công cụ kiểm tra mật khẩu mặc định:

- fortypoundhead.com
- cirt.net

Internal monologue attack — dùng SSPI (Security Support Provider Interface) để tính NetNTLM response từ ứng dụng user-mode

Kerberos cracking (tóm tắt):

- AS-REP Roasting — bẻ TGT cho tài khoản không yêu cầu pre-auth; cần kết nối tới DC và một tài khoản domain
- Kerberoasting — bẻ TGS/service tickets (công cụ: Rubeus)
- Pass-the-ticket — sử dụng Kerberos ticket mà không cần mật khẩu (Mimikatz)
- NTLM relay — chặn yêu cầu xác thực NTLM (Responder -I eth0)

Các phương pháp tấn công mật khẩu khác: Fingerprint attack, PRINCE, Markov chain, v.v.

Tấn công thụ động:

- Wire sniffing (nghe lén lớp liên kết dữ liệu)

Tấn công online khác:

- Rainbow table attack — dùng dữ liệu đã được tính trước (công cụ: `rtgen`)

Tấn công phân tán — dùng nhiều máy để bẻ mật khẩu (ví dụ: Elcomsoft Distributed Password Recovery)

Công cụ phục hồi mật khẩu:

- Elcomsoft Distributed Password Recovery
- Passware Kit
- hashcat
- PCUnlocker
- Lazesoft
- Passper

Công cụ bẻ mật khẩu:

- L0phtCrack
- THC Hydra
- RainbowCrack

Password salting — thêm chuỗi ngẫu nhiên trước khi tính hash để làm tăng độ khó tấn công

Công cụ phát hiện LLMNR/NBT-NS poisoning: Vindicate, Responder (phát hiện), got-responded

## Vulnerability exploitation

Các bước cơ bản:

1. Xác định lỗ hổng
2. Đánh giá rủi ro liên quan
3. Xác định khả năng khai thác lỗ hổng
4. Phát triển exploit
5. Chọn phương pháp chuyển payload — local hay remote
6. Tạo và chuyển payload
7. Đạt quyền truy cập từ xa

Nguồn exploit:

- ExploitDB
- VulnDB
- OSV.dev (cho dự án mã nguồn mở)
- MITRE CVE
- Windows Exploit Suggester (WES-NG)

Metasploit (Metasploit):

- Exploit module:
  1.  Cấu hình exploit
  2.  Xác định các tùy chọn exploit
  3.  Chọn target
  4.  Chọn payload
  5.  Khởi chạy exploit
- Payload module:
  1.  Thiết lập kênh liên lạc giữa Metasploit và máy nạn nhân
  2.  Chứa mã tùy ý được thực thi sau khi exploit thành công
  3.  Chọn payload: `msf payload`
      Module types: - Singles: standalone - Stagers: thiết lập kết nối mạng giữa attacker và victim - Stages: được tải xuống bởi stager
      Payload có thể upload/download file, chụp màn hình, thu thập hash mật khẩu
- Auxiliary module:
  1.  Dùng cho hành động một lần như quét cổng, DoS, fuzzing
  2.  Sử dụng: `use`, `exploit`
      `show auxiliary` — liệt kê module
      `exploit/run` — chạy module
- NOPS module:
  1.  Tạo chuỗi no-operation (NOP sled) để lấp buffer
  2.  Ví dụ: `msf generate -t c 50` — tạo NOP 50 byte
- Encoder modules:
  1.  Dùng để mã hóa/che dấu payload nhằm né AV/IDS
  2.  Obfuscation, polymorphism
- Evasion modules:
  1.  Thay đổi hành vi/p thuộc tính payload để né phát hiện
- Post-exploitation modules:
  1.  Dùng sau khi đã chiếm hệ thống để tương tác thêm
  2.  Ví dụ: `post/windows/gather/enum_logged_on_users`, `post/linux/gather/enum_configs`

Công cụ khai thác hỗ trợ AI:

- Nebula
- DeepExploit (liên kết với Metasploit)

## Buffer overflow

Buffer là vùng bộ nhớ liên tiếp dùng để chứa dữ liệu runtime cho chương trình

Buffer overflow (tràn bộ đệm) là lỗ hổng phổ biến khi chương trình nhận nhiều dữ liệu hơn bộ đệm cho phép, dẫn tới ghi đè vùng nhớ lân cận

Kẻ tấn công khai thác điều này để tiêm mã độc — làm hỏng file, sửa dữ liệu, truy cập thông tin nhạy cảm, leo thang quyền, mở shell, v.v.

Các chương trình dễ bị tràn bộ đệm nếu:

- Không kiểm tra ranh giới (boundary checks)
- Dùng ngôn ngữ lập trình cũ/phi an toàn
- Dùng hàm không an toàn để kiểm tra kích thước buffer
- Thiếu thực hành lập trình tốt (validation/filtering)
- Cấp phát bộ nhớ không đúng và không sanitization
- Dùng con trỏ truy cập vùng heap không an toàn

Các loại buffer overflow:

Stack-based overflow — dùng stack (LIFO) cho cấp phát tĩnh

- PUSH lưu dữ liệu; POP loại dữ liệu
- Nếu bị kiểm soát, attacker có thể ghi đè thanh ghi EIP (instruction pointer) để thay địa chỉ trả về và chiếm shell

Các thanh ghi liên quan:

- EBP — extended base pointer (đầu cơ địa cho stack)
- ESP — extended stack pointer (địa chỉ lệnh kế tiếp trên stack)
- EIP — extended instruction pointer (địa chỉ lệnh tiếp theo)
- ESI/EDI — source/destination index cho các thao tác chuỗi

Heap-based overflow — heap là vùng cấp phát động tại runtime

- Tràn khi block heap nhận dữ liệu vượt quá kích thước
- Ghi đè pointer đối tượng dẫn tới kỹ thuật khai thác khác nhau

Buffer overflow trên Windows:

- Spiking — gửi TCP/UDP crafted để làm crash dịch vụ; dùng `nc -nv <ip> <port>` để kết nối và tạo mẫu bằng STATS function
- Fuzzing — gửi lượng lớn data để tràn EIP, xác định số byte gây crash, dùng `pattern_create` (Ruby) và `pattern_offset` (Metasploit) để tìm offset
- Xác định offset (Metasploit) — `pattern_create` / `pattern_offset` để tìm vị trí EIP bị ghi đè

Return Oriented Programming (ROP) — tái sử dụng các đoạn mã (gadgets) có sẵn trong libc hoặc kernel32.dll để thực thi mã độc

Heap spraying — lấp đầy vùng trống trong bộ nhớ process bằng nhiều bản sao mã độc

JIT spraying — lợi dụng JIT compilation (trên trình duyệt) để thực thi mã tùy ý (thường qua JavaScript)

Exploit chaining — kết hợp nhiều exploit và lỗ hổng nối tiếp nhau

AD Domain mapping — dùng BloodHound để ánh xạ AD domain (BloodHound)
Post-AD enumeration — dùng PowerView để lấy users, groups, domains (PowerView)

| Command                                          | Description                                                       |
| ------------------------------------------------ | ----------------------------------------------------------------- |
| Get-ADomain<br>Get-NetDomain                     | Lấy thông tin domain hiện tại, bao gồm DCs                        |
| Get-DomainSID                                    | Lấy security IDs                                                  |
| Get-DomainPolicy                                 | Lấy thông tin cấu hình policy domain                              |
| (Get-DomainPolicy)."SystemAccess"                | Lấy thông tin liên quan tới policy truy cập hệ thống domain       |
| (Get-DomainPolicy)."kerberospolicy"              | Lấy thông tin policy Kerberos của domain                          |
| Get-NetDomainController                          | Lấy thông tin controller của domain hiện tại                      |
| Get-NetUser                                      | Thông tin người dùng hiện tại                                     |
| Get-NetLoggedon -ComputerName                    | Người dùng domain đang active trên máy                            |
| Get-UserProperty -Properties pwdlastset          | Ngày giờ mật khẩu được set lần cuối cho mỗi user                  |
| Find-LocalAdminAccess Invoke-EnumerateLocalAdmin | Lấy danh sách user có quyền admin local (cần quyền admin để chạy) |
| Computer-NetSession -ComputerName                | Lấy thông tin người dùng domain đang đăng nhập trên máy           |

Liệt kê Domain trust/forests:

- One-way trust — trust một chiều (unidirectional): cho phép người dùng domain tin tưởng truy cập tài nguyên của domain đáng tin cậy
- Two-way trust — trust hai chiều: cho phép truy cập qua lại giữa hai domain

Xác định lỗ hổng bằng GhostPack Seatbelt — thu thập thông tin PowerShell, Kerberos tickets và mục trong Recycle Bin

Công cụ phát hiện buffer overflow / quét lỗ hổng:

- OllyDbg
- Veracode
- Flawfinder
- Kiuwan
- Splint
- Valgrind

## Privilege Escalation

Horizontal privilege escalation — cố gắng truy cập tài nguyên thuộc quyền người dùng có cùng mức quyền; không phải tăng quyền theo ý nghĩa truyền thống

Vertical privilege escalation — người dùng trái phép cố gắng đạt mức quyền cao hơn (thực thi code ở privilege level cao hơn)

Privilege escalation qua DLL hijacking — đặt DLL độc hại trong thư viện ứng dụng để bị load (ví dụ công cụ: Spartacus)

Privilege escalation bằng khai thác lỗ hổng — tra cứu trên ExploitDB

Privilege escalation bằng dylib hijacking — dynamic library attacks trên macOS (tool: Dylib Hijack Scanner)

Privilege escalation qua Spectre/Meltdown — lợi dụng speculative execution trên CPU (Spectre, Meltdown) để đọc dữ liệu bị giới hạn

Named Pipe impersonation — trên Windows, named pipes được dùng cho giao tiếp giữa process; Metasploit có module để impersonate named pipes

Unquoted service paths — dịch vụ có đường dẫn chứa khoảng trắng nhưng không có dấu ngoặc kép, kẻ tấn công lợi dụng để thay executable và leo thang

Service object permissions — quyền service bị cấu hình sai cho phép attacker sửa thuộc tính dịch vụ, thêm user, chiếm tài khoản

Pivoting — vượt tường lửa bằng cách pivot qua hệ thống đã bị chiếm để tiếp cận các hệ thống khác

Privilege escalation qua NFS misconfiguration — NFS (port 2049)

- `nmap -sV <ip>` để kiểm tra NFS
- `sudo apt-get install nfs-common`
- `showmount -e`
- `mkdir /tmp/nfs`
- `sudo mount -t nfs <server>:/share /tmp/nfs`

Bypass User Account Control (UAC) — Metasploit, memory injection, FodHelper registry key, Eventvwr registry, COM handler hijacking

Escalation bằng lạm dụng bước khởi động/đăng nhập:

- Logon script (Windows) — chèn script qua registry key `HKEY_CURRENT_USER\Environment\UserInitMprLogonScript`
- Logon script (macOS) — login hooks
- Network logon scripts — phân phát qua AD GPOs
- RC scripts (Unix) — chèn binary độc hại trong `rc.local` hoặc tương tự
- Startup items (macOS) — `/Library/StartupItems`

Thay đổi Group Policy để leo thang — sửa `ScheduledTasks.xml` bằng script, ví dụ `New-GPOImmediateTask`

Domain trust modification — dùng utility `domain_trusts` để thu thập thông tin domain tin cậy

DCSync attack — lấy hash mật khẩu của domain controllers khác bằng cách có tài khoản có quyền domain replication (mimikatz `lsadump::dcsync /domain:<domain> /user:Administrator`)

Privilege escalation qua Active Directory Certificate Services (ADCS) — tấn công hạ tầng PKI; công cụ: Certipy

Các kỹ thuật leo thang khác:

- Access Token manipulation
- Parent PID spoofing
- Application shimming
- Filesystem permission weakness
- Path interception
- Abusing accessibility features
- SID-History injection
- COM hijacking
- Scheduled tasks (Windows: Task Scheduler; Linux: cron)
- Launch Daemon (macOS `launchd`)
- plist modification (macOS)
- Setuid/Setgid (Linux/macOS)
- Web shell
- Abusing sudo rights
- Abusing SUID/SGID permissions (Unix)
- Abusing '.' path
- Abusing macOS elevation mechanisms
- Process injection via `ptrace`
- Abusing Microsoft Software Installer (MSI)
- Abusing Windows Filtering Platform (WFP) — NoFilter attack

Privilege escalation tools:

- BeRoot
- pwncat
- PowerSploit
- Traitor
- PEASS-ng
- FullPowers

Bảo vệ chống DLL/Dylib hijacking:

- Dependency Walker
- Dylib Hijack Scanner

## Maintaining access

Backdoors — thiết lập hoán vị truy cập, duy trì cửa sau để truy cập trái phép

Crackers — bẻ mã hoặc mật khẩu

Keyloggers — ghi lại phím bấm

Spyware — chụp screenshot, ghi thông tin v.v.

Remote code execution (RCE) techniques —

- Exploitation để thực thi code trên client
  - Web-browser based exploitation — nhắm trình duyệt qua spear phishing
  - Office-application based exploitation — khai thác qua tài liệu Office
