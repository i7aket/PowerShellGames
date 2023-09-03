# Function to move the '0' based on the arrow key direction
function MoveZero {
    param (
        [int[][]] $board,
        [string] $direction
    )

    $row = $null
    $col = $null

    # Find the position of '0'
    for ($r = 0; $r -lt $board.Length; $r++) {
        for ($c = 0; $c -lt $board[$r].Length; $c++) {
            if ($board[$r][$c] -eq 0) {
                $row = $r
                $col = $c
                break
            }
        }
        if ($row -ne $null) {
            break
        }
    }

    # Swap '0' based on the direction
    switch ($direction) {
        "UpArrow" {
            if ($row -gt 0) {
                $board[$row][$col], $board[$row-1][$col] = $board[$row-1][$col], $board[$row][$col]
            }
        }
        "DownArrow" {
            if ($row -lt $board.Length - 1) {
                $board[$row][$col], $board[$row+1][$col] = $board[$row+1][$col], $board[$row][$col]
            }
        }
        "LeftArrow" {
            if ($col -gt 0) {
                $board[$row][$col], $board[$row][$col-1] = $board[$row][$col-1], $board[$row][$col]
            }
        }
        "RightArrow" {
            if ($col -lt $board[0].Length - 1) {
                $board[$row][$col], $board[$row][$col+1] = $board[$row][$col+1], $board[$row][$col]
            }
        }
    }
    return $board
}