Copy-Item -force $PSScriptRoot\nginx.conf c:\nginx\conf\
Copy-Item -force $PSScriptRoot\*.bat c:\nginx\

$nginx = Get-Process nginx -ErrorAction SilentlyContinue
if ($nginx) {
    $CMD = 'C:\nginx\reload.bat'
    start-process $CMD
}
else {
    $CMD = 'C:\nginx\start.bat'
    start-process $CMD
}