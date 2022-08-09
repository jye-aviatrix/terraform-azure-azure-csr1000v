# terraform-azure-azure-csr
In specified Azure region, create a Cisco CSR1000v BYOL router. 
Allow ping from RFC1918. Allow SSH from your egress public IP.

## Subscribe to CSR BYOL in market place
To create CSR1000v router, you need to subscribe to Azure Marketplace **Cisco Cloud Services Router (CSR) 1000V** BYOL
You can launch cloud shell and run following:

```powershell
Get-AzMarketplaceTerms -Publisher "cisco" -Product "cisco-csr-1000v" -Name "17_3_3-byol" | Set-AzMarketplaceTerms -Accept
```

## Limitation
The BYOL version supports all four CSR Technology Packages (IP Base, SEC, AppX, and AX), depending on the installed license. A valid license must be purchased from Cisco, or a Cisco partner.

Without a license installed, the BYOL version of the CSR 1000V will be completely functional and will have all features enabled. It will however be limited to a total throughput of **100 Kbps** until an evaluation license or purchased license is installed.

## Cost
Name                                                     Monthly Qty  Unit                      Monthly Cost

 azurerm_linux_virtual_machine.this
 ├─ Instance usage (pay as you go, Standard_B2ms)                 730  hours                           $60.74
 └─ os_disk
    ├─ Storage (S4)                                                 1  months                           $1.54
    └─ Disk operations                             Monthly cost depends on usage: $0.0005 per 10k operations

 azurerm_public_ip.this
 └─ IP address (static)                                           730  hours                            $2.63

 OVERALL TOTAL                                                                                         $64.90

## Bootstrap CSR reference:

https://www.cisco.com/c/en/us/td/docs/routers/csr1000/software/azu/b_csr1000config-azure/b_csr1000config-azure_chapter_01011.pdf

https://github.com/csr1000v/customdata-examples

Following example will enable Loopback adapter 1 and configure static IP: 192.168.100.100/24
Configuration will be writen in startup-config

```cli
custom_data=<<EOT
Section: IOS configuration
interface lo1
ip address 192.168.100.100 255.255.255.0
EOT
```