Function Create-Asset {param($AssetName) [Environment]::SetEnvironmentVariable('asset', $AssetName, 'Machine')}
Set-Alias -Name asset -Value Create-Asset