#!/bin/bash

ARENA_DIR="Arena"
BACKUP_DIR="Arena_Backups"
CONFIG_FILE="settings.conf"

function check_disk_space() {
    echo -e "\n📊 Disk Space:"
    df -h
}

function show_uptime() {
    echo -e "\n⏱️ System Uptime:"
    uptime
}

function backup_arena() {
    mkdir -p "$BACKUP_DIR"
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
    tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$ARENA_DIR" . 2>/dev/null && echo "✅ Backup created: $BACKUP_NAME"

    # Keep only last 3 backups
    cd "$BACKUP_DIR" || exit
    ls -1t backup_*.tar.gz | tail -n +4 | xargs -r rm -f
    cd - >/dev/null
}

function parse_config() {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "⚠️ Config file '$CONFIG_FILE' not found."
        return
    fi

    echo -e "\n📄 Parsed Config Values:"
    while IFS='=' read -r key value; do
        [[ -z "$key" || "$key" =~ ^# ]] && continue
        echo "$key = $value"
    done < "$CONFIG_FILE"
}

# Interactive menu loop
while true; do
    clear
    echo "🧠 Boss Battle 3 - System Utility Menu"
    echo "--------------------------------------"
    echo "1) Check disk space"
    echo "2) Show system uptime"
    echo "3) Backup Arena directory (keep last 3)"
    echo "4) Parse settings.conf"
    echo "5) Exit"
    echo "--------------------------------------"
    read -p "Choose an option [1-5]: " choice

    case $choice in
        1) check_disk_space ;;
        2) show_uptime ;;
        3) backup_arena ;;
        4) parse_config ;;
        5)
            echo "👋 Exiting. Well done, warrior!"
            exit 0
            ;;
        *) echo "⚠️ Invalid option. Try 1–5." ;;
    esac

    echo -e "\nPress Enter to return to the menu..."
    read
done

