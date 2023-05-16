function menu {
	write-host ""
	write-host "===================Menú==================="
	write-host ""
	write-host "1. Conocer el nombre del equipo"
	write-host "2. Saber si tu equipo pertenece a un grupo de trabajo o a un dominio"
	write-host "3. Cambiar el nombre del equipo"
	write-host "4. Salir"
}
menu

function nombre_equipo {
	cls
	write-host "===> Nombre del equipo <==="
	write-host ""
	hostname
	write-host ""
}

function dominio_o_grupo {
	cls
	write-host "===> Dominio | Grupo de trabajo <==="
	write-host ""
	Get-WmiObject -Class Win32_ComputerSystem | Select-Object Domain, Workgroup
	write-host ""
}

function nuevo_nombre {
	cls
	write-host "==> Una vez puesto el nombre, el equipo se reiniciará por si solo <=="
	write-host ""
	$nuevo = read-host -prompt "Introduce el nuevo nombre del equipo"
	write-host ""
	Rename-Computer -NewName $nuevo -Restart
	write-host ""
}


while (($option = Read-Host -prompt "Selecciona una de las opciones") -ne 4){
	switch ($option){
		1. {nombre_equipo}
		2. {dominio_o_grupo}
		3. {nuevo_nombre}
		4. {"Exit";}

	}
	menu

}
