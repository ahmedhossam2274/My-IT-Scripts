# ==========================================
# Script Name: Windows System Cleaner
# Description: Flushes DNS, clears temp files, and optimizes system storage.
# Author: IT Administrator
# ==========================================

Write-Host "Starting System Maintenance..." -ForegroundColor Green

# 1. Flush DNS Cache
Write-Host "[1/3] Flushing DNS Cache..." -ForegroundColor Cyan
Clear-DnsClientCache

# 2. Clean System Temp Files
Write-Host "[2/3] Cleaning System Temporary Files..." -ForegroundColor Cyan
$TempFolders = @("C:\Windows\Temp\*", "C:\Users\*\AppData\Local\Temp\*")
foreach ($Folder in $TempFolders) {
    Remove-Item -Path $Folder -Force -Recurse -ErrorAction SilentlyContinue
}

# 3. Clean Windows Update Cache
Write-Host "[3/3] Clearing Windows Update Cache..." -ForegroundColor Cyan
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "System Maintenance Completed Successfully!" -ForegroundColor Green
