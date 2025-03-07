# 🔍 Write-Up: VulnHub Basic - [Nombre de la Máquina]

📅 **Fecha:** 2024-03-01  
🎯 **Objetivo:** Obtener acceso root a la máquina **VulnHub Basic** y documentar el proceso.  
🛠 **Herramientas usadas:** Nmap, Gobuster, Burp Suite, Metasploit, LinPEAS  

---

## 🕵️ 1. Escaneo Inicial  

Ejecutamos un escaneo de puertos con Nmap:  
```bash
nmap -p- -sC -sV -oN nmap_scan.txt 192.168.1.100
