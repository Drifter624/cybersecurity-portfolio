
## **📌- Simulación y Defensa contra Phishing**  

```md
# 🎭 Simulación y Defensa contra Phishing con Kali Linux  

📌 **Descripción**  
Este proyecto demuestra cómo **crear, ejecutar y defenderse contra ataques de phishing** usando **Kali Linux y Gophish**. Aprenderás a simular ataques para concienciar sobre la ingeniería social y mejorar la seguridad organizacional.  

⚠️ **Este proyecto es solo para fines educativos. No realices pruebas en sistemas sin autorización.**  

---

## **🛠️ Lab Set-up y Herramientas**  

### 📌 **Arquitectura del Laboratorio**  
```
+------------------+        +------------------+
|   Attacker       |  ----> |  Victim          |
|  (Kali Linux)    |        |  (Target Machine)|
|  192.168.1.100   |        |  192.168.1.101   |
+------------------+        +------------------+
```

### 🔧 **Herramientas Utilizadas**  
✅ **Kali Linux** → Distribución especializada en pentesting.  
✅ **Gophish** → Plataforma de phishing para pruebas y educación.  
✅ **Servidor Web** → Para alojar páginas falsas de phishing (Apache, Nginx).  
✅ **Cliente de Email** → Para enviar correos phishing a las víctimas.  

---

## **📌 Instalación de Gophish en Kali Linux**  
### **1️⃣ Descargar Gophish**  
```bash
wget https://getgophish.com/gophish-vX.X.X-linux-64bit.tar.gz
tar -xvzf gophish-vX.X.X-linux-64bit.tar.gz
cd gophish
```
### **2️⃣ Ejecutar Gophish**  
```bash
sudo ./gophish
```
✅ **Accede a la interfaz web:** `https://localhost:3333`  
🔹 **Usuario:** `admin`  
🔹 **Contraseña:** `gophish`  

---

## **📌 Tareas del Proyecto**  

### **📧 Task 1: Configurar una Campaña de Phishing**  
📌 **Pasos:**  
1️⃣ Acceder a `https://localhost:3333` con Gophish.  
2️⃣ Crear un **grupo de usuarios objetivo** con direcciones de email.  
3️⃣ Diseñar una **plantilla de email phishing** con HTML.  
4️⃣ Crear una **landing page** para capturar credenciales.  
5️⃣ Configurar una **campaña de phishing** con los elementos anteriores.  

✅ **Salida esperada:** Campaña de phishing lista para ejecutarse.  

---

### **🚀 Task 2: Lanzar la Campaña de Phishing**  
📌 **Ejemplo de Email Phishing (HTML)**  
```html
<html>
Dear User,  
We hemos detectado actividad sospechosa en su cuenta.  
Por favor, verifique su información haciendo clic en el siguiente enlace:  

<a href="http://malicious-site.com">Verificar Cuenta</a>  

Si no verifica su cuenta en 24 horas, será bloqueada.  
Gracias,  
Soporte Técnico  
</html>
```
✅ **Salida esperada:** Email convincente enviado a los objetivos.  

---

### **📊 Task 3: Analizar Resultados del Ataque**  
📌 **Después de lanzar la campaña, revisar los resultados:**  
```bash
tail -f gophish.log
```
🔹 **Analizar qué usuarios cayeron en el ataque.**  
🔹 **Revisar credenciales capturadas en la landing page.**  

✅ **Salida esperada:** Reporte detallado de usuarios que hicieron clic y enviaron credenciales.  

---

### **🛡️ Task 4: Defensa Contra Phishing**  
📌 **Medidas para prevenir ataques de phishing:**  
✅ **Educar a los usuarios** → Identificación de correos sospechosos.  
✅ **Filtrado de emails** → Bloqueo de dominios fraudulentos.  
✅ **Habilitar MFA** → Protección adicional contra accesos no autorizados.  
✅ **Actualización de software** → Parcheo de vulnerabilidades explotables.  

✅ **Salida esperada:** Organización más resiliente contra ataques de phishing.  

---

### **📅 Task 5: Implementar un Programa de Concientización**  
📌 **Plan de defensa proactiva:**  
1️⃣ **Simular campañas regularmente con Gophish.**  
2️⃣ **Hacer entrenamientos de seguridad con los empleados.**  
3️⃣ **Monitorizar tendencias en ataques de phishing.**  

✅ **Salida esperada:** Reducción de la tasa de clics en ataques de phishing.  

---

## **📚 Recursos Adicionales**  
📌 **[Gophish Documentation](https://getgophish.com/)**  
📌 **[Anti-Phishing Working Group](https://apwg.org/)**  
📌 **[Phishing Defense Guide](https://www.ncsc.gov.uk/phishing-guidance)**  

---

## **📌 Conclusión**  
🎯 **Este proyecto enseña cómo ejecutar y defenderse de ataques de phishing.**  
💡 **Aprendimos a crear campañas reales para educar y fortalecer la seguridad.**  
📌 **Implementar medidas como MFA y filtrado de emails reduce el riesgo de ataques exitosos.**  


---

