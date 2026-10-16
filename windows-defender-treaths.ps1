function Get-Past-Threats {
    $directory = "C:\Program Files\project anti virus"
    $outputPath = "$directory\windowsdefenderthreats.csv"

    # Ensure the target directory exists before writing to it
    if (-not (Test-Path -Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
    }

    # Export as a structured CSV (with -NoTypeInformation to keep it clean)
    Get-MpThreat | Export-Csv -Path $outputPath -NoTypeInformation -Encoding utf8
}

Get-Past-Threats
