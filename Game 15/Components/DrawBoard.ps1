# Function to draw the game board
function DrawBoard {
    param (
        [int[][]] $board
    )
    # Clear the console
    Clear-Host
    Write-Host "+----+----+----+----+"

    # Draw each line of the board
    foreach ($line in $board) {
        Write-Host -NoNewline "| "
        foreach ($el in $line) {
            if ($el -eq 0) {
                Write-Host -NoNewline "   | "
            }
            elseif ($el -lt 10) {
                Write-Host -NoNewline "$el  | "
            }
            else {
                Write-Host -NoNewline ("{0} | " -f $el)
            }
        }
        Write-Host ""
        Write-Host "+----+----+----+----+"
    }
}