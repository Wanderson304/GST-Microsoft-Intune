# Importa o módulo do Active Directory (necessário executar em um ambiente com RSAT instalado)
Import-Module ActiveDirectory

# Obtém todos os computadores do AD
$computers = Get-ADComputer -Filter * -Properties userCertificate

# Cria uma tabela com o nome do computador e se a propriedade userCertificate está vazia ou não
$results = $computers | Select-Object Name, @{Name="UserCertificatePresent";Expression={ if ($_.userCertificate) { $true } else { $false } }}

# Exibe os resultados em formato de tabela
$results | Format-Table -AutoSize

# Caso queira jogar o resultado para um arquivo .csv descomente a linha 14.
#Será gerado um arquivo chamado UserCertificateReport.csv na pasta C:\
#$results | Export-Csv -Path "C:\UserCertificateReport.csv" -NoTypeInformation -Encoding UTF8
