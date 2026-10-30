#!/usr/bin/env bash
# ==============================================================================
# Infinite AI Mesh - Host Memory & Ollama Optimization Script
# Configures optimal RAM/Swap ratio and installs the 14B sweet-spot model
# ==============================================================================
set -euo pipefail

SWAP_SIZE_GB="8"
SWAP_FILE="/swapfile"
MODEL_NAME="qwen2.5-coder:14b"

echo "=== [1/4] Configuring Linux Memory Guardrails ==="
if [ ! -f "$SWAP_FILE" ]; then
    echo "Creating ${SWAP_SIZE_GB}GB swap file at ${SWAP_FILE}..."
    sudo fallocate -l "${SWAP_SIZE_GB}G" "$SWAP_FILE" || sudo dd if=/dev/zero of="$SWAP_FILE" bs=1G count="$SWAP_SIZE_GB"
    sudo chmod 600 "$SWAP_FILE"
    sudo mkswap "$SWAP_FILE"
    sudo swapon "$SWAP_FILE"
    echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab
    echo "Swap allocated and enabled."
else
    echo "Swap file already exists."
fi

# Set swappiness to 10 so Linux strongly prefers physical RAM for model weights
echo "Setting vm.swappiness=10..."
sudo sysctl vm.swappiness=10
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.d/99-ai-mesh.conf

echo "=== [2/4] Verifying Ollama Installation ==="
if ! command -v ollama &>/dev/null; then
    echo "Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "Ollama is already installed."
fi

sudo systemctl enable --now ollama

echo "=== [3/4] Pulling 14B Local Sovereign Model ==="
echo "Pulling ${MODEL_NAME} into local storage..."
ollama pull "$MODEL_NAME"

echo "=== [4/4] Verification ==="
free -h
ollama list
echo "Local Sovereign Core is ready!"
