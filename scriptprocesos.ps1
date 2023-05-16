function menu {
	write-host "==========> Menú <=========="
	write-host ""
	write-host "1. Ver todos los procesos ordenados de mayor a menor consumo de memoria"
	write-host "2. Mostrar un proceso indicando su nombre"
	write-host "3. Mostrar información detallada de un proceso ademas de poder finalizar el proceso"
	write-host "4. Salir"
}
menu

function ver_procesos {
	cls
	write-host "===> Ver Procesos <==="
	write-host ""
	Get-Process | Sort-Object WorkingSet -Descending
	write-host ""
}

function proceso_especifico {
	cls
	write-host "===> Mostrar un proceso indicando su nombre <==="
	write-host ""
	$proceso = read-host -prompt "Indica el nombre del proceso"
	write-host ""
	Get-Process $proceso
	write-host ""
}

function info_detallada {
	cls
	write-host "===> Estos son todos los procesos <==="
	write-host ""
	Get-Process
	write-host ""
	$proceso = read-host -prompt "Indica el nombre de algun proceso si desea más información"
	write-host ""
	if ($proceso) {
		$proceso_info = Get-Process -Name $proceso -ErrorAction SilentlyContinue
		if ($proceso_info) {
			$proceso_info | Format-Table Id, Name, CPU, WorkingSet -AutoSize
			$proceso = read-host "Si desea finalizar el proceso seleccione 'Si'"
			if ($proceso -eq "Si") {
				Stop-Process $proceso_info
			}
		} else {
		    Write-host "No hay ningun proceso con este nombre '$proceso'"
		  }
	}
}



while (($option = Read-Host -prompt "Selecciona una de las opciones") -ne 4){
	switch ($option){
		1. {ver_procesos}
		2. {proceso_especifico}
		3. {info_detallada}
		4. {"Exit";}

	}
	menu

}
