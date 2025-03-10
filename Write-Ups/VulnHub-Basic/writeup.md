# 🔍 Write-Up: VulnHub Basic - 
![image](https://github.com/user-attachments/assets/4fb3495f-c08e-4bcf-a521-6219525d0928)


📅 **Fecha:** 2024-03-01  
🎯 **Objetivo:** Obtener acceso root a la máquina **VulnHub Basic** y documentar el proceso.  
🛠 **Herramientas usadas:** Nmap, Gobuster, Burp Suite, Metasploit, LinPEAS  




---

## 🕵️ 1. Escaneo Inicial  

Ejecutamos un escaneo de puertos con Nmap:  
```bash
nmap -p- -sC -sV -oN nmap_scan.txt 192.168.1.100
```
📸 **Captura del escaneo:**  
![Nmap Scan](screenshots/nmap_scan.png)

---

## 🔑 2. Enumeración de Servicios  

Descubrimos que el puerto **80** está abierto con un servidor Apache. Utilizamos **Gobuster** para buscar directorios ocultos:  

```bash
gobuster dir -u http://192.168.1.100 -w /usr/share/wordlists/dirb/common.txt
```

📸 **Captura de directorios encontrados:**  
![Gobuster](screenshots/gobuster.png)

---

## 🎯 3. Explotación  

Encontramos un formulario vulnerable a **SQL Injection**, probamos con `' OR 1=1 --` y logramos acceso al sistema.  
📸 **Captura del exploit en acción:**  
![Exploit Execution](screenshots/exploit_execution.png)

---

## 🏆 4. Escalada de Privilegios  

Con **LinPEAS**, detectamos un binario SUID vulnerable:  

```bash
find / -perm -u=s -type f 2>/dev/null
```

Ejecutamos la escalada y obtenemos **acceso root.** 🎉  
📸 **Captura de root:**  
![Root Shell](screenshots/root_shell.png)

---

## 🔎 Conclusión  

- La máquina presentaba vulnerabilidades en **Apache, SQL Injection y SUID binaries**.  
- Se recomienda actualizar los permisos de usuario y proteger la base de datos con parametrización de consultas.  
- ¡Gran práctica para pentesting y CTFs! 🔥  


---



