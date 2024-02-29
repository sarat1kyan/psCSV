param (
    [string]$csvFilePath = "path_to_csv_files",
    [string]$logFilePath = "path_to_logfile"
)
function LogMessage {
    param(
        [string]$message,
        [string]$severity
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$severity] $message"
    Write-Host $logEntry
    Add-Content -Path $logFilePath -Value $logEntry
}
if (-not (Test-Path $csvFilePath)) {
    LogMessage "CSV file not found at $csvFilePath." "Error"
    exit 1
}
try {
    $certificateMappings = Import-Csv -Path $csvFilePath
} catch {
    LogMessage "Failed to read CSV file. $_" "Error"
    exit 1
}
foreach ($mapping in $certificateMappings) {
    $username = $mapping.Username
    $certificateFilePath = $mapping.CertificateFilePath
    if (-not (Test-Path $certificateFilePath)) {
        LogMessage "Certificate file not found for user $username at $certificateFilePath." "Warning"
        continue
    }
    if (-not ($certificateFilePath -like "*.cer")) {
        LogMessage "Invalid certificate file format for user $username" "Error"
        continue
    }
    $userExists = Get-WmiObject Win32_UserAccount -Filter "Name='$username'"
    if (-not $userExists) {
        LogMessage "User $username not found. Skipping certificate installation." "Warning"
        continue
    }
    try {
        Import-Certificate -FilePath $certificateFilePath -CertStoreLocation Cert:\CurrentUser\My -ErrorAction Stop
        LogMessage "Certificate for user $username installed successfully." "Info"
    } catch {
        LogMessage "Failed to install certificate for user $username. $_" "Error"
    }
}
