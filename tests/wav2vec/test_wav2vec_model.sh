#python ../speech_model.py \
#  --test-name="FP32 & Non-PF"\
#  --name="facebook/wav2vec2-base" \
#  --gpu-from=0 \
#  --gpu-to=1
#
#python ../speech_model.py \
#  --test-name="FP16 & Non-PF"\
#  --name="facebook/wav2vec2-base" \
#  --gpu-from=0 \
#  --gpu-to=1 \
#  --fp16

python ../speech_model.py \
  --test-name="FP32 & PF"\
  --name="facebook/wav2vec2-base" \
  --gpu-from=0 \
  --gpu-to=1 \
  --use-pf

python ../speech_model.py \
  --test-name="FP16 & PF"\
  --name="facebook/wav2vec2-base" \
  --gpu-from=0 \
  --gpu-to=1 \
  --use-pf \
  --fp16
