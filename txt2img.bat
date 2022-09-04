@mkdir cache
@mkdir dest

@set /p prompt=prompt:
docker run --rm --gpus all -t -v "%~dp0dest":/dest -v "%~dp0cache":/root/.cache stable_diffusion_executor scripts/txt2img.py --prompt "%prompt%" --plms --n_samples 2 --outdir /dest --skip_grid --n_iter 4 --ddim_steps 70
