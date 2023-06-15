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
	./scripthardware.ps1
}

if ($option -eq 2 ){
	./scriptred.ps1
}

if ($option -eq 3 ){
	./scriptdominio.ps1
}

if ($option -eq 4 ){
	./scriptprocesos.ps1
}

if ($option -eq 5 ){
	./scriptservicios.ps1
}

if ($option -eq 6){
	exit
}

menu
}



menu
