# Define the start date as January 1, 2025
$start = Get-Date "01/01/2025"

# Define the end date as December 31, 2025
$end = Get-Date "12/31/2025"

# Initialize the current date variable to the start date
$current = $start

# Initialize a counter to number the months sequentially
$counter = 1

# Loop through each month of the year 2025
while ($current -le $end) {
    # Format the month as "XX, MonthName" (e.g., "01, January")
    $month = $counter.ToString("00") , $current.ToString("MMMM")

    # Create a directory with the formatted month name
    New-Item -ItemType Directory -Path ".\$month"

    # Move to the next month
    $current = $current.AddMonths(1)

    # Increment the counter for the next month
    $counter++
}
