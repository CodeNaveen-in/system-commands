# Week 2

## Command Line Editors
### Using `ed` 
- `ed` is a popular line editor
  - open the manual for the ed command
  - `ed test.txt` - start the file
  - `P`  - began to accept line no to display
  - `*1` - will give first line
  - `*,p` - will give all the lines
  - `/hello/` - will check the pattern in all the lines
  - `*w` - will add the line to the file
  - `a` - append the data to the line
  - `m` - used to move the line.
  - `%` - used to apply to all the lines
### Using `nano`
- `nano` and `pico ` are some powerful terminal line editors.
- Open the editor with `nano <filename>`
- Add your data and then save the file
### Using `Vi`
- Super popular
- Can be used to do precise and massivge editing
- Command mode `Esc`
- Insert Mode `IOAioa`
- Exiting `wxq`
- Copy `y`
- Paste `p`
- Undo `u`
- See line number `se nu`

## Networking Commands
- IPv4 address 
  - Localhost
  - Private network
  - Public network
- Ways to get access
  - VPN Access
  - ssh tunneling
  - Commercial - Teamviewer and Anydesk
- Some important ports
  - 21 - ftp
  - 22 - ssh
  - 25 - smtp
  - 80 - http
  - 443 - https
  - 631 - cups
  - 5506 - mysql
- Firewall controls the access of a system or device.
- Process Sandboxing is also a way to keep system safe.
- Even on ubuntu we can use commands like `ls -lZ` and `ps -eZ`
- `ping` - to see whether the remote system is online or not
- `nslookup` - Ask for conversion of IP address to name
- High Performance Computing is used with the linux.