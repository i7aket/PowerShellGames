# Function to initialize game parameters
function InitGame {
    $script:gameRunning = $true
    $script:Length = 4
    $script:Number = Get_RandomNumber -Length $script:Length
    $script:guessed = $false
    $script:debugMode = $false 

    Write-Host "Guess the number!"
    Write-Host "A new game has started."
    Write-Host "You are tasked with guessing a randomly generated four-digit number, ranging from 0000 to 9999."
    Write-Host "After you input your guess, you will receive a clue to help you get closer to the correct number:"
    Write-Host ""
    Write-Host "If a digit in your guess is correct and is in the correct position, you will get an 'X'."
    Write-Host "If a digit is correct but is in the wrong position, you will get a 'Y'."
    Write-Host "If a digit is incorrect, you will get a '0'."
    Write-Host ""
    Write-Host "Your clue will be a string consisting of 'X', 'Y', and '0', which correspond to each digit of your guess in the same order."
    Write-Host "Your objective is to guess the correct number as quickly as possible, using these clues as guidance."

}

InitGame