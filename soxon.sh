#!/bin/bash
set -e

echo "🚀 Starting Soxon bot..."

# Check for STATBOT_TOKEN env var
if [ -z "$STATBOT_TOKEN" ]; then
  read -p "🔑 Enter STATBOT_TOKEN: " STATBOT_TOKEN
fi

if [[ -z "$STATBOT_TOKEN" ]]; then
  echo "Error: STATBOT_TOKEN is required for startup script. Exiting"
  exit 1 # Exit with a non-zero status code to indicate an error
fi


# 1. Install Docker + Git
echo "🔧 Installing Docker and Git..."
sudo apt update
sudo apt install -y docker.io git

echo "⛔️ Adding $USER to Docker group..."
sudo usermod -aG docker $USER

echo "💻 Enabling and starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "👥 Adding user to docker group..."
sudo usermod -aG docker "$USER"

# 2. Clone your repo via SSH
echo "📁 Setting up project directory..."
mkdir -p ~/dev
cd ~/dev

if [ ! -d "soxon" ]; then
  echo "🐑 Cloning repo via SSH..."
  git clone git@github.com:zscrub/soxon.git
else
  echo "📦 Repo already exists, skipping clone."
fi

cd soxon

# 3. Build and run your Discord bot container
echo "🐳 Building Soxon Docker image..."
docker build -t soxon-bot .

echo "🕹️ Running Soxon bot with restart policy..."
docker run -d \
  --name soxon-bot \
  --restart=always \
  -e STATBOT_TOKEN="$STATBOT_TOKEN" \
  soxon-bot

echo "✅ Setup complete! Garlic bot running..."

