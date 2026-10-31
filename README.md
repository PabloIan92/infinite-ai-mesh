# 🌌 Infinite AI Mesh: Sovereign 24/7 Multi-Engine Architecture

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Autonomous AI](https://img.shields.io/badge/Agent-Autonomous_24%2F7-emerald.svg)]()
[![Zero Token Bleed](https://img.shields.io/badge/Zero_Token_Bleed-By_Design-green.svg)]()
[![Founding.dev Ready](https://img.shields.io/badge/Founding.dev-Hackathon_Ready-cyan.svg)](LANDING_PAGE_SPEC.md)

### **Your Sovereign 24/7 Autonomous AI Workforce. Never Down. Zero Vendor Lock-in.**

> *"If OpenAI drops, DeepSeek steps in. If Claude hits a rate limit, Qwen takes the wheel. An unkillable, self-healing multi-engine AI mesh that runs your autonomous agents 24/7 with zero token leak and zero single-point-of-failure."*

[🚀 Live Failover Simulator](demo/index.html) • [📋 Landing Page Specification](LANDING_PAGE_SPEC.md) • [🏛️ Grand Council Architecture](SKILL.md) • [⚡ 1-Click Deploy](#-quick-setup--deployment)

---

## ⚡ The Fatal Trap: "API Bleed" & "Single Point of Failure"

Standard autonomous AI setups fail for three predictable reasons:

1. **Hard Outages (HTTP 429)**: When your single provider experiences downtime, capacity saturation, or rate-limits, your entire background agent dies.
2. **Financial Bleed**: Continuous background workers looping over codebase refactors, unit tests, and monitoring can burn $50–$300 overnight on pay-per-token API keys.
3. **Vendor Captivity**: Your enterprise workflows remain hostage to third-party outages, price hikes, and privacy changes.

---

## 🛡️ The Solution: The 4-Tier Cascading Mesh

```mermaid
graph TD
    User([📱 Mobile User on Telegram / Web]) -->|Natural Language| Bridge[24/7 PM2 Daemon Bridge]
    Bridge --> Tier1{Tier 1: Sovereign Headless}

    Tier1 -->|Active Quota| T1[Headless User-Tier CLI\nAntigravity / Claude Code / Codex\n$0.00 Per-Token Cost]
    Tier1 -->|Rate Limit / 429| Tier2{Tier 2: Enterprise Cloud NIM}

    Tier2 -->|Active| T2[NVIDIA NIM Offload\nNemotron 3.5 Super 120B VL\nNemotron 3 Ultra 550B MoE]
    Tier2 -->|Network Disconnect| Tier3{Tier 3: Local Sovereign Core}

    Tier3 -->|Offline Execution| T3[Local Ollama Daemon\nQwen 2.5 Coder 14B / DeepSeek R1 14B\nPhysical RAM + Fast Swap Buffer]
    Tier3 -->|Overflow / Consensus| Tier4[Tier 4: Resilient Open Fallback\nDeepSeek Reasoner API / OpenCode]
```

### The 4 Tiers at a Glance

| Tier | Engine | Operational Role | Cost Model |
| :--- | :--- | :--- | :--- |
| **Tier 1: Sovereign Headless** | Google Antigravity / Claude CLI | Primary agent for full file, shell, and git workflows via persistent OAuth sessions. | **$0.00** / token (Fixed subscription) |
| **Tier 2: Enterprise NIM Offload** | NVIDIA Nemotron 120B VL / 550B MoE | Heavy-duty Chain-of-Thought reasoning, visual evaluation, and deep refactoring. | **Free** Developer Tier |
| **Tier 3: Local Sovereign Core** | Ollama (`qwen2.5-coder:14b`) | 100% offline local model running in physical RAM with NVMe Swap headroom. | **$0.00** (Private, 100% offline) |
| **Tier 4: Resilient Fallback** | DeepSeek Reasoner API | Multi-model consensus voting and fail-safe continuity if upstream tiers stutter. | **Fraction of a cent** |

---

## 🎮 Interactive Live Failover Simulator

Experience the self-healing failover mechanism directly in your browser:
* Open [`demo/index.html`](demo/index.html) to see the live particle network, dynamic routing latency, and test simulated HTTP 429 outages with real-time failover logs.

---

## 🧠 The Hardware "Golden Ratio" Formula

To achieve high-speed inference without dedicated datacenter GPUs, the Infinite AI Mesh utilizes the **Memory Sweet-Spot Calculation**:

$$\text{Model Weight (14B Q4)} \approx 9.0\text{ GB} \le \text{Available Physical RAM (14--16 GB)}$$

* **Why 14B is the Golden Sweet Spot**: A 14B parameter quantized model fits 100% inside physical memory, reading weights at native RAM speeds (~40 GB/s on DDR4/DDR5) and generating 8–15 tokens/sec on standard cloud vCPUs.
* **Why 32B Fails on CPU**: A 32B model (~20 GB) spills over into Swap disk space (~500 MB/s), causing response times to collapse from seconds to 10+ minutes.
* **The 8 GB Linux Swap Headroom**: Adding an 8 GB fast NVMe swapfile guarantees the Linux Out-Of-Memory (OOM) killer never terminates background daemons or databases.

---

## 🚀 Quick Setup & Deployment

### 1. Optimize Memory and Install Local Core
```bash
bash templates/setup-swap-and-ollama.sh
```

### 2. Configure Enterprise Offload
```bash
export NVIDIA_API_KEY="nvapi-your-key-here"
python3 templates/nvidia_delegate.py.example "Analyze this logic puzzle"
```

### 3. Deploy the 24/7 Mobile Bridge
```bash
pm2 start templates/ecosystem.config.js.example
pm2 save
```

---

## 📋 Hackathon & Landing Page Kit

Building for the [Founding.dev](https://founding.dev) design challenge?  
See [**`LANDING_PAGE_SPEC.md`**](LANDING_PAGE_SPEC.md) for:
* Ready-to-copy Hero, Pain Points, and Feature section texts.
* Visual color tokens, button styles, and microcopy.
* Pre-written LinkedIn viral post template to easily pass the qualification threshold.

---

## 🔒 Security Hardening Guidelines

* **Token Segregation**: Store OAuth session files with restricted permissions (`chmod 600 ~/.gemini/antigravity-cli/*-token`).
* **Zero Hardcoded Secrets**: Secrets and keys are injected exclusively via runtime environment variables.
* **Allowlist Enforcement**: The mobile bridge responds strictly to verified user IDs, rejecting unauthorized prompts.

---

## 📄 License

MIT License. Built with pride for the sovereign, open-source AI builder community.
