# 🔍 Write-Up: VulnHub Basic - FUSER
![420393839-9ab329b5-4fc6-43e0-81b1-c838a9ab9a2c](https://github.com/user-attachments/assets/1897d7b9-97b4-4d31-ab74-b22f84fe84c7)

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
