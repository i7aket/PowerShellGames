# Function to generate a random number with a given length
function Get_RandomNumber {
    param (
        [int]$Min = 0,
        [int]$Max = 9,
        [int]$Length = 4
    )
    $result = @()
    for ($i = 0; $i -lt $Length; $i++) {
        $randomNumber = Get-Random -Minimum $Min -Maximum ($Max + 1)
        $result += [char]("$randomNumber"[0])
    }
    return $result
}