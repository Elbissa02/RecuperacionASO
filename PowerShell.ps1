function menu {
	write-host ""
	write-host "======> Menu <======"
	write-host "1. Obtener información del hardware"
	write-host "2. Gestion de red"
	write-host "3. Dominio"
	write-host "4. Proceso"
	write-host "5. Servicios"
	write-host "6. Salir"

$option = read-host "Seleccione una de las opciones"

if ($option -eq 1 ){
	./hardware.ps1
}

if ($option -eq 2 ){
	./red.ps1
}

if ($option -eq 3 ){
	./dominio.ps1
}

if ($option -eq 4 ){
	./procesos.ps1
}

if ($option -eq 5 ){
	./servicios.ps1
}

if ($option -eq 6){
	exit
}

menu
}



menu
