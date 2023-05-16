cls
write-host "===> Información relevante del servicio indicado <==="
write-host ""
$nombre = read-host -prompt "Indica el nombre del servicio deseado"
write-host ""
$servicio = Get-Service -Name $nombre
write-host ""

if ($servicio.Status -ne "Running") {
	$encenderservicio = read-host -prompt "¿Desea encender este servicio (Si/No)?"
	if ($encenderservicio -eq "Si") {
		Start-Service $servicio
		write-host "El servicio ya a sido iniciado"
		write-host "El estado actual es:"
                $servicio.Status
	}
} else {
	Write-Host "El servicio ya está encendido"
}

if ($nombre.StartType -ne "Automatic") { 
	$modoinicio = read-host -prompt "¿Desea cambiar el modo inicio a Automatic (Si/No)?"
	if ($modoinicio -eq "Si") {
		Set-Service $nombre -StartupType Automatic
		write-host "El servicio ha sido actualizado a Automático"
	} else {
                    Write-host "El servicio ya está en modo de inicio automático"
        }

}
