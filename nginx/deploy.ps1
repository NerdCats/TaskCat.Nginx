Copy-Item -force $PSScriptRoot\nginx.conf c:\nginx\conf\

$nginx = Get-Process nginx -ErrorAction SilentlyContinue
if ($nginx) {
    & "C:\nginx\nginx.exe -s reload"
    # wait five seconds
    Sleep 5
}
else {
    & "start C:\nginx\nginx.exe"
}
Remove-Variable nginx