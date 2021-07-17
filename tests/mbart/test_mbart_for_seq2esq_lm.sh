python ../seq2seq_lm.py \
  --test-name="FP32 & Non-PF"\
  --name="facebook/mbart-large-cc25" \
  --gpu-from=0 \
  --gpu-to=1

python ../seq2seq_lm.py \
  --test-name="FP16 & Non-PF"\
  --name="facebook/mbart-large-cc25" \
  --gpu-from=0 \
  --gpu-to=1 \
  --fp16

python ../seq2seq_lm.py \
  --test-name="FP32 & PF"\
  --name="facebook/mbart-large-cc25" \
  --gpu-from=0 \
  --gpu-to=1 \
  --use-pf

python ../seq2seq_lm.py \
  --test-name="FP16 & PF"\
  --name="facebook/mbart-large-cc25" \
  --gpu-from=0 \
  --gpu-to=1 \
  --use-pf \
  --fp16
