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

## Smoke test
After deploy (local or Akash), hit:

```bash
curl -sS $BASE_URL/v1/models | jq .

curl -sS $BASE_URL/v1/chat/completions \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer ignored' \
  -d '{"model":"'$MODEL'","messages":[{"role":"user","content":"hi"}],"temperature":0.2}' \
  | jq .
```

## Akash deploy
Use your existing Akash flow; this repo provides `deploy/deploy.yaml`.

Agent Zero: set OpenAI-compatible `api_base` to the resulting Akash URL.
