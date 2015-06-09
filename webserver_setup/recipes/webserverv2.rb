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

