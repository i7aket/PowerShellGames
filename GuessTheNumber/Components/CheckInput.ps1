# Function to check user input against the random number
function CheckInput {
    param (
        [char[]]$InputNumber,
        [char[]]$RandomNumber
    )
    $result = ""
    $randomNumberCopy = $RandomNumber.Clone()

    # // First pass: Check for exact position match
    for ($i = 0; $i -lt $InputNumber.Length; $i++) {
        if ($InputNumber[$i] -eq $randomNumberCopy[$i]) {
            $InputNumber[$i] = "A"
            $randomNumberCopy[$i] = "B"
            $result += "X"
        }
    }

    # // Second pass: Check for correct numbers but wrong positions
    for ($i = 0; $i -lt $InputNumber.Length; $i++) {
        for ($j = 0; $j -lt $InputNumber.Length; $j++)
        {
            if ($InputNumber[$i] -eq $randomNumberCopy[$j]) {
                $randomNumberCopy[$j] = "C"
                $result += "Y"
                Break
            }
        }
    }    
    
    # // Padding the result with zeros up to 4 characters
    while ($result.Length -lt 4) {
        $result += "0"
    }

    return $result
}