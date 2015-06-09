powershell_script 'Change Timezone' do

code 'tzutil /s "Eastern Standard Time"'
guard_interpreter :powershell_script
not_if "$timezone = tzutil /g; $timezone -eq 'Eastern Standard Time'"

end

powershell_script 'Install Chocolatey' do

code "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
guard_interpreter :powershell_script
not_if "$chocolateyBin = [Environment]::GetEnvironmentVariable('ChocolateyInstall', 'Machine') + '\bin' ; (Test-Path $chocolateyBin'\cinst.exe') = $true"

end

powershell_script 'Install Classic Shell' do
code '$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin\cinst.exe"; & $chocolateyBin classic-shell -y'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end

powershell_script 'Install Chrome' do
code '$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin\cinst.exe"; & $chocolateyBin googlechrome -y'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end

powershell_script 'Install Firefox' do
code '$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin\cinst.exe"; & $chocolateyBin firefox -y'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end

powershell_script 'Install Winrar' do
code '$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin\cinst.exe"; & $chocolateyBin winrar -y'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end

powershell_script 'Install Notepad++' do
code '$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin\cinst.exe"; & $chocolateyBin notepadplusplus -y'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end

powershell_script 'Install Javaruntime' do
code '$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin\cinst.exe"; & $chocolateyBin javaruntime -y'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end

powershell_script 'Install Silverlight' do
code '$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin\cinst.exe"; & $chocolateyBin silverlight -y'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end
