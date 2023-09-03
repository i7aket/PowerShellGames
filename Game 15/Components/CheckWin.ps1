# Function to check if the player has won
function CheckWin {
    param (
        [int[][]] $board,
        [int[][]] $winBoard
    )
    for ($r = 0; $r -lt $board.Length; $r++) {
        for ($c = 0; $c -lt $board[$r].Length; $c++) {
            if ($board[$r][$c] -ne $winBoard[$r][$c]) {
                return $false
            }
        }
    }
    return $true
}