#!/bin/bash
set -e

echo "🚀 Starting Soxon bot + GitHub runner setup..."

# 1. Install Docker + Git
echo "🔧 Installing Docker and Git..."
sudo apt update
sudo apt install -y docker.io git

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
  soxon-bot

# 4. GitHub Actions Runner (inside container)
# Replace with your actual repo/org URL + token
REPO_URL="https://github.com/zscrub/soxon"
RUNNER_TOKEN="REPLACE_ME"

echo "🏃 Setting up GitHub self-hosted runner in Docker..."

docker run -d \
  --name github-runner \
  --restart=always \
  -e REPO_URL=$REPO_URL \
  -e RUNNER_TOKEN=$RUNNER_TOKEN \
  -v /var/run/docker.sock:/var/run/docker.sock \
  myoung34/github-runner:latest

echo "✅ Setup complete! Soxon bot and GitHub runner are alive and will survive reboot :3"

