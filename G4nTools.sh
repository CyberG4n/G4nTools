#!/bin/bash

# Auto-Update Script
latest_version=$(curl -s https://raw.githubusercontent.com/CyberG4n/G4nTools/main/G4nTools.sh | md5sum | cut -d ' ' -f1)
current_version=$(md5sum $0 | cut -d ' ' -f1)

if [ "$latest_version" != "$current_version" ]; then
    echo "[!] Update ditemukan! Download versi terbaru..."
    curl -o $0 https://raw.githubusercontent.com/CyberG4n/G4nTools/main/G4nTools.sh
    chmod +x $0
    echo "[+] Berhasil update! Jalankan script lagi."
    exit
fi

# ✅ Loading efek aesthetic
loading_effect() {
    echo -ne "\n\e[1;36m[+] Loading"
    for i in {1..5}; do
        echo -n "."
        sleep 0.2
    done
    echo -e "\e[0m"
}

# ✅ Menu loop
while true; do
    clear
    figlet -f slant "Arkananta" | lolcat
    echo -e "\e[1;37m               CYBERGAN\e[0m"
    echo -e "\e[1;32m────────────────────────────────────────────\e[0m"
    echo -e "\e[1;90m     Tools Launcher - Arkananta Terminal.\e[0m\n"

    echo -e "\e[1;33mSelect a tool to run:\e[0m"
    echo -e "\e[1;36m"
    echo "1. Seeker       🛰️"
    echo "2. SpamNormal   📩"
    echo "3. SpamBrutal   💣"
    echo "4. Phising      🎯"
    echo "5. Exit         ❌"
    echo -e "\e[0m"

    read -p "Enter number: " choice
    case $choice in
        1)
            loading_effect
            clear
            cd G4nTools/tools/seeker
            python3 seeker.py
            ;;
        2)
            loading_effect
            cd G4nTools/tools/spam-wa
            make run
            ;;
        3)
            loading_effect
            cd G4nTools/tools/Brutal-W4
            make run
            ;;
        4)
            loading_effect
            zphisher
            ;;
        5)
            echo -e "\n\e[1;31m[!] Exiting...\e[0m"
            break
            ;;
        *)
            echo -e "\n\e[1;31m[!] Invalid choice!\e[0m"
            sleep 1.5
            ;;
    esac

    echo -e "\n\e[1;34m[↩] Press Enter to go back to menu...\e[0m"
    read
done
