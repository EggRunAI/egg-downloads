# GPU

Turn the GPU on for a machine and check that the guest sees it. Linux eggs get **OpenGL and Vulkan** bridged to your Mac's GPU, and models running inside the egg compute on it too. Full desktops, Blender, local LLMs, on real hardware.

The desktop eggs on the desk come with the GPU on; it is part of the machine the egg carries. For your own eggs, the switch is in two places:

```eggfile
# Eggfile: the machine the egg carries with it
GPU virgl
DISPLAY 1920x1080
```

```toml
# egg.toml: a machine to run
[display]
gpu = "virgl"          # 3D acceleration (default)
host_mem = "16G"       # GPU memory window for LLMs: powers of two, 256M to 32G
```

Inside the machine, check what it sees (install `mesa-utils` and `vulkan-tools` if they are missing):

```bash
glxinfo -B             # OpenGL renderer
vulkaninfo --summary   # Vulkan device
```

## Models on the GPU

Models running inside an egg execute on your Mac's GPU, bridged through the guest's virtio-gpu path. llama.cpp and anything ggml-based work this way: the guest-side `ggml-virtgpu` backend ships its compute graphs to the host over virtio-gpu (the APIR path), validated through 32B-class quantized models.

`host_mem` is the knob that matters: too small and large models fail to allocate. The default is 1G, fine for graphics, small for LLMs. See **Local LLM** for sizing.

## You should now be able to

- name the two places the GPU is configured
- explain `host_mem`
- see the GPU from inside the guest
