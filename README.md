# akashlocalllm

Minimal OpenAI-compatible LLM API for Akash using vLLM.

## What you get
- OpenAI-compatible endpoints:
  - `GET /v1/models`
  - `POST /v1/chat/completions`

## Local run (GPU)
```bash
docker run --gpus all -p 8000:8000 \
  -e MODEL=Qwen/Qwen2.5-7B-Instruct \
  -e HF_TOKEN=... \
  ghcr.io/toxmon/akashlocalllm:main
```

## Agent Zero integration (simple)
In Agent Zero Model Configuration UI:
- Provider: OpenAI-compatible
- Base URL (`api_base`): `https://<akash-endpoint>`
- Model name: whatever you set as `MODEL`

## Env
- `MODEL` (required)
- `HF_TOKEN` (optional)
- `VLLM_ARGS` (optional)
