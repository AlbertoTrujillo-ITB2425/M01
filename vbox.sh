while true; do
    echo "Selecciona una opcio:"
    echo "1) Llistar máquines"
    echo "2) Mostrar info W11"
    echo "3) Mostrar info Ubuntu"
    echo "4) Arrancar Ubuntu"
    echo "5) Arrancar W11"
    echo "6) Poweroff Ubuntu"
    echo "7) Poweroff W11"
    echo "8) Exportar Ubuntu"
    echo "9) Exportar W11"
    echo "10) Sortir"
    
    read -p "Opcio: " opcion
    
    case $opcion in
        1) 
            VBoxManage list vms
            echo "Se han listado todas las máquinas disponibles en VBox."
            ;;
        2) 
            VBoxManage showvminfo AlbertoW11
            echo "Aquí tienes la información de la máquina W11."
            ;;
	3)  VBoxManage showvminfo AlbertoUbuntu
	    echo "Aqui tens l'informacio de la maquina Ubuntu"
	    ;;

        4)  VBoxManage startvm AlbertoUbuntu --type headless
	    echo "!La maquina Ubuntu es troba en marcha!"
            ;;
        5)  VBoxManage startvm AlbertoW11 --type headless
            echo "¡La máquinas W11 es troba  en marcha!"
            ;;
       
	6)  VBoxManage controlvm AlbertoUbuntu poweroff
            echo "La maquina ubuntu s'ha tancat"
	    ;;
       
        7)  VBoxManage controlvm AlbertoW11 poweroff
            echo "La maquina W11 a sigut apagada."
            ;;
	8)  VBoxManage export AlbertoUbuntu --output /home/alberto.trujillo.7e6/Escriptori/DADES/Alberto/OVA/AlbertoUbuntu1.ova
            echo "Ubuntu a sigut exportat"
            ;;

        9)  VBoxManage export AlbertoW11 --output /home/alberto.trujillo.7e6/Escriptori/DADES/Alberto/OVA/AlbertoW11_1.ova
            echo "W11 a sigut exportat."
            ;;
        10)
            echo "Saliendo..."
            break
            ;;
        *) 
            echo "Opción no válida. Por favor, selecciona una opción del 1 al 10."
            ;;
    esac
done
