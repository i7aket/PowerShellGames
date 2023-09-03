# Function to shuffle the '0' around to randomize the board
function ShuffleZero {
    param (
        [int[][]] $board,
        $shuffles = 50 
    )

    $directions = @("UpArrow", "LeftArrow", "DownArrow", "RightArrow")

    for ($n = 0; $n -lt $shuffles; $n++)  
    {
        $randomShuffle = Get-Random -Minimum 1 -Maximum 5 

        foreach ($direction in $directions) {
            for ($i = 1; $i -lt $randomShuffle; $i++) {
                $board = MoveZero -board $board -direction $direction
            }
        }
    }
    return $board
}