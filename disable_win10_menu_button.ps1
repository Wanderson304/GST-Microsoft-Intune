# Executar como administrador
# Desativa o acesso ao menu iniciar via política de registro

Write-Output "Aplicando restrições ao menu Iniciar..."

# Caminho da chave de política
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Cria o caminho, se não existir
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Define o valor de desabilitar menu iniciar
New-ItemProperty -Path $regPath -Name "NoStartMenuMorePrograms" -PropertyType DWord -Value 1 -Force
New-ItemProperty -Path $regPath -Name "NoStartMenuMFUprogramsList" -PropertyType DWord -Value 1 -Force
New-ItemProperty -Path $regPath -Name "LockedStartLayout" -PropertyType DWord -Value 1 -Force

Write-Output "Alterações aplicadas. Reinicie o Explorer ou o sistema para ver efeito."
