# Function to validate user input for length and digits only
function ValidateInput {
    param (
        [string]$InputNumber,
        [int]$Length = 4
    )
    if ($InputNumber.Length -eq $Length -and $InputNumber -notmatch "\D") {
        return $true
    } else {
        return $false
    }
}
