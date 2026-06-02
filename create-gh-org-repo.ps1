$token = Read-Host -AsSecureString 'Enter GitHub PAT with org repo permissions'
$b = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($token))
$body = @{name='Sogand-Khoune'; description='Music project from local workspace'; private=$false} | ConvertTo-Json
try {
    Invoke-RestMethod -Uri 'https://api.github.com/orgs/Yasin-Music-Production/repos' -Method Post -Headers @{Authorization = "token $b"; 'User-Agent'='PowerShell'} -Body $body -ContentType 'application/json' | ConvertTo-Json
} catch {
    Write-Host 'ERROR:' $_.Exception.Response.StatusCode.Value__ $_.Exception.Response.StatusDescription
    if ($_.Exception.Response -and $_.Exception.Response.RawContent) {
        Write-Host $_.Exception.Response.RawContent
    }
}
