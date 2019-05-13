$lang = GET-WinSystemLocale | Select-Object -Expand Name

switch ($lang)
{
    'fr-FR' { $device = '*Écran tactile HID*' }
    'en-US' { $device = '*touch screen*' }
}

$status = Get-PnpDevice -FriendlyName $device | Select-Object  -Expand Status

if ($status -eq 'OK'){
    Get-PnpDevice -FriendlyName $device | Disable-PnpDevice -Confirm:$false
}else{
    Get-PnpDevice -FriendlyName $device | Enable-PnpDevice -Confirm:$false
}

Write-Host "Touch screen status changed"