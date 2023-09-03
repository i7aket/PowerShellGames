
# Main game loop
while ($gameRunning) {
    if ($debugMode -eq $true) {
        Write-Host $Number
    }

    # Inner loop for guessing numbers
    while (-not $guessed) {
        do {
            Write-Host "Enter a number with $Length digits:" -NoNewline
            $userInputNumber = Read-Host
        } while (-not (ValidateInput -InputNumber $userInputNumber -Length $Length))

        $userInputArray = $userInputNumber.ToCharArray()
        $comparisonResult = CheckInput -InputNumber $userInputArray -RandomNumber $Number

        Write-Host "$userInputNumber : $comparisonResult " -NoNewline
    
        if ($comparisonResult -eq "XXXX") {
            Write-Host "Congratulations! You've guessed the number!"
            $guessed = $true
        }
    }

    # Ask the user if they want to continue playing
    $continueGame = Read-Host "Would you like to play again? (y/n)"
    if ($continueGame -ne 'y') {
        $gameRunning = $false
    } else {
        InitGame  # Re-initialize game parameters if the user wants to continue
    }
}
