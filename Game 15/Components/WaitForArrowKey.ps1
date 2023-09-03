# Function to wait for an arrow key press
function WaitForArrowKey {
    Write-Host "Press an arrow key..."
    do {
        $keyInfo = [console]::ReadKey($true)
    } while ($keyInfo.Key -notin "UpArrow", "DownArrow", "LeftArrow", "RightArrow")

    return $keyInfo.Key
}