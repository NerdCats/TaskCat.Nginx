Copy-Item -force $PSScriptRoot\nginx.conf c:\nginx\conf\

$nginx = Get-Process nginx -ErrorAction SilentlyContinue
if ($nginx) {
    $CMD = 'C:\nginx\nginx.exe'
    $arg1 = '-s'
    $arg2 = 'reload'
    & $CMD $arg1 $arg2
    # wait five seconds
    Sleep 5
}
else {
    $CMD = 'start'
    $arg1 = 'C:\nginx\nginx.exe'
    & $CMD $arg1
}

Remove-Variable nginx