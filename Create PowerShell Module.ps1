$ModuleName = 'DaDBAuditRefresh'
$Destination = New-Item -ItemType Directory -Path "C:\WorkArea\Modules\$ModuleName"

# Template path is the folder with the template XML
Invoke-Plaster -TemplatePath 'C:\WorkArea\PlasterTemplate-master' -DestinationPath $Destination
