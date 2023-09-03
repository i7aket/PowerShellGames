while ($true) {
    # Wait for the user's arrow key input
    $arrowKey = WaitForArrowKey  

    # Move the '0' based on user input
    $script:board = MoveZero -board $script:board -direction $arrowKey  

    # Draw the updated board
    DrawBoard $script:board  

    # Check if the board matches the winning configuration
    if (CheckWin -board $script:board -winBoard $script:winBoard) {
        Write-Host "Congratulations, you won! Start a new game? (y/n)"
        $response = Read-Host
        if ($response -eq "y") {
            # Reshuffle the board for the new game
            $script:board = ShuffleZero -board $script:winBoard
            DrawBoard $script:board  
        } else {
            Write-Host "Thanks for playing!"
            break
        }
    }
}
