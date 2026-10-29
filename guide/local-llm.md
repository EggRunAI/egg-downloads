# Local LLM

Run a model inside an egg on your Mac's GPU, sized so it actually fits. **Egg LLM** ([github.com/EggRunAI/egg-llm](https://github.com/EggRunAI/egg-llm)) is EggRun's in-machine inference app: a pinned llama.cpp built with the `ggml-virtgpu` backend plus a small Rust TUI, so a model running inside the egg computes on your Mac's GPU, driven entirely from inside the machine.

## 1. Run the machine

Egg LLM builds on an **Ubuntu** guest (it installs its toolchain with `apt`). Open **Ubuntu Desktop** from the desk, or write the machine as an Eggfile:

```eggfile
FROM ubuntu
CPUS 8
RAM 16G
DISK 40G
GPU virgl
```

[Download Ubuntu Desktop](egg:install/egg/ubuntu-26-desktop)

## 2. Build it, inside the egg

```bash
git clone https://github.com/EggRunAI/egg-llm && cd egg-llm
./build.sh    # apt deps + rustup, builds llama.cpp (GGML_VIRTGPU=ON) and ./egg-llm
./test.sh     # downloads Qwen2.5-0.5B-Instruct Q4_K_M and runs the backend self-test
./egg-llm     # the TUI: chat with the model
```

`test.sh` is the honest check: the one-shot driver (`llm-infer --self-test`) proves distinct prompts give distinct first tokens on the host GPU path, real compute. Keep models in your home directory; `/tmp` is wiped on reboot.

## 3. Pick a model

Prefer **standard-attention** models (Qwen, Llama, Mistral, Gemma) over linear-attention ones (Mamba/SSM, Gated Delta Net, GLA, RWKV) at the same size. The GPU is reached over APIR, which remotes one ggml compute graph per virtio-gpu round trip; op-dense linear-attention architectures pay that per-graph overhead far more often, so their tokens per second fall well below a standard-attention model of equal size.

The one-shot driver takes the usual knobs, `-m/--model`, `-p/--prompt`, `-n/--max-tokens`, `--ngl`, `--ctx`, when you want to script a run instead of chatting.

## 4. Size the memory

Two numbers, two jobs: `RAM` is the machine's memory; `host_mem` is the GPU window. A 7–8B quantized model is comfortable at `RAM 16G` and `host_mem 8G`; bigger models scale both (powers of two for `host_mem`, up to 32G). When `host_mem` is too small, the model fails to allocate.

## You should now be able to

- run an Ubuntu GPU egg for inference
- build, self-test and chat with Egg LLM
- choose a standard-attention model for the APIR path
- pick RAM and host_mem for a model
