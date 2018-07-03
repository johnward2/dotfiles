./windows/install-chocolatey # Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install programs with chocolatey
foreach ($line in Get-Content windows/choco-programs.txt) {
    choco install $line
}

$env:Path += ";C:\Program Files\Microsoft VS Code" # register the new "code" command

# install vscode extensions
foreach ($line in Get-Content vscode/extensions.txt) {
    code --install-extension $line
}

mkdir "$env:APPDATA/Code/"
mkdir "$env:APPDATA/Code/User/"

# configure vscode
Copy-Item "vscode/settings.json" -Destination "$env:APPDATA/Code/User/settings.json"

mkdir "$env:APPDATA/Terminus/"

# configure terminus
Copy-Item "windows/terminus/config.yaml" -Destination "$env:APPDATA/Terminus/config.yaml"

# Enter bash and execute playbook with "-t windows"