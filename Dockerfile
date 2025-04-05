FROM python:3.11-slim

WORKDIR /app

# uvのインストール
RUN pip install uv

COPY requirements.txt .
# uvを使用して依存関係をインストール
RUN uv pip install -r requirements.txt

# ruffのインストール
RUN uv pip install ruff==0.9.1
