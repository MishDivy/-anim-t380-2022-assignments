Function Create-Asset {
    param($AssetName, $AssetType, $ProjectDir)
    [Environment]::SetEnvironmentVariable('asset', $AssetName, 'Machine')
    [Environment]::SetEnvironmentVariable('assetType', $AssetType, 'Machine')
    [Environment]::SetEnvironmentVariable('project', $ProjectDir, 'Machine')
}
Set-Alias -Name asset -Value Create-Asset