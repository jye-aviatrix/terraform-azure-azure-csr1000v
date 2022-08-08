# terraform-azure-azure-csr
In specified Azure region, create a Cisco CSR1000v BYOL router. 
Allow ping from RFC1918. Allow SSH from your egress public IP.


Bootstrap CSR reference:
https://www.cisco.com/c/en/us/td/docs/routers/csr1000/software/azu/b_csr1000config-azure/b_csr1000config-azure_chapter_01011.pdf

https://github.com/csr1000v/customdata-examples

Following example will enable Loopback adapter 1 and configure static IP: 192.168.100.100/24
Configuration will be writen in startup-config

```
custom_data=<<EOT
Section: IOS configuration
interface lo1
ip address 192.168.100.100 255.255.255.0
EOT
```