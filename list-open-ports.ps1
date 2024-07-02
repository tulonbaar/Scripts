# Get all enabled Inbound rules
$InboundRules = Get-NetFirewallRule | Where-Object { $_.Enabled -eq 'True' -and $_.Direction -eq 'Inbound' } | Get-NetFirewallPortFilter

# Get all enabled Outbound rules
$OutboundRules = Get-NetFirewallRule | Where-Object { $_.Enabled -eq 'True' -and $_.Direction -eq 'Outbound' } | Get-NetFirewallPortFilter

# Display Inbound open ports
Write-Host "Inbound Open Ports:"
$InboundRules | ForEach-Object {
    if ($_.LocalPort -ne "Any") {
        Write-Host "Protocol: $($_.Protocol) Port: $($_.LocalPort)"
    }
}

# Add a separator for clarity
Write-Host "--------------------------------"

# Display Outbound open ports
Write-Host "Outbound Open Ports:"
$OutboundRules | ForEach-Object {
    if ($_.RemotePort -ne "Any") {
        Write-Host "Protocol: $($_.Protocol) Port: $($_.RemotePort)"
    }
}