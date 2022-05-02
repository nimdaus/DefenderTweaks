try {
    [int]$OSBuild = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty CurrentBuild
    $MPstatus = Get-MpComputerStatus
    if (
        ($OSBuild -ge 7601 -and $OSBuild -le 14393) -and `
        $OSProductName -notmatch 'Windows 10' -and `
        $MPstatus.Antivirusenabled -eq $true -and `
        $MPstatus.AMServiceEnabled -eq $true -and `
        $MPstatus.AntispywareEnabled -eq $true -and `
        $MPstatus.BehaviorMonitorEnabled -eq $true -and `
        $MPstatus.IoavProtectionEnabled -eq $true -and `
        $MPstatus.NISEnabled -eq $true
    )
        {
        Add-MpPreference -AttackSurfaceReductionRules_Ids 56a863a9-875e-4185-98a7-b882c64b5ce5 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids d4f940ab-401b-4efc-aadc-ad5f3c50688a `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids be9ba2d9-53ea-4cdc-84e5-9b1eeee46550 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 01443614-cd74-433a-b99e-2ecdc07bfc25 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 5beb7efe-fd9a-4556-801d-275e5ffc04cc `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids d3e037e1-3eb8-44c8-a917-57927947596d `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 3b576869-a4ec-4529-8536-b80a7769e899 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 26190899-1602-49e8-8b27-eb1d0a1ce869 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids e6db77e5-3df2-4cf1-b95a-636979351e5b `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids d1e49aac-8f56-4280-b9ba-993a6d77406c `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids c1db55ab-c21a-4637-bb3f-a12568109d35 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Add-MpPreference -AttackSurfaceReductionRules_Ids 56a863a9-875e-4185-98a7-b882c64b5ce5 `
        -AttackSurfaceReductionRules_Actions AuditMode
        Set-MpPreference -EnableNetworkProtection AuditMode
        }
    Write-Host "ASR Rules Set"
} catch {
  Write-Warning "Failed to enable ASR ruleset"
}