# Initialize the game board
$script:board = @((1,2,3,4),(5,6,7,8),(9,10,11,12),(13,14,15,0))  
$script:winBoard = @((1,2,3,4),(5,6,7,8),(9,10,11,12),(13,14,15,0)) 

# Shuffle the board for the initial state
$script:board = ShuffleZero -board $script:board  

# Clear the console and draw the initial board
Clear-Host
DrawBoard $script:board  
