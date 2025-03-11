📌  Versión del Script: Web Security Scanner

✅ Objetivo:
Un escáner de seguridad web genérico, que verifique la existencia de rutas comunes en servidores Apache, Nginx y otros entornos web.

✅ Características:

    📌 Detecta tecnología del servidor web (Apache, Nginx, etc.).
    📌 Busca rutas sensibles (/robots.txt, /admin, /backup, /config.php).
    📌 Comprueba métodos HTTP permitidos (GET, POST, PUT, DELETE).
    📌 Escanea encabezados de seguridad (X-Frame-Options, Content-Security-Policy).
    📌 Agrega colores para visualizar mejor la información.

📂 Estructura Recomendada en tu Repositorio

cybersecurity-portfolio/
│── README.md
│── Web-Security-Scanner/   ← 📂 Nueva carpeta para el proyecto
│   ├── web-security-scan.sh  ← 📄 Código del script
│   ├── README.md  ← 📄 Explicación del script
│   ├── screenshots/  ← 📂 Capturas de ejecución
│   │   ├── scan-example.png


📸 Ejemplo de Salida

📌 Útil para pentesters y sysadmins que quieran auditar configuraciones de seguridad web. 🚀


---



📌 **Comandos para subirlo:**  
```bash
cd cybersecurity-portfolio
git add Web-Security-Scanner/
git commit -m "Agregado Web Security Scanner en Bash"
git push origin main

🚀 Conclusión

📌 Este script te permite demostrar habilidades en seguridad web y automatización.
📌 Es más versátil que el original de WordPress, ya que analiza cualquier servidor web.
📌 Puedes mejorarlo agregando escaneos con whatweb, nikto o nmap.
