#!/bin/bash

# Web Security Scanner
# Autor: Drifter624
# GitHub: https://github.com/Drifter624/cybersecurity-portfolio

clear
echo ""
echo "============================================"
echo " 🚀 Web Security Scanner "
echo "============================================"
echo ""

# Verifica si se ha proporcionado una URL
if [[ -z "$1" ]]; then
    echo -e "❌ \e[31mERROR: Debes ingresar una URL.\e[0m"
    echo -e "💡 Uso: ./web-security-scan.sh http://example.com"
    exit 1
fi

url=$1

echo -e "\e[33m 🔍 Escaneando $url...\e[0m"
sleep 1

# 📌 Detectar el servidor web
server=$(curl -sI "$url" | grep -i "Server:" | cut -d " " -f2-)
if [[ -n "$server" ]]; then
    echo -e "🌍 \e[32mServidor detectado: $server\e[0m"
else
    echo -e "🌍 \e[31mNo se pudo detectar el servidor\e[0m"
fi

# 📌 Comprobar encabezados de seguridad
echo -e "\n🔐 \e[33mVerificando encabezados de seguridad...\e[0m"
headers=("X-Frame-Options" "Content-Security-Policy" "X-XSS-Protection" "Strict-Transport-Security")

for header in "${headers[@]}"; do
    result=$(curl -sI "$url" | grep -i "$header")
    if [[ -n "$result" ]]; then
        echo -e "✅ \e[32m$header encontrado: $result\e[0m"
    else
        echo -e "❌ \e[31m$header no encontrado\e[0m"
    fi
done

# 📌 Comprobar rutas sensibles
echo -e "\n📂 \e[33mBuscando rutas sensibles...\e[0m"
paths=("/robots.txt" "/admin" "/backup" "/config.php" "/phpinfo.php" "/.git" "/.env")

for path in "${paths[@]}"; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url$path")
    if [ "$response" == "200" ]; then
        echo -e "✅ \e[32mEncontrado: $url$path\e[0m"
    else
        echo -e "❌ \e[31mNo encontrado: $url$path\e[0m"
    fi
done

# 📌 Comprobar métodos HTTP permitidos
echo -e "\n📡 \e[33mAnalizando métodos HTTP permitidos...\e[0m"
methods=$(curl -sI -X OPTIONS "$url" | grep -i "Allow:" | cut -d " " -f2-)
if [[ -n "$methods" ]]; then
    echo -e "📌 \e[32mMétodos permitidos: $methods\e[0m"
else
    echo -e "❌ \e[31mNo se pudieron obtener los métodos HTTP\e[0m"
fi

echo -e "\n✅ \e[32mEscaneo completado.\e[0m"

