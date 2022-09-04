FROM nvcr.io/nvidia/pytorch:22.08-py3

RUN apt-get update && apt install -y libsm6 libxrender1 libxext-dev

VOLUME [ "/stable-diffusion" ]
WORKDIR /stable-diffusion

# RUN git clone https://github.com/CompVis/stable-diffusion.git .
# low VRAM version
RUN git clone https://github.com/basujindal/stable-diffusion.git .

RUN conda init bash && conda env create -f environment.yaml

RUN mkdir -p models/ldm/stable-diffusion-v1
COPY sd-v1-4.ckpt models/ldm/stable-diffusion-v1/model.ckpt

# garbage_collection_threshold needs pytorch >= 1.12
# ENV PYTORCH_CUDA_ALLOC_CONF garbage_collection_threshold:0.8,max_split_size_mb:128
ENV PYTORCH_CUDA_ALLOC_CONF max_split_size_mb:64
ENV CONDA_DEFAULT_ENV ldm

ENTRYPOINT [ "/opt/conda/envs/ldm/bin/python" ]
