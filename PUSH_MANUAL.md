# 🚀 Manuelles Push zu GitHub

## Option 1: Mit Script (Token-basiert)

```bash
cd /home/atakan/memoryguard

# Token von https://github.com/settings/tokens (Berechtigung: repo)
export GITHUB_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxx"
./push.sh
```

## Option 2: Manuell (SSH/HTTPS)

```bash
cd /home/atakan/memoryguard

# 1. Erstelle Repo auf GitHub:
#    https://github.com/new
#    Name: memoryguard
#    NICHT "Initialize with README" ankreuzen!

# 2. Initialisiere Git
git init
git add .
git commit -m "Initial commit: MemoryGuard v1.0.0"
git branch -M main

# 3. Remote hinzufügen (SSH)
git remote add origin git@github.com:SHAdd0WTAka/memoryguard.git

# ODER (HTTPS)
git remote add origin https://github.com/SHAdd0WTAka/memoryguard.git

# 4. Push
git push -u origin main
```

## Option 3: GitHub CLI (gh)

```bash
# Login
gh auth login

# Repo erstellen und pushen
cd /home/atakan/memoryguard
gh repo create memoryguard --public --source=. --push
```

## Nach dem Push

Repository URL: https://github.com/SHAdd0WTAka/memoryguard

Installation:
```bash
pip install git+https://github.com/SHAdd0WTAka/memoryguard.git
```
