# Python Boilerplate Project

## 概要
このプロジェクトは、Pythonアプリケーション開発のためのボイラープレートテンプレートです。モダンなPython開発環境のベストプラクティスに従って構成されています。

## 技術スタック
- **Python**: 3.11+
- **パッケージマネージャー**: uv
- **リンター/フォーマッター**: Ruff
- **型チェッカー**: Pyright
- **テストフレームワーク**: pytest
- **コンテナ**: Docker / Docker Compose

## プロジェクト構造
```
python-boilerplate/
├── src/                    # ソースコード
│   ├── __init__.py
│   ├── cli.py             # CLIインターフェース
│   └── core/              # コアモジュール
│       ├── __init__.py
│       ├── config.py      # 設定管理
│       ├── logger.py      # ロギング設定
│       └── main.py        # メインエントリーポイント
├── tests/                 # テストコード
├── Dockerfile             # Dockerコンテナ定義
├── docker-compose.yml     # Docker Compose設定
├── pyproject.toml         # プロジェクト設定
├── ruff.toml             # Ruffリンター設定
├── pyrightconfig.json     # Pyright型チェック設定
└── uv.lock               # 依存関係ロックファイル
```

## 開発ガイドライン
- **コードスタイル**: PEP 8準拠（Ruffで自動チェック）
- **型ヒント**: 全ての関数に型ヒントを記述
- **テスト**: 新機能追加時は必ずユニットテストを作成
- **ドキュメント**: docstringによる関数の説明を推奨

## よく使うコマンド
```bash
# 依存関係のインストール
uv sync

# テストの実行
uv run pytest

# リンターの実行
uv run ruff check .

# フォーマットの実行
uv run ruff format .

# 型チェックの実行
uv run pyright

# アプリケーションの実行
uv run python -m src.cli
```

## 重要な設定
- **Python仮想環境**: `myenv/` ディレクトリに配置
- **型チェック**: strictモードで実行
- **リンター**: Ruffによる自動修正が有効

## 注意事項
- 本番環境へのデプロイ前に必ず全テストを実行すること
- セキュリティに関わる設定は環境変数で管理すること
- 新規依存関係追加時は`uv add`を使用すること

## 知見管理システム
このプロジェクトでは以下のファイルで知見を体系的に管理しています：

### `.claude/context.md`
- プロジェクトの背景、目的、制約条件
- 技術スタック選定理由
- ビジネス要件や技術的制約

### `.claude/project-knowledge.md`
- 実装パターンや設計決定の知見
- アーキテクチャの選択理由
- 避けるべきパターンやアンチパターン

### `.claude/project-improvements.md`
- 過去の試行錯誤の記録
- 失敗した実装とその原因
- 改善プロセスと結果

### `.claude/common-patterns.md`
- 頻繁に使用するコマンドパターン
- 定型的な実装テンプレート

**重要**: 新しい実装や重要な決定を行った際は、該当するファイルを更新してください。
