# Laboratorio Oski - CyberDefenders

## Descripción
Este laboratorio de CyberDefenders, llamado **Oski**, consiste en analizar un archivo malicioso (malware) para entender su comportamiento, identificar sus técnicas de ataque y descubrir cómo opera. El objetivo es responder a una serie de preguntas relacionadas con el análisis del malware, utilizando herramientas como **VirusTotal** y **ANY.RUN**.

## Herramientas utilizadas
- **VirusTotal**: Para analizar el archivo malicioso y obtener información sobre su comportamiento y conexiones.
- **ANY.RUN**: Para ejecutar el malware en un entorno seguro (sandbox) y observar su comportamiento en tiempo real.

## Resolución del laboratorio

### **Pregunta 1**: ¿Cuál fue la hora de creación del malware?
- **Respuesta**: El malware fue creado el **2022-09-28 a las 17:40**.
- **Procedimiento**: 
  - Se subió el archivo a **VirusTotal**.
  - En la pestaña **Details**, se encontró la fecha y hora de creación del archivo.

![Captura de pantalla 2025-03-09 201029](https://github.com/user-attachments/assets/9ba2e07b-b205-4e41-90c5-87186349f3d9)

![Captura de pantalla 2025-03-09 201054](https://github.com/user-attachments/assets/253db4ee-889f-42b2-952f-318e65e4874d)



### **Pregunta 2**: ¿Con qué servidor C2 se comunica el malware del archivo PPT?
- **Respuesta**: El servidor de mando y control (C2) es **http://171.22.28.221**.
- **Procedimiento**:
  - En **VirusTotal**, en la pestaña **Relations**, se identificaron las conexiones del malware.
  - El malware se comunica con el servidor **http://171.22.28.221** y descarga archivos como **5c06c05b7b34e8e6.php** y **sqlite3.dll**.

![Captura de pantalla 2025-03-09 201316](https://github.com/user-attachments/assets/cc513411-77ed-43e1-97ad-b250085b33d5)


### **Pregunta 3**: ¿Cuál es la primera biblioteca que solicita el malware tras la infección?
- **Respuesta**: La primera biblioteca que solicita el malware es **sqlite3.dll**.
- **Procedimiento**:
  - En **VirusTotal**, se observó que el malware descarga la biblioteca **sqlite3.dll** desde el servidor C2.
  - Esta biblioteca es utilizada para almacenar datos en bases de datos SQLite, probablemente para mantener persistencia o almacenar información robada.

![Captura de pantalla 2025-03-09 201402](https://github.com/user-attachments/assets/088da524-acd5-48ef-9fec-bfbe1a7329c5)


### **Pregunta 4**: ¿Qué clave RC4 específica utiliza este malware?
- **Respuesta**: La clave RC4 utilizada es **5329514621441247975720749009**.
- **Procedimiento**:
  - Se utilizó la herramienta **ANY.RUN** para analizar el comportamiento del malware.
  - En la sección **CFG (Configuration)**, se encontró la clave RC4 que el malware utiliza para cifrar y descifrar datos.


### **Pregunta 5**: ¿Qué técnica ATT&CK de MITRE están empleando para robar la contraseña de un usuario?
- **Respuesta**: La técnica utilizada es **T1555.003 – Credentials from Web Browsers**.
- **Procedimiento**:
  - En **ANY.RUN**, en la sección **ATT&CK Matrix**, se identificó que el malware utiliza la técnica **T1555.003** para robar credenciales almacenadas en navegadores web.

![image](https://github.com/user-attachments/assets/c02a28ed-7f47-45e3-b385-a7ec2e23925d)


### **Pregunta 6**: ¿A qué directorio o ruta apunta el malware para su eliminación?
- **Respuesta**: El malware se autoelimina de las siguientes rutas:
  - **C:\Users\admin\AppData\Local\Temp\VPN.exe**
  - **C:\ProgramData\*.dll**
- **Procedimiento**:
  - En **ANY.RUN**, se observó que el malware ejecuta el siguiente comando para autoeliminarse:
    ```bash
    "C:\Windows\system32\cmd.exe" /c timeout /t 5 & del /f /q "C:\Users\admin\AppData\Local\Temp\VPN.exe" & del "C:\ProgramData\*.dll" & exit
    ```
  - Este comando elimina el archivo ejecutable original y todos los archivos DLL en el directorio **C:\ProgramData**.

![image](https://github.com/user-attachments/assets/85753cc6-e9f4-48e7-8467-28f60b3df345)


### **Pregunta 7**: ¿Cuántos segundos tarda el malware en autoeliminarse después de extraer los datos del usuario?
- **Respuesta**: El malware tarda **5 segundos** en autoeliminarse.
- **Procedimiento**:
  - En el comando de autoeliminación observado en **ANY.RUN**, se utiliza el comando `timeout /t 5`, que hace que el malware espere 5 segundos antes de eliminarse.



## Resumen del laboratorio
En este laboratorio, analizamos un archivo malicioso que se comunica con un servidor de mando y control (C2) para robar credenciales de usuarios. Utilizamos herramientas como **VirusTotal** y **ANY.RUN** para identificar:
- La fecha de creación del malware.
- El servidor C2 con el que se comunica.
- Las bibliotecas que descarga (como **sqlite3.dll**).
- La clave RC4 que utiliza para cifrar datos.
- Las técnicas de ataque, como **T1555.003** de MITRE ATT&CK.
- El comportamiento de autoeliminación del malware después de robar datos.

Este análisis demuestra cómo el malware puede operar de manera sigilosa y cómo herramientas de análisis pueden ayudar a desentrañar sus técnicas.

---

**Nota**: Este laboratorio es un excelente ejemplo de cómo el malware moderno utiliza técnicas avanzadas para evadir la detección y cómo los analistas de seguridad pueden utilizar herramientas como **VirusTotal** y **ANY.RUN** para entender y contrarrestar estas amenazas.
