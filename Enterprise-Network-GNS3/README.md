
# 🏢 Enterprise Network Simulation in GNS3  

📌 **Descripción:**  
Este proyecto simula una red empresarial para **CompanyXYZ (DAEMONTECH PFT)** utilizando **GNS3**. La red incluye:  
✅ Planta Principal (**LAN corporativa**)  
✅ **Centro de datos (DC)** con servidores críticos  
✅ **Zona DMZ** con servidores públicos  
✅ **Enrutadores perimetrales e ISP** para conexión externa  
✅ **Firewall Cisco ASAv** para seguridad perimetral  

## 📜 **Lista de Partes del Proyecto**  
🔹 **[Parte 1: Introducción](Docs/Network-Design.md)**  
🔹 **[Parte 2: Capa de acceso](Configs/core-switch.cfg)**  
🔹 **[Parte 3: Distribución y capa central](Configs/edge-router.cfg)**  
🔹 **[Parte 4: Firewall Cisco ASAv](Configs/firewall-dmz.cfg)**  
🔹 **[Parte 5: Centro de datos (DC)](Docs/datacenter-config.md)**  
🔹 **[Parte 6: Enrutador perimetral e ISP](Configs/isp-router.cfg)**  
🔹 **[Parte 7: DMZ y seguridad](Docs/dmz-design.md)**  

## 📷 **Topología de la Red**  
![Network Topology](Screenshots/topology-diagram.png)  

## 🛠 **Tecnologías Usadas**  
🔹 **GNS3** → Simulación de red  
🔹 **Cisco IOS y ASAv** → Routers, switches y firewall  
🔹 **Linux (Ubuntu, pfSense)** → Servidores internos y seguridad  
🔹 **DMZ y VLANs** → Segmentación de la red  

## 📂 **Cómo Usar este Proyecto**  
1️⃣ **Descargar GNS3**: [https://www.gns3.com/](https://www.gns3.com/)  
2️⃣ **Importar el archivo del proyecto GNS3** desde `GNS3-Project/`  
3️⃣ **Configurar las imágenes de Cisco ASAv y routers**  
4️⃣ **Ejecutar los dispositivos y probar conectividad**  

## 🏁 **Conclusión**  
Este proyecto demuestra la implementación de una red empresarial **segura y escalable** con GNS3. Se enfocó en **diseño seguro, segmentación con VLANs y protección con firewalls**.  

📌 **Si te sirvió, ⭐ dale un Star al repositorio!** 🚀  
