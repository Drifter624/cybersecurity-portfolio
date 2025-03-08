#!/bin/bash

# Script de automatización de reconocimiento con Nmap + Nikto
# Autor: Drifter624
# GitHub: https://github.com/Drifter624/cybersecurity-portfolio

# Verificar argumentos
if [ "$#" -lt 1 ]; then
    echo "Uso: $0 <IP o dominio> [modo]"
    echo "Modos disponibles: "
    echo "  - fast   (Escaneo rápido - solo puertos comunes)"
    echo "  - full   (Escaneo completo - todos los puertos)"
    exit 1
fi

TARGET=$1
MODE=${2:-fast}  # Si no se proporciona modo, usa 'fast'
OUTPUT_DIR="recon_$TARGET"

# Crear directorio de resultados
mkdir -p $OUTPUT_DIR

# Obtener IP si se proporciona un dominio
if [[ $TARGET =~ [a-zA-Z] ]]; then
    IP=$(host $TARGET | grep "has address" | awk '{print $4}' | head -n 1)
    echo "🌍 Dominio detectado: $TARGET | IP: $IP"
else
    IP=$TARGET
fi

# Ejecutar escaneo Nmap según el modo
echo "🔍 Iniciando escaneo con Nmap en modo: $MODE"
if [ "$MODE" == "fast" ]; then
    nmap -F -oN $OUTPUT_DIR/nmap_fast_scan.txt $IP
elif [ "$MODE" == "full" ]; then
    nmap -p- -sC -sV -oN $OUTPUT_DIR/nmap_full_scan.txt $IP
else
    echo "Modo inválido. Usa 'fast' o 'full'."
    exit 1
fi

# Opción para escanear HTTP con Nikto si el puerto 80 o 443 está abierto
if grep -qE "80/open|443/open" $OUTPUT_DIR/nmap_*.txt; then
    echo "🌍 Puerto HTTP/HTTPS detectado. Iniciando escaneo con Nikto..."
    nikto -h http://$TARGET -o $OUTPUT_DIR/nikto_scan.txt
fi

echo "✅ Escaneo completado. Resultados guardados en $OUTPUT_DIR/"
