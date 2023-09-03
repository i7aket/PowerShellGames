# // Infinite loop to keep returning to the game menu
while ($true) {
    # // Clear the screen for a fresh view
    Clear-Host

    # // Initialize an empty array to hold game folder names
    $gameList = @()

    # // List all subfolders in the current directory
    $folders = Get-ChildItem -Directory

    # // Populate the game list and display available games
    Write-Host "Available games:"
    for ($i = 0; $i -lt $folders.Count; $i++) {
        $gameList += $folders[$i].Name

        # // Load the game description from a text file in the game's folder
        $description = Get-Content -Path "$($folders[$i].FullName)\description.txt" -ErrorAction SilentlyContinue
        if ($null -eq $description) {
            $description = "No description available."
        }

        Write-Host ("[" + ($i + 1) + "] " + $folders[$i].Name + " - " + $description)
    }

    # // Add exit option
    Write-Host "[0] Exit"

    # // Ask the user to select a game
    $selection = Read-Host "Enter the number of the game you want to play"

    # // Clear the screen for the next action
    Clear-Host

    # // Check if the user wants to exit
    if ($selection -eq '0') {
        break
    }

    # // Validate the input
    if ($selection -match '^\d+$' -and [int]$selection -le $gameList.Count -and [int]$selection -gt 0) {
        # // Convert to zero-based index
        $selectedIndex = [int]$selection - 1

        # // Change to the game folder
        Set-Location -Path $gameList[$selectedIndex]

        # // Run the game script
        . .\main.ps1

        # // Return to the main game folder
        Set-Location ..
    }
    else {
        Write-Host "Invalid selection. Try again."
    }
}
