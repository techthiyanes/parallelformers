python ../masked_lm.py \
  --test-name="FP32 & Non-PF"\
  --name="microsoft/deberta-v2-xlarge" \
  --gpu-from=0 \
  --gpu-to=1
#
python ../masked_lm.py \
  --test-name="FP16 & Non-PF"\
  --name="microsoft/deberta-v2-xlarge" \
  --gpu-from=0 \
  --gpu-to=1 \
  --fp16

python ../masked_lm.py \
  --test-name="FP32 & PF"\
  --name="microsoft/deberta-v2-xlarge" \
  --gpu-from=0 \
  --gpu-to=1 \
  --use-pf

python ../masked_lm.py \
  --test-name="FP16 & PF"\
  --name="microsoft/deberta-v2-xlarge" \
  --gpu-from=0 \
  --gpu-to=1 \
  --use-pf \
  --fp16
