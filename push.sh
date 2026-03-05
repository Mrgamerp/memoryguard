#!/bin/bash
# MemoryGuard Push Script
# Führe dies aus, um zu GitHub zu pushen

set -e

echo "🔧 MemoryGuard zu GitHub pushen..."
echo ""

# GitHub Token abfragen
if [ -z "$GITHUB_TOKEN" ]; then
    echo "GitHub Token benötigt!"
    echo "Erstelle einen Token unter: https://github.com/settings/tokens"
    echo "Benötigte Berechtigungen: repo"
    echo ""
    read -s -p "GitHub Token: " GITHUB_TOKEN
    echo ""
fi

USERNAME="SHAdd0WTAka"
REPO="memoryguard"

cd /home/atakan/memoryguard

echo "📦 Initialisiere Git..."
git init
git config user.email "$(git config --global user.email || echo 'you@example.com')"
git config user.name "$(git config --global user.name || echo 'Your Name')"

echo "📄 Erstelle alle Dateien..."
git add .

echo "💾 Commit..."
git commit -m "Initial commit: MemoryGuard v1.0.0 - Modular Python Memory Monitoring

Features:
- Real-time memory monitoring
- Automatic leak detection
- Valgrind integration for C extensions
- Live terminal dashboard
- CI/CD ready
- Drop-in modular design

Like Lego for your Code!"

echo "🌿 Branch setup..."
git branch -M main

echo "🔗 Remote hinzufügen..."
git remote add origin "https://${USERNAME}:${GITHUB_TOKEN}@github.com/${USERNAME}/${REPO}.git" 2>/dev/null || \
git remote set-url origin "https://${USERNAME}:${GITHUB_TOKEN}@github.com/${USERNAME}/${REPO}.git"

echo "🚀 Push zu GitHub..."
git push -u origin main --force

echo ""
echo "✅ FERTIG! Repository ist live unter:"
echo "   https://github.com/${USERNAME}/${REPO}"
echo ""
echo "📋 Installation bei anderen:"
echo "   pip install git+https://github.com/${USERNAME}/${REPO}.git"
