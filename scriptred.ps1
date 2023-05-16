function menu {
	write-host ""
	write-host "===================Menú==================="
	write-host ""
	write-host "1. Mostrar las interfaces de red detectadas"
	write-host "2. Mostrar solo las interfaces de red activas"
	write-host "3. Seleccionar una interfaz indicando su nombre"
	write-host "4. Establecer configuración por DHCP"
	write-host "5. Establecer configuración estaticamente"
	write-host "6. Establecer configuración estaticamente indicando servidores DNS"
	write-host "7. Salir"
	write-host ""

}
menu

function interfaces_detectadas{
	cls
	write-host "===> Interfaces de red detectadas <==="
	write-host ""
	Get-NetAdapter
	write-host ""
}

function interfaces_activas {
	cls
	write-host "===> Interfaces de red activas <==="
	write-host ""
	Get-NetAdapter | Where-Object {$_.Status -eq "UP"}
	write-host ""
}

function interfaz_nombre {
	cls
	write-host "===> Interfaz indicada por su nombre <==="
	write-host ""
	$nombre = read-host -prompt "Introduce el nombre de la interfaz "
	write-host ""
	Get-NetAdapter | Where-Object {$_.Name -eq $nombre}
	write-host ""
}

function conf_dhcp {
	cls
	write-host ""
	$interfaz = read-host -prompt "Introduce el nombre de la interfaz"
	write-host ""
	Set-NetIPInterface -InterfaceAlias $interfaz -DHCP Enabled
	write-host ""
}

function conf_estaticamente {
	cls
	write-host ""
	$interfaz = read-host -prompt "Introduce el nombre de la interfaz"
	write-host ""
	$ip = read-host -prompt "Introduce la dirección IP"
	write-host ""
	$mascara = read-host -prompt "Introduce la mascara de red"
	write-host ""
	$puerta = read-host -prompt "Introduce la puerta de enlace"
	write-host ""
	New-NetIPAddress -InterfaceAlias $interfaz -IPAddress $ip -PrefixLength $mascara -DefaultGateway $puerta
	write-host "" 
}

function conf_estaticamente_dns {
	cls
	write-host ""
	$interfaz = read-host -prompt "Introduce el nombre de la interfaz"
	write-host ""
	$servidordns = read-host -prompt "Indica el Servidor DNS"
	write-host ""
	Set-DnsClientServerAddress -InterfaceAlias $interfaz -ServerAddresses $servidordns
	write-host ""
	
}


while (($option = Read-Host -prompt "Selecciona una de las opciones") -ne 7  ){
	switch ($option){
		1. {interfaces_detectadas}
		2. {interfaces_activas}
		3. {interfaz_nombre}
		4. {conf_dhcp}
		5. {conf_estaticamente}
		6. {conf_estaticamente_dns}
		7. {"Exit";}
	}
	menu

}
