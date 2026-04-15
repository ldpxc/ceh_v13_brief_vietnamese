## Giới thiệu

Công cụ — Metasploit, Nmap, Hping3

TCP communication flags

| SYN | Bắt đầu kết nối TCP; cờ `SYN` ban đầu                            |
| --- | ---------------------------------------------------------------- |
| ACK | Xác nhận cờ `SYN`; được đặt trên mọi phân đoạn sau `SYN` ban đầu |
| FIN | Đóng kết nối một cách nhẹ nhàng                                  |
| RST | Buộc chấm dứt liên lạc                                           |
| PSH | Ép chuyển giao dữ liệu ngay lập tức                              |
| URG | Đánh dấu dữ liệu là ưu tiên, gửi ngoài luồng (out‑of‑band)       |

Colasoft Packet Builder

Nmap

Hping3:

```bash
hping3 -1 0.0.0.0      # ICMP ping sweep
hping3 -A 10.10.10.10 -p 80   # ACK scan trên port 80
hping3 -2 0.0.0.0 -p 80      # UDP scan port 80
hping3 10.10.10.10 -Q -p 139 # Thu thập initial sequence number
hping3 -S 10.10.10.10 -p 80 --tcp-timestamp
hping3 -8 50-60 -S 10.10.10.10 -V  # SYN scan trên port 50-60
hping3 -F -P -U 10.10.10.10 -p 80  # FIN, PSH và URG scan
hping3 -1 10.0.1.x --rand-dest -I eth0  # quét toàn subnet để tìm host sống
hping3 -9 HTTP -I eth0    # lắng nghe lưu lượng có chữ ký HTTP
hping3 -S 10.10.1.1 -a 192.168.1.254 -p 22 --flood  # syn flood tới nạn nhân
```

| Flag           | Meaning        |
| -------------- | -------------- |
| `-S`           | SYN            |
| `-A`           | ACK            |
| `-F`           | FIN            |
| `-R`           | RST            |
| `-P`           | PSH            |
| `-U`           | URG            |
| `-p`           | Port           |
| `-c`           | Packet count   |
| `-i`           | Interval       |
| `--flood`      | Max rate send  |
| `--traceroute` | TCP traceroute |

Metasploit
NetScanTools Pro — phát hiện thiết bị trên mạng

## Kỹ thuật quét để phát hiện host

Host discovery techniques:

- `nmap -sn` — chỉ phát hiện host (host discovery only).
- Quét ARP (ARP ping scan) — chỉ trong mạng nội bộ (local only): `nmap -PR 192.168.1.0/24` hoặc `nmap -sn` với ARP request (không thể dùng `hping3` cho ARP).
- UDP ping scan — `nmap -sn -PU`.
- ICMP Echo ping scan — `nmap -sn -P` (có thể điều chỉnh số lần ping với `-L` và timeout với `-T`).
- ICMP Timestamp ping — `nmap -sn -PP` (lấy thời gian hiện tại từ máy mục tiêu).
- ICMP Address mask ping — `nmap -sn -PM` (lấy subnet mask).
- TCP SYN ping — `nmap -sn -PS` (phát hiện máy ONLINE mà không tạo kết nối đầy đủ).
- TCP ACK ping — `nmap -PA` (mặc định dùng port 80; tăng khả năng vượt tường lửa).
- IP protocol ping — `nmap -sn -PO` (gửi nhiều loại probe; bất kỳ phản hồi nào cho biết host trực tuyến).

Công cụ ping sweep:

- Angry IP Scanner
- SolarWinds Engineer’s Toolset
- NetScanTools Pro
- Colasoft Ping Tool
- Advanced IP Scanner
- OpUtils
- Superscan
- Pinkie

Quét Nmap qua TOR

ARP — ánh xạ IP tới MAC trong mạng.
Ví dụ ARP scan trong Nmap: `nmap -sn -PR 192.168.1.69`.

## Port và phát hiện dịch vụ

MUST KNOW — Ports:

- Well‑known ports: 0–1023
- Registered ports: 1024–49151
- Dynamic/Private ports: 49152–65535

Các port quan trọng:

| Port number | Protocol | Transport protocol |
| ----------- | -------- | ------------------ |
| 20/21       | FTP      | TCP                |
| 22          | SSH      | TCP                |
| 23          | Telnet   | TCP                |
| 25          | SMTP     | TCP                |
| 53          | DNS      | TCP & UDP          |
| 67/68       | DHCP     | UDP                |
| 69          | TFTP     | UDP                |
| 80          | HTTP     | TCP                |
| 110         | POP3     | TCP                |
| 123         | NTP      | UDP                |
| 135         | MS RPC   | TCP                |
| 137–139     | NetBIOS  | TCP/UDP            |
| 143         | IMAP     | TCP                |
| 161/162     | SNMP     | UDP                |
| 389         | LDAP     | TCP/UDP            |
| 443         | HTTPS    | TCP                |
| 445         | SMB      | TCP                |
| 500         | ISAKMP   | UDP                |
| 514         | Syslog   | UDP/TCP            |
| 1433        | MSSQL    | TCP                |
| 3306        | MySQL    | TCP                |
| 3389        | RDP      | TCP                |
| 5060        | SIP      | UDP/TCP            |

Các kiểu quét cổng (Port scan types):

- TCP Connect / Full open scan — nếu cổng mở thì handshake thành công, nếu đóng sẽ nhận `RST`. Ví dụ: `nmap -sT -v`.
- Stealth / Half‑open (SYN) scan — chỉ gửi `SYN`, không hoàn tất handshake: `nmap -sS` (thùy chọn ít bị chú ý hơn).
- Inverse TCP scan — gửi các tổ hợp cờ TCP không chuẩn để né IDS (không hiệu quả trên Windows).
  - Xmas scan — bật `FIN`, `URG`, `PSH`: `nmap -sX` (`-sF` là FIN, `-sN` là NULL scan).
  - TCP Maimon — gửi `FIN` và `ACK`: `nmap -sM`.
  - ACK flag probe — gửi `ACK` và xem TTL/Window để ước lượng trạng thái; dùng để kiểm tra firewall.
- IDLE / IPID scan — gửi địa chỉ nguồn giả (spoof), dùng máy zombie làm trung gian: `nmap -sI zombieIP targetIP`.
- UDP scan — gửi datagram tới cổng; nếu không có phản hồi thường là mở, nếu ICMP unreachable thì đóng.
- SSDP / UPnP scan — quét dịch vụ UPnP.

Ví dụ nâng cao: `nmap -sS -A -f 172.17.15.12` có thể phân mảnh SYN scan trong khi vẫn fingerprint OS.

Scan responses:

| Flag | open                      | closed                           | Filtered                          | Unfiltered (reachable path) |
| ---- | ------------------------- | -------------------------------- | --------------------------------- | --------------------------- |
| -sT  | SYN-ACK                   | RST                              | No reply / ICMP unreachable       |                             |
| -sS  | SYN-ACK                   | RST                              | No reply / ICMP unreachable       |                             |
| -sA  |                           |                                  | No Reply                          | RST                         |
| -sI  | IPID tăng (RST từ zombie) | IPID không đổi                   | Thay đổi không rõ ràng            |                             |
| -sU  | no response               | ICMP unreachable (type 3 code 3) | other icmp unreachable / no reply |                             |
| -sN  | no response               | RST                              | ICMP                              |                             |
| -sF  | no response               | RST                              | ICMP                              |                             |
| -sX  | no response               | RST                              | ICMP                              |                             |
| -sM  | no response               | RST                              | ICMP                              |                             |

## Nmap Scan Types

| Switch | Description                     |
| ------ | ------------------------------- |
| -sA    | ACK scan                        |
| -sF    | FIN scan                        |
| -sI    | IDLE (Zombie) scan              |
| -sL    | List (DNS resolution only) scan |
| -sN    | NULL scan                       |
| -sO    | Protocol scan                   |
| -sP    | Ping scan _(cũ, nay là `-sn`)_  |
| -sR    | RPC scan                        |
| -sS    | SYN (Stealth / Half-open) scan  |
| -sT    | TCP Connect scan                |
| -sW    | Window scan                     |
| -sX    | XMAS scan                       |

## Host Discovery (Ping Types)

| Switch | Description                                |
| ------ | ------------------------------------------ |
| -PI    | ICMP Echo ping                             |
| -PS    | TCP SYN ping                               |
| -PT    | TCP ping                                   |
| -PO    | IP Protocol ping (không dùng TCP/UDP/ICMP) |

## Output Options

| Switch | Description        |
| ------ | ------------------ |
| -oN    | Normal text output |
| -oX    | XML output         |

## Timing Templates

| Switch | Description                   |
| ------ | ----------------------------- |
| -T0    | Serial — chậm nhất, paranoid  |
| -T1    | Serial — rất chậm             |
| -T2    | Serial — thận trọng           |
| -T3    | Parallel — tốc độ bình thường |
| -T4    | Parallel — nhanh              |
| -T5    | Parallel — cực nhanh          |

Hping3

## Hping3 Scan & Mode Switches

| Switch    | Description                                                                                                           |
| --------- | --------------------------------------------------------------------------------------------------------------------- |
| `-1`      | ICMP mode (ICMP ping). Ví dụ: `hping3 -1 172.17.15.12`                                                                |
| `-2`      | UDP mode. Ví dụ: `hping3 -2 192.168.12.55 -p 80`                                                                      |
| `-8`      | Scan mode (port scan). Chấp nhận single, range, hoặc `all`. Ví dụ: `hping3 -8 20-100`                                 |
| `-9`      | Listen mode. Kích hoạt khi phát hiện chữ ký. Ví dụ: `hping3 -9 HTTP -I eth0`                                          |
| `--flood` | Gửi gói nhanh nhất có thể (không hiển thị trả lời). Dùng mô phỏng DoS. Ví dụ: `hping3 -S 192.168.10.10 -p 22 --flood` |
| `-Q`      | Thu thập sequence number TCP để phân tích khả năng đoán. Ví dụ: `hping3 172.17.15.12 -Q -p 139 -s`                    |

---

## Hping3 TCP Flag Switches

| Switch | Description                      |
| ------ | -------------------------------- |
| `-F`   | Set FIN flag                     |
| `-S`   | Set SYN flag                     |
| `-R`   | Set RST flag                     |
| `-P`   | Set PSH flag                     |
| `-A`   | Set ACK flag                     |
| `-U`   | Set URG flag                     |
| `-X`   | Set Xmas (FIN + PSH + URG) flags |

Công cụ giả mạo gói (packet spoofing): Hping, Scapy, Komodia, Ettercap, Cain.

`G-zapper` — xóa cookie tracking của Google.

Phát hiện phiên bản dịch vụ (Service version discovery): `nmap -sV`.

## Phát hiện OS bằng banner grabbing

Banner grabbing chủ động (Active banner grabbing)

Xác định theo TTL (giá trị TTL thường):

- Linux: 64
- Windows: 128
- FreeBSD: 64
- OpenBSD: 255
- Cisco: 255
- Solaris: 255
- AIX: 255

Phát hiện OS với `nmap -O`.
Sử dụng Nmap Scripting Engine: `--script` hoặc `-sC`.
IPv6: `nmap -6 -O 69.69.69.69`.

## Quét vượt qua tường lửa (Scanning beyond firewall)

- Packet Fragmentation
- Source Routing
- Source Port Manipulation
- IP Address Decoy
- IP Address Spoofing
- MAC Address Spoofing
- Creating Custom Packets
- Randomizing Host Order
- Sending Bad Checksums
- Proxy Servers
- Anonymizers

Phân mảnh gói:

```
nmap -sS -t4 -A -f -v
```

Giả mạo địa chỉ IP (IP address spoofing):

```
Hping3 www.certifiedhacker.com -a 7.7.7.7
```

MIB info — cần kiểm tra.
