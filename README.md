# Month Maker
This PowerShell script generates a series of directories representing each month of the year 2025. Here's how it works:  

- It initializes the start date as January 1, 2025 (`$start`) and the end date as December 31, 2025 (`$end`).  
- A loop runs from the start date until the end date, incrementing by one month at a time.  
- The `$counter` variable is used to number each month sequentially from `01` to `12`.  
- For each iteration, a folder is created in the format `XX, MonthName` (e.g., `01, January`, `02, February`, etc.).  
- The script uses `New-Item -ItemType Directory` to create these folders in the current directory.  

This script is useful for organizing files by month in a structured way.
### How to Use the Script
1. Download `month-maker.ps1` script to the location you want to generate the directories.
2. Right click and **Run with PowerShell**
