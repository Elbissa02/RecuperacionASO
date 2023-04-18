function menu {
	write-host ""
	write-host "===================Menú==================="
	write-host ""
	write-host "1. Obtener información de los procesadores"
	write-host "2. Obtener información de la memoria"
	write-host "3. Obtener tipo de memoria"
	write-host "4. Obtener información del disco duro"
	write-host "5. Obtener información sobre el equipo"
	write-host "6. Obtener información sobre sobre la placa base"
	write-host "7. Obtener información sobre la BIOS"
	write-host "8. Obtener información sobre la RAM"
	write-host "9. Salir"
	write-host ""
}

menu


function obtener_info {
	cls
	write-host "===> Información de los procesadores <==="
	write-host ""
	Get-WmiObject Win32_Processor
	write-host ""
}

function info_memoria {
	cls
	write-host "===> Información de la memmoria cahé <==="
	write-host ""
	Get-WmiObject Win32_MemoryArray
	write-host ""
}

function tipo_memoria {
	cls
	write-host "===> Tipo de memmoria <==="
	write-host ""
	Get-WmiObject Win32_PhysicalMemory | Select-Object MemoryType
	write-host ""
}

function disco_duro {
	cls
	write-host "===> Disco Duro <==="
	write-host ""
	Get-Disk
	write-host ""
}

function info_equipo {
	cls
	write-host "===> Información sobre el equipo <==="
	write-host ""
	Get-WmiObject Win32_ComputerSystem
	write-host ""
}

function placa_base {
	cls
	write-host "===> Información sobre la placa base <==="
	write-host ""
	Get-WmiObject Win32_BaseBoard
	write-host ""
}

function info_bios {
	cls
	write-host "===> Información sobre la BIOS <==="
	write-host ""
	Get-WmiObject Win32_BIOS
	write-host ""
}

function info_ram {
	cls
	write-host "===> Información sobre la RAM <==="
	write-host ""
	Get-WmiObject Win32_PhysicalMemory
	write-host ""
}


while (($option = Read-Host -prompt "Selecciona una de las opciones") -ne 9){
	switch ($option){
		1. {obtener_info}
		2. {info_memoria}
		3. {tipo_memoria}
		4. {disco_duro}
		5. {info_equipo}
		6. {placa_base}
		7. {info_bios}
		8. {info_ram}
		9. {"Exit";}

	}
	menu

}
