
```markdown
# Web Security Scanner en Kali Linux (VirtualBox)

Este repositorio contiene un script de escaneo de seguridad web diseñado para ser ejecutado en una máquina virtual de Kali Linux en VirtualBox. A continuación, se detallan las instrucciones para configurar y probar el script en diferentes entornos.

## Opción 1: Usar un Servidor Web Local con Apache

Si deseas simular un servidor vulnerable en tu propia máquina, puedes instalar y configurar Apache en Kali Linux.

### Pasos para Configurar Apache en Kali Linux

1. **Iniciar Apache en Kali Linux**

   ```bash
   sudo systemctl start apache2
   ```

2. **Verificar que el servidor está activo**

   ```bash
   sudo systemctl status apache2
   ```

   ✅ Debe mostrar que está "active (running)".
   ![Captura de pantalla 2025-03-11 112744](https://github.com/user-attachments/assets/83d33f05-f959-4c4c-9ec2-9a639121844d)


4. **Abrir el navegador en Kali y probar en:**

   ```
   http://127.0.0.1
   ```

   Si ves la página de Apache, significa que el servidor está funcionando.

   ![Captura de pantalla 2025-03-11 112814](https://github.com/user-attachments/assets/32e9d093-170c-4b1d-8c29-f9ef44104873)


## Opción 2: Instalar DVWA o Mutillidae para Pruebas

Si prefieres probar el script en un entorno inseguro, puedes instalar DVWA o Mutillidae, que son aplicaciones vulnerables para pentesting.

### Instalar DVWA en Kali Linux

1. **Actualizar e instalar dependencias:**

   ```bash
   sudo apt update
   sudo apt install php php-mysqli mariadb-server unzip -y
   sudo systemctl start mariadb
   sudo mysql_secure_installation
   ```

2. **Configurar MySQL y descargar DVWA:**

   ```bash
   cd /var/www/html
   sudo git clone https://github.com/digininja/DVWA.git
   sudo chown -R www-data:www-data DVWA/
   sudo systemctl restart apache2
   ```

3. **Accede en tu navegador a:**

   ```
   http://127.0.0.1/DVWA
   ```

## Ejecutar el Script en Kali Linux

1. **Descargar el script en Kali Linux:**

   ```bash
   git clone https://github.com/Drifter624/cybersecurity-portfolio.git
   cd cybersecurity-portfolio/Web-Security-Scanner
   chmod +x web-security-scan.sh
   ```

![Captura de pantalla 2025-03-11 112944](https://github.com/user-attachments/assets/4c4c74aa-5eed-4bec-bc09-fa455e49266e)


2. **Ejecutar el script contra un servidor local:**

   ```bash
   ./web-security-scan.sh http://127.0.0.1
   ```

   ✅ Esto escaneará el servidor Apache en tu Kali Linux.

   ![Captura de pantalla 2025-03-11 113032](https://github.com/user-attachments/assets/fe18bb51-47ab-4109-8ce3-2c534a8b5853)


3.(Opcional) Simular un Servidor con Vulnerabilidades

Si quieres que el script detecte más problemas, puedes agregar archivos inseguros a /var/www/html/:

echo "User-agent: *\nDisallow: /admin" | sudo tee /var/www/html/robots.txt
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/phpinfo.php

🔹 Esto simula un archivo robots.txt inseguro y una página phpinfo.php expuesta.
🔹 Ejecuta el escaneo de nuevo:

./web-security-scan.sh http://127.0.0.1

✅ Ahora el script debería detectar las rutas /robots.txt y /phpinfo.php.

![Captura de pantalla 2025-03-11 113205](https://github.com/user-attachments/assets/36904eb6-cb3f-4089-8ef7-2e8f7aed283c)


4. **O probar contra un sitio de prueba externo (Hack The Box, TryHackMe, etc.):**

   ```bash
   ./web-security-scan.sh http://testphp.vulnweb.com
   ```

   🔹 `testphp.vulnweb.com` es un sitio legítimo de pruebas de seguridad de Acunetix.

## Conclusión

- Si quieres probar en local, usa Apache en Kali Linux o instala DVWA.
- Si quieres probar en un servidor real, usa un sitio como `testphp.vulnweb.com`.

```

