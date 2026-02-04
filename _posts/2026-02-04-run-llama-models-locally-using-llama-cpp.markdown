---
layout: post
title: "run llama models locally using llama.cpp"
date:   2026-02-04
categories: llm
---

Short note on how to run a local LLaMA-style model with [llama.cpp](https://github.com/ggerganov/llama.cpp).

## 1. Build llama.cpp

```bash
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
cmake -B build
cmake --build build --config Release -j 8
```

After this, the binaries live in `build/bin/`, for example `llama-cli`, `llama-simple`, `llama-server`, etc.

## 2. Download a GGUF model

llama.cpp works with models in the `GGUF` format. One easy way to get a small chat model (TinyLlama) is via the Hugging Face CLI:

```bash
cd llama.cpp

pip install huggingface_hub

huggingface-cli download \
  TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF \
  tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
  --local-dir models \
  --local-dir-use-symlinks False
```

You should now have a file like:

```text
models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
```

## 3. Run the model from the command line

Use `llama-cli` (or `llama-simple`) to generate text from a prompt:

```bash
cd llama.cpp

./build/bin/llama-cli \
  -m models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
  -p "Hello, how are you?" \
  -n 128
```

Flags used here:

- `-m` selects the model file.
- `-p` is the prompt text.
- `-n` is the maximum number of new tokens to generate.

For a very small chat demo, you can also try:

```bash
./build/bin/llama-simple \
  -m models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
  -p "Hello, how are you?"
```

That is enough to get a local LLM running fully on your machine, with no data sent to external services.

## 4. What is a quantized model?

Most GGUF files you download (like `Q4_K_M`, `Q5_K_M`, etc.) are *quantized* models.

- Normal models store weights as 16- or 32-bit floats.
- Quantized models store them as lower-bit integers (2, 3, 4, 5, 8-bit) plus scales.

This makes the file much smaller, uses less RAM/VRAM, and is usually a bit faster, at the cost of a small drop in quality. `Q4_K_M` is a good default trade-off.

## 5. Convert and quantize your own HF model to GGUF

If you have a Hugging Face model (either on the Hub or as a local directory), you can convert and quantize it yourself with `llama.cpp`.

One-time Python setup (inside `llama.cpp`):

```bash
cd llama.cpp
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Example: convert a HF model repo to GGUF fp16 and then quantize to `Q4_K_M`:

```bash
cd llama.cpp
source .venv/bin/activate

# 1) Convert HF model -> GGUF fp16
python convert_hf_to_gguf.py \
  HF_MODEL_ID_OR_LOCAL_PATH \
  --outfile models/my-model-f16.gguf \
  --model-type llama

# 2) Quantize GGUF fp16 -> GGUF Q4_K_M
./build/bin/llama-quantize \
  models/my-model-f16.gguf \
  models/my-model-Q4_K_M.gguf \
  Q4_K_M
```

You can then run `models/my-model-Q4_K_M.gguf` with `llama-cli` the same way as shown above.
