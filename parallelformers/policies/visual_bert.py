# Copyright 2021 TUNiB inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from transformers.models.visual_bert.modeling_visual_bert import (
    VisualBertLayer,
)

from parallelformers.policies.base import Layer, Policy
from parallelformers.utils import AllReduceLinear


class VisualBertPolicy(Policy):
    @staticmethod
    def replace_arguments(config, world_size):
        return {
            # 1. reduce hidden size
            "attention.self.all_head_size": config.hidden_size // world_size,
            # 2. reduce number of heads
            "attention.self.num_attention_heads": config.num_attention_heads
            // world_size,
        }

    @staticmethod
    def attn_qkv():
        return [
            Layer(
                weight="attention.self.query.weight",
                bias="attention.self.query.bias",
            ),
            Layer(
                weight="attention.self.key.weight",
                bias="attention.self.key.bias",
            ),
            Layer(
                weight="attention.self.value.weight",
                bias="attention.self.value.bias",
            ),
        ]

    @staticmethod
    def attn_out():
        return [
            Layer(
                weight="attention.output.dense.weight",
                bias="attention.output.dense.bias",
                replace=AllReduceLinear,
            ),
        ]

    @staticmethod
    def mlp_in():
        return [
            Layer(
                weight="intermediate.dense.weight",
                bias="intermediate.dense.bias",
            ),
        ]

    @staticmethod
    def mlp_out():
        return [
            Layer(
                weight="output.dense.weight",
                bias="output.dense.bias",
                replace=AllReduceLinear,
            ),
        ]

    @staticmethod
    def original_layer_class():
        return VisualBertLayer
