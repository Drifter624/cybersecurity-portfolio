# 🔍 Write-Up: VulnHub Basic - FUSER

📅 **Fecha:** 2024-03-07
🎯 **Objetivo:** Obtener acceso root a la máquina **VulnHub Basic** y documentar el proceso.  
🛠 **Herramientas usadas:** 

Escaneo de Puertos
CUPS (CVE-2024-47176)
Escalada de Privilegios Dash (SUID)

---

## 🕵️ 1. Escaneo Inicial  

Ejecutamos un escaneo de puertos con Nmap:  
```bash
nmap -p- -sC -sV -oN nmap_scan.txt 192.168.1.100
