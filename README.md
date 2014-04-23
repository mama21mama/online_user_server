online user server
==================

Cuenta las IP de todos los puertos con conexiones establecidas
quedando luego usuarios concurrentes.


$./online



Con screen

$screen bash /home/mama/scripts/online

retomamos

$ps aux | grep online

$screen -rS < pid >




Al inicio del sistema (Debian)

$nano /etc/rc.local

su myuser -c "screen bash /home/mama/scripts/online &"
exit 0
