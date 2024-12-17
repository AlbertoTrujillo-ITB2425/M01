# Un script per fer monitoritzar el sistema cada 3 minuts en una distrubicio AWS Linux

        #!/bin/bash

        # Crear logs

        touch cpu_usage.log
        touch gpu_usage.log
        touch mem_usage.log
        touch swap_usage.log
        touch disk_usage.log

        # Crear log general

        touch sistema.log

        # Monitoritzar sistema

        while true
        do
        # Aquí podríeu fer altres monitoritzacions afegint-vos aquí
        # Com a exemple, monitoritzar el sistema general
        echo "Sistema general: $(uptime -p | awk '{print $2}')" >> sistema.log
        sleep 3m

        # Monitoritzar processos

        # Processos actius
        while true
        do
        process_count=$(ps -ef | wc -l)
        echo "Processos actius: $process_count" >> sistema.log
        sleep 3m
        done >> sistema.log 
        
        # Monitoritzar memòria RAM + SWAP 

        # Memòria RAM
        while true
        do
        mem_usage=$(free -m | grep Mem | awk '{print $3/$2 * 100.0}')
        echo "Memòria RAM Usage: $mem_usage%" >> mem_usage.log
        sleep 3m

        # SWAP
        swap_usage=$(free -m | grep Swap | awk '{print $3/$2 * 100.0}')
        echo "SWAP Usage: $swap_usage%" >> swap_usage.log
        sleep 3m
        done >> sistema.log

        # Monitoritzar processos

        # Processos actius
        while true
        do
        process_count=$(ps -ef | wc -l)
        echo "Processos actius: $process_count" >> sistema.log
        sleep 3m
        done >> sistema.log 
        
        # Monitoritzar CPU + GPU

        # CPU
        while true
        do
            cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
            echo "CPU Usage: $cpu_usage" >> cpu_usage.log
            sleep 3m
            done >> sistema.log
        
        # GPU
        while true
        do
            gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
            echo "GPU Usage: $gpu_usage%" >> gpu_usage.log
            sleep 3m
            done >> sistema.log

        # Monitoritzar disc durable

        # Espai de disc durable
        while true
        do
            disk_usage=$(df -h / | awk 'NR==2{print $5}')
            echo "Espai de disc durable: $disk_usage" >> disk_usage.log
            sleep 3m
            done >> sistema.log
        done
        done