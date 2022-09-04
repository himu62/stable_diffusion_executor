@mkdir cache
@mkdir dest

@set /p filename=filename(in dest/samples directory):
@set /p strength=strength(0-1.0, larger makes more change):
@set /p prompt=prompt:
docker run --rm --gpus all -t -v "%~dp0dest":/dest -v "%~dp0cache":/root/.cache stable_diffusion_executor scripts/img2img.py --init-img "/dest/samples/%filename%.png" --strength %strength% --prompt "%prompt%" --n_samples 1 --outdir /dest --skip_grid --n_iter 3
