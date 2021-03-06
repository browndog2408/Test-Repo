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

service 'gupdate' do
action [:disable, :stop]
end

service 'gupdatem' do
action [:disable, :stop]

end

powershell_script 'Disable IE Enhanced Security' do
code '$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}";$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}";Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0;Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0;Stop-Process -Name Explorer'   
guard_interpreter :powershell_script
not_if "(Test-Path $chocolateyBin) -eq $false"

end
