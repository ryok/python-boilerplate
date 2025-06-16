# よく使うコマンドパターン

## 開発環境セットアップ
```bash
# 初回セットアップ
uv venv myenv
source myenv/bin/activate
uv sync

# 依存関係の更新
uv sync --refresh
```

## 日常的な開発作業

### コード品質チェック
```bash
# リンターとフォーマッター実行
uv run ruff check . --fix
uv run ruff format .

# 型チェック実行
uv run pyright

# 全てのチェックを一度に実行
uv run ruff check . --fix && uv run ruff format . && uv run pyright
```

### テスト実行
```bash
# 全テスト実行
uv run pytest

# 特定のテストファイルのみ実行
uv run pytest tests/test_cli.py

# カバレッジ付きでテスト実行
uv run pytest --cov=src --cov-report=html

# 並列実行（高速化）
uv run pytest -n auto

# verboseモードでテスト実行
uv run pytest -vv
```

### アプリケーション実行
```bash
# CLIアプリケーション実行
uv run python -m src.cli

# 特定のコマンド実行（例）
uv run python -m src.cli --help
uv run python -m src.cli --version

# デバッグモードで実行
LOG_LEVEL=DEBUG uv run python -m src.cli
```

## 依存関係管理

### パッケージ追加・削除
```bash
# 本番用パッケージ追加
uv add requests

# 開発用パッケージ追加
uv add --dev pytest-mock

# パッケージ削除
uv remove requests

# 依存関係の更新
uv sync --upgrade-package requests
```

### 依存関係の確認
```bash
# インストール済みパッケージ一覧
uv pip list

# 依存関係ツリー表示
uv pip tree

# 古いパッケージの確認
uv pip list --outdated
```

## Docker操作

### ビルドと実行
```bash
# Dockerイメージのビルド
docker build -t python-boilerplate .

# コンテナ実行
docker run --rm python-boilerplate

# インタラクティブモードで実行
docker run --rm -it python-boilerplate /bin/bash

# docker-composeで起動
docker-compose up

# バックグラウンドで起動
docker-compose up -d

# ログ確認
docker-compose logs -f
```

## Git操作

### ブランチ操作
```bash
# 新規ブランチ作成
git checkout -b feature/new-feature

# リモートの最新を取得
git fetch origin
git pull origin main

# 変更の確認
git status
git diff
```

### コミット前のチェック
```bash
# プリコミットチェック（手動実行）
uv run ruff check . --fix && uv run ruff format . && uv run pyright && uv run pytest

# ステージングと確認
git add -p
git status
git diff --staged
```

## トラブルシューティング

### 仮想環境の問題
```bash
# 仮想環境の再作成
rm -rf myenv
uv venv myenv
source myenv/bin/activate
uv sync
```

### キャッシュクリア
```bash
# Pythonキャッシュの削除
find . -type d -name __pycache__ -exec rm -rf {} +
find . -type f -name "*.pyc" -delete

# uvキャッシュのクリア
uv cache clean
```

### デバッグ実行
```bash
# Pythonデバッガで実行
uv run python -m pdb src/cli.py

# 特定の行にブレークポイント設定
# コード内に以下を追加: import pdb; pdb.set_trace()
```

## 便利なエイリアス設定

```bash
# ~/.bashrc or ~/.zshrc に追加
alias uv-check="uv run ruff check . --fix && uv run ruff format . && uv run pyright"
alias uv-test="uv run pytest"
alias uv-run="uv run python -m src.cli"
```

## CI/CD関連（将来の実装用）

### GitHub Actions用コマンド
```bash
# ローカルでGitHub Actionsをテスト（act必要）
act -j test

# 特定のワークフローをテスト
act -W .github/workflows/test.yml
```