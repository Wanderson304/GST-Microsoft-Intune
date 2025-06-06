#Script PowerShell – Ativar Menu Iniciar (Modo Silencioso)

# Caminho da chave de política
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Verifica se a chave existe e remove as políticas, se presentes
If (Test-Path $regPath) {
    Remove-ItemProperty -Path $regPath -Name "NoStartMenuMorePrograms" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regPath -Name "NoStartMenuMFUprogramsList" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regPath -Name "LockedStartLayout" -ErrorAction SilentlyContinue
}

# Reinicia o Windows Explorer silenciosamente
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Process explorer.exe
