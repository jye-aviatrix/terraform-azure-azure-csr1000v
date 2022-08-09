# terraform-azure-azure-csr
In specified Azure region, create a Cisco CSR1000v BYOL router. 
Allow ping from RFC1918. Allow SSH from your egress public IP.

## Subscribe to CSR BYOL in market place
To create CSR1000v router, you need to subscribe to Azure Marketplace **Cisco Cloud Services Router (CSR) 1000V** BYOL
You can launch cloud shell and run following:

```powershell
Get-AzMarketplaceTerms -Publisher "cisco" -Product "cisco-csr-1000v" -Name "17_3_3-byol" | Set-AzMarketplaceTerms -Accept
```

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