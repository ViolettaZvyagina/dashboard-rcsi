$content5 = Get-Content 'chapter6-5.html' -Raw -Encoding UTF8
$startMarker = '<svg xmlns:svg='
$endMarker = '</svg>'
$startIdx = $content5.IndexOf($startMarker)
if ($startIdx -ge 0) {
    $endIdx = $content5.IndexOf($endMarker, $startIdx)
    if ($endIdx -gt $startIdx) {
        $svg = $content5.Substring($startIdx, $endIdx - $startIdx + 7)
        $content6 = Get-Content 'chapter6-6.html' -Raw -Encoding UTF8
        $placeholder = '              <!-- SVG будет добавлен через JavaScript -->'
        $newContent = $content6.Replace($placeholder, $svg)
        [System.IO.File]::WriteAllText((Resolve-Path 'chapter6-6.html'), $newContent, [System.Text.Encoding]::UTF8)
        Write-Host "SVG inserted successfully"
    } else {
        Write-Host "End marker not found"
    }
} else {
    Write-Host "Start marker not found"
}

