Copy-Item -force $PSScriptRoot\nginx.conf c:\nginx\conf\
Copy-Item -force $PSScriptRoot\*.bat c:\nginx\

$nginx = Get-Process nginx -ErrorAction SilentlyContinue
if ($nginx) {
    $CMD = 'C:\nginx\reload.bat'
    start-process $CMD
    # wait five seconds
    Sleep 5
}
else {
    $CMD = 'C:\nginx\start.bat'
    start-process $CMD
}

Remove-Variable nginx