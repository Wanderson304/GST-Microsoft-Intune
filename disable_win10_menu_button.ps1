
#Script PowerShell – Desativar o Menu Iniciar (Modo Silencioso)

# Caminho da chave de política
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Cria a chave se não existir
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Define as políticas para restringir o menu Iniciar
New-ItemProperty -Path $regPath -Name "NoStartMenuMorePrograms" -PropertyType DWord -Value 1 -Force -ErrorAction SilentlyContinue
New-ItemProperty -Path $regPath -Name "NoStartMenuMFUprogramsList" -PropertyType DWord -Value 1 -Force -ErrorAction SilentlyContinue
New-ItemProperty -Path $regPath -Name "LockedStartLayout" -PropertyType DWord -Value 1 -Force -ErrorAction SilentlyContinue

# Reinicia o Windows Explorer de forma silenciosa
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Process explorer.exe
