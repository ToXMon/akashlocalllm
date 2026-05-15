# Pinned vLLM OpenAI-compatible server image
# Provides /v1/chat/completions and /v1/models
FROM vllm/vllm-openai:0.5.1.post1-cu121

# Optional: set a sane default port (Akash/Agent Zero will hit base URL)
ENV PORT=8000
EXPOSE 8000

# Runtime config via env (set in Akash SDL)
# - MODEL: huggingface model id or local path
# - HF_TOKEN: token for gated models
# - VLLM_ARGS: extra args appended to vllm serve

CMD ["bash", "-lc", "vllm serve \"${MODEL:-Qwen/Qwen2.5-7B-Instruct}\" --host 0.0.0.0 --port ${PORT:-8000} ${VLLM_ARGS:-}"]
