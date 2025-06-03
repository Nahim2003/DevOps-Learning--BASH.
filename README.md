# DevOps-Learning--BASH.
Welcome to my Bash scripting project! This repository documents my journey through a self-paced scripting module that guided me from fundamental shell operations to advanced scripting challenges. Each level helped me build practical, real-world automation and system administration skills.

---

## 🚀 What You'll Find

This project includes scripts covering:

### 📁 File & Directory Operations
- Create and manage directories/files
- Write and read file content via scripts

### 🔢 Arithmetic & Input
- Perform basic arithmetic (add, subtract, multiply, divide)
- Validate user input from the terminal

### 🔄 Loops & Conditionals
- Loop through data with `for`
- Use `if`, `else`, and `case` to guide logic

### ⚙️ Functional Scripts
- Backup `.txt` files with rotation
- Monitor directories for changes in real time
- Parse `.conf` files and display values
- Sort files by size
- Search `.log` files for keywords

### 🧭 Interactive Menus
- User-friendly CLI menus to select system utilities:
  - Disk usage
  - System uptime
  - File backups
  - Config parsing

---

## 🧠 Skills Gained

- Shell scripting fundamentals and structure
- Real-world task automation
- Backup rotation logic
- Menu-driven interaction with `read` and `case`
- File parsing, filtering, and permission checking
- Command chaining and conditional execution

---

## 📂 Example Script List

| Script | Description |
|--------|-------------|
| `file_ops.sh` | Create a directory, file, write to it, and display contents |
| `basic_math.sh` | Perform arithmetic operations on user input |
| `backup_rotate.sh` | Backup directory and keep the last 5 backups |
| `monitor_dir.sh` | Real-time directory change monitoring with `inotifywait` |
| `config_parser.sh` | Read `KEY=VALUE` pairs from a config file |
| `system_menu.sh` | Interactive menu for system tasks |
| `boss_battle_3.sh` | Full-featured system utility combining all major tasks |

---

## 📌 How to Run

Make a script executable:

```bash
chmod +x script_name.sh
./script_name.sh
