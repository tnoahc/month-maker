Add-Type -AssemblyName System.Windows.Forms

# Create a Folder Browser Dialog
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select the folder where monthly directories will be created"

# Show the dialog and check if the user selected a folder
if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $targetPath = $folderBrowser.SelectedPath  # Get selected folder path

    # Define the start and end date for 2025
    $start = Get-Date "01/01/2025"
    $end = Get-Date "12/31/2025"
    $current = $start
    $counter = 1

    # Loop through each month and create folders
    while ($current -le $end) {
        $month = "{0:00} {1}" -f $counter, $current.ToString("MMMM")  # Format: "01 January"
        $fullPath = Join-Path -Path $targetPath -ChildPath $month  # Create full directory path

        # Create the folder if it doesn't exist
        if (-not (Test-Path -Path $fullPath)) {
            New-Item -ItemType Directory -Path $fullPath | Out-Null
        }

        # Move to the next month
        $current = $current.AddMonths(1)
        $counter++
    }

    # Show a confirmation message
    [System.Windows.Forms.MessageBox]::Show("Monthly directories have been created in `"$targetPath`".", "Success", "OK", "Information")
} else {
    Write-Host "No folder was selected. Script terminated."
}
