# Check if the Windows Defender service is running
$service = Get-Service -Name "WinDefend"
if ($service.Status -ne "Running") {
    # Return non-zero exit code if the service is not running
    exit 1
}

# Get the Windows Defender definitions
$mpDefs = Get-MpPreference | Select-Object -ExpandProperty SignatureDefinitions

# Check if the definitions are up to date
if ($mpDefs.SignatureOutOfDate) {
    # Return non-zero exit code if the definitions are out of date
    exit 1
}

# Return zero exit code if the definitions are up to date
exit 0
