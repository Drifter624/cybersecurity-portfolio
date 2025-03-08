


```md
# 🔍 Automated Nmap & Nikto Scan  

Este script en **Bash** automatiza el escaneo de seguridad utilizando **Nmap y Nikto**, detectando automáticamente si el objetivo es un **dominio o una IP**.  

## 🚀 Modo de Uso  
```bash
./advanced_nmap_scan.sh <IP o dominio> [modo]
```
Ejemplos:  
```bash
./advanced_nmap_scan.sh scanme.nmap.org fast
./advanced_nmap_scan.sh 192.168.1.1 full
```

## 🛠️ Características del Script  
✅ **Modo rápido (`fast`) y completo (`full`)** para personalizar el escaneo.  
✅ **Detecta automáticamente si el objetivo es un dominio o una IP.**  
✅ **Si detecta HTTP/HTTPS (puertos 80 o 443), ejecuta Nikto automáticamente.**  
✅ **Guarda todos los resultados organizados en una carpeta para fácil análisis.**  

## 📂 Ejemplo de Resultados Generados  
Después de ejecutar el script, se creará una carpeta con los resultados:  

```
recon_scanme.nmap.org/
│── nmap_fast_scan.txt
│── nmap_full_scan.txt
│── nikto_scan.txt
```

📌 **Ejemplo de salida en terminal:**  
```bash
🔍 Iniciando escaneo con Nmap en modo: fast
🌍 Dominio detectado: scanme.nmap.org | IP: 45.33.32.156
🌍 Puerto HTTP/HTTPS detectado. Iniciando escaneo con Nikto...
✅ Escaneo completado. Resultados guardados en recon_scanme.nmap.org/
```

## 🛠 Dependencias  
Este script requiere las siguientes herramientas instaladas en tu sistema:  

📌 **Para instalar Nmap y Nikto en Linux:**  
```bash
sudo apt update && sudo apt install nmap nikto -y
```
📌 **Para instalar en macOS con Brew:**  
```bash
brew install nmap nikto
```

## 📌 Mejoras Futuras  
🚀 Agregar **WhatWeb** para detectar tecnologías web.  
🚀 Integración con **Shodan API** para obtener información de servicios expuestos.  
🚀 Exportar reportes en **formato HTML/PDF** para análisis detallado.  

