# My Spider Example

This example demonstrates how to train a text-to-SQL agent on the Spider dataset using Agent-Lightning with reinforcement learning. It's compatible with Agent-lightning v0.2 or later.

## Requirements

This example depends on LangChain v1.0 and several SQL-related libraries. Install the required dependencies with:

```bash
conda create -n agent-lightning--examples--spider_my python=3.12 -y
conda activate agent-lightning--examples--spider_my

pip install uv
uv pip install -e ../../.[verl]
uv pip install -r requirements.txt
uv pip install flash-attn --no-build-isolation
```

Additionally, follow the [installation guide](../../docs/tutorials/installation.md) to install Agent-Lightning and VERL-related dependencies.

## Dataset

The trainer expects three Parquet files inside `examples/spider/data`:
`train_spider.parquet`, `test_dev_500.parquet`, and `test_dev.parquet`.

Download the curated dataset bundle provided with the repository:

```bash
gdown --fuzzy https://drive.google.com/file/d/1oi9J1jZP9TyM35L85CL3qeGWl2jqlnL6/view
unzip -q spider-data.zip -d data
rm spider-data.zip
```

If you prefer to generate the files yourself, download [Spider 1.0](https://yale-lily.github.io/spider) and run:

```bash
python spider_eval/convert_dataset.py
```

Set `VERL_SPIDER_DATA_DIR` if you store the dataset outside the default `data` directory.

## Included Files

| File/Directory | Description |
|----------------|-------------|
| `train_sql_agent.py` | Training script for SQL agents with support for multiple model configurations (Qwen, LLaMA, fast mode for CI) |
| `sql_agent.py` | SQL agent implementation using LangGraph and LangChain, with debugging capabilities |
| `data/` | Directory containing the Spider dataset files |
| `spider_eval/` | Evaluation utilities for assessing SQL agent performance |

## Running Examples

### Training

Train a SQL agent using the Qwen2.5-Coder-1.5B-Instruct model with the following command. This requires a single node with at least one 40GB GPU:

```bash
python train_sql_agent.py qwen
```

If you want to use an NPU for training, please refer to the **Launch Training with NPUS** section in [How to Train a SQL Agent](../../docs/how-to/train-sql-agent.md).

### Debugging

To test and debug the SQL agent interactively:

```bash
python sql_agent.py
```

This command requires an OpenAI-compatible API service. Configure your service endpoint and credentials using the `OPENAI_API_BASE` and `OPENAI_API_KEY` environment variables.
