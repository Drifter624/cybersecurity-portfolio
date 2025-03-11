# Proyecto: Cracking de Contraseñas con John the Ripper en Kali Linux

## Introducción
En este proyecto, aprenderás a utilizar John the Ripper, una poderosa herramienta de cracking de contraseñas, para descifrar hashes de contraseñas. Esta es una habilidad esencial para los hackers éticos, ya que ayuda a identificar contraseñas débiles y mejorar la seguridad general. Al finalizar este proyecto, serás capaz de realizar cracking básico de contraseñas y comprender la importancia de utilizar contraseñas seguras.

## Pre-requisitos
- Conocimientos básicos sobre conceptos de hashing y cifrado.
- Familiaridad con el uso de la interfaz de línea de comandos (CLI).
- Conocimientos básicos sobre prácticas de seguridad de contraseñas.

## Configuración del Laboratorio y Herramientas
### Diagrama de Red
A continuación, se muestra un diagrama simple de la configuración del laboratorio:

```
+------------------+     +------------------+
|    Atacante     |     |     Objetivo     |
|  Kali Machine   |     |   Sistema de     |
| (192.168.1.100) |     |   la Víctima     |
|                |     | (192.168.1.101) |
+------------------+     +------------------+
```

### Herramientas
- **Kali Linux**: Distribución basada en Debian diseñada para forense digital y pruebas de penetración.
- **John the Ripper**: Rápido cracker de contraseñas incluido en Kali Linux.
- **Archivos de hashes**: Archivos de ejemplo con hashes de contraseñas para realizar las pruebas.

### Instalación
John the Ripper viene preinstalado en Kali Linux. Para verificar la instalación o actualizarlo, usa el siguiente comando:

```bash
sudo apt-get update && sudo apt-get install john
```

## Tareas

### Tarea 1: Cracking Básico de Contraseñas
1. Crea un archivo de texto llamado `passwords.txt` con hashes de contraseñas. Por ejemplo:
   ```bash
   echo '$1$KpixtOtB$VVujBpNkbVnv1BjlBJl6S/' > passwords.txt
   ```
2. Ejecuta John the Ripper para descifrar las contraseñas:
   ```bash
   john passwords.txt
   ```
3. **Salida esperada**: John the Ripper comenzará el proceso de cracking y eventualmente mostrará las contraseñas descifradas.

### Tarea 2: Uso de un Diccionario Personalizado
1. Crea un diccionario de palabras llamado `wordlist.txt`:
   ```bash
   echo -e "password\n123456\nletmein\nqwerty" > wordlist.txt
   ```
2. Ejecuta John the Ripper usando el diccionario personalizado:
   ```bash
   john --wordlist=wordlist.txt passwords.txt
   ```
3. **Salida esperada**: John the Ripper utilizará el diccionario para descifrar las contraseñas.

### Tarea 3: Cracking de Hashes del Archivo Shadow
1. Obtén un archivo shadow con hashes de contraseñas (asegúrate de tener permisos adecuados).
2. Extrae los hashes en un nuevo archivo:
   ```bash
   unshadow /etc/passwd /etc/shadow > shadow_hashes.txt
   ```
3. Ejecuta John the Ripper:
   ```bash
   john shadow_hashes.txt
   ```
4. **Salida esperada**: Se mostrarán las contraseñas descifradas.

### Tarea 4: Cracking en Modo Incremental
1. Ejecuta John the Ripper en modo incremental para realizar un ataque de fuerza bruta:
   ```bash
   john --incremental passwords.txt
   ```
2. **Salida esperada**: Se irán mostrando las contraseñas descifradas a medida que se encuentren.

### Tarea 5: Cracking con Reglas
1. Usa John the Ripper con un enfoque basado en reglas:
   ```bash
   john --rules passwords.txt
   ```
2. **Salida esperada**: John aplicará reglas predefinidas y mostrará contraseñas descifradas.

### Tarea 6: Análisis de Contraseñas Descifradas
1. Una vez descifradas las contraseñas, analiza los patrones comunes:
   ```bash
   john --show passwords.txt
   ```
2. **Salida esperada**: Se mostrará un listado con todas las contraseñas descifradas y sus hashes correspondientes.

## Recursos Adicionales
- [Documentación de John the Ripper](https://www.openwall.com/john/)
- [Documentación de Kali Linux](https://www.kali.org/docs/)
- [Prácticas recomendadas de seguridad de contraseñas](https://www.cyber.gov.au/acsc/view-all-content/publications/creating-and-managing-passwords)

## Conclusión
Este proyecto te permitirá comprender el proceso de cracking de contraseñas con John the Ripper en Kali Linux, destacando la importancia de políticas de contraseñas seguras y algoritmos de hashing robustos.

