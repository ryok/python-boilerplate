# Python ボイラープレート

モダンなPython開発環境のベストプラクティスに従った、再利用可能なプロジェクトテンプレートです。

## 特徴

- **モダンなツールチェーン**: uv（高速パッケージマネージャー）、Ruff（リンター/フォーマッター）、Pyright（型チェッカー）
- **包括的なプロジェクト構造**: ソースコード、テスト、ドキュメントの明確な分離
- **知見管理システム**: Claude AIとCursor IDE向けの構造化されたナレッジベース
- **Docker対応**: 開発と本番環境のためのコンテナ化サポート
- **厳格な品質管理**: 自動フォーマット、リンティング、型チェック
- **テスト駆動開発**: pytestによる包括的なテスト環境

## 技術スタック

- **Python**: 3.11以上
- **パッケージマネージャー**: [uv](https://github.com/astral-sh/uv)
- **リンター/フォーマッター**: [Ruff](https://github.com/charliermarsh/ruff)
- **型チェッカー**: [Pyright](https://github.com/microsoft/pyright) (strictモード)
- **テストフレームワーク**: [pytest](https://pytest.org)
- **コンテナ**: Docker / Docker Compose

## クイックスタート

### 前提条件

```bash
# uvのインストール（まだインストールしていない場合）
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### セットアップ

```bash
# リポジトリのクローン
git clone https://github.com/ryok/python-boilerplate.git
cd python-boilerplate

# 依存関係のインストール（uvが自動的に仮想環境を作成）
uv sync

# 開発環境の確認
uv run python -m src.cli --version
```

## 開発ワークフロー

### よく使うコマンド

```bash
# コード品質チェック
uv run ruff check .              # リンティング
uv run ruff format .             # コードフォーマット
uv run pyright                   # 型チェック

# テスト実行
uv run pytest                    # 全テスト実行
uv run pytest --cov=src          # カバレッジ付きテスト

# アプリケーション実行
uv run python -m src.cli         # CLIアプリケーション起動
uv run python -m src.cli --help  # ヘルプ表示

# Docker環境
docker-compose up -d             # コンテナ起動
docker-compose logs -f           # ログ確認
docker-compose down              # コンテナ停止
```

### 新機能の追加手順

1. **ブランチ作成**: `git checkout -b feature/new-feature`
2. **実装**: srcディレクトリに機能を追加
3. **テスト作成**: testsディレクトリに対応するテストを追加
4. **品質チェック**: 
   ```bash
   uv run ruff format . && uv run ruff check . --fix
   uv run pyright
   uv run pytest
   ```
5. **コミット**: 適切なプレフィックスを使用（例: `[feat] 新機能を追加`）
6. **プルリクエスト**: GitHubでPRを作成

## プロジェクト構造

```
python-boilerplate/
├── .claude/                 # Claude AI知見管理
│   ├── context.md          # プロジェクト背景
│   ├── project-knowledge.md # 実装パターン
│   ├── project-improvements.md # 改善記録
│   └── common-patterns.md  # コマンドパターン
├── .clinerules/            # Cline AI ルール管理
│   ├── project-overview.md # プロジェクト概要
│   ├── tech-stack.md       # 技術スタック
│   └── ...                 # その他のルール
├── .cursor/                # Cursor IDE設定
│   ├── coding-standards.mdc # コーディング規約
│   ├── commands.mdc        # コマンドリファレンス
│   └── ...                 # その他の設定
├── src/                    # ソースコード
│   ├── __init__.py
│   ├── cli.py             # CLIインターフェース
│   └── core/              # コアモジュール
│       ├── __init__.py
│       ├── config.py      # 設定管理
│       ├── logger.py      # ロギング設定
│       └── main.py        # メインエントリーポイント
├── tests/                 # テストコード
│   ├── __init__.py
│   ├── test_cli.py
│   └── core/
│       ├── __init__.py
│       ├── test_config.py
│       ├── test_logger.py
│       └── test_main.py
├── Dockerfile             # Dockerコンテナ定義
├── docker-compose.yml     # Docker Compose設定
├── pyproject.toml         # プロジェクト設定
├── ruff.toml             # Ruffリンター設定
├── pyrightconfig.json     # Pyright型チェック設定
├── uv.lock               # 依存関係ロックファイル
├── CLAUDE.md             # Claude AI用プロジェクト説明
└── README.md             # このファイル
```

## 知見管理システム

このプロジェクトは、AI開発支援ツール向けの構造化された知見管理システムを採用しています。

### Claude AI (.claude/)
プロジェクトの深い理解とコンテキスト共有のための知見管理：
- `context.md` - プロジェクトの背景と制約
- `project-knowledge.md` - 実装パターンと設計決定
- `project-improvements.md` - 改善履歴と学んだ教訓
- `common-patterns.md` - 再利用可能なコードパターン

### Cline AI (.clinerules/)
プロジェクト固有のルールとガイドライン：
- `project-overview.md` - プロジェクト概要
- `tech-stack.md` - 技術スタック詳細
- `development-guidelines.md` - 開発ガイドライン
- その他のドメイン固有ルール

### Cursor IDE (.cursor/)
IDE固有の設定とナレッジベース（.mdcフォーマット）：
- `coding-standards.mdc` - コーディング規約
- `commands.mdc` - よく使うコマンド集
- `git-workflow.mdc` - Gitワークフロー
- その他のIDE設定

詳細は[CLAUDE.md](CLAUDE.md)を参照してください。

## コーディング規約

- **PEP 8準拠**: Ruffによる自動チェック
- **型ヒント必須**: すべての関数に型アノテーション
- **Docstring**: GoogleまたはNumPyスタイル
- **テスト**: 新機能には必ずユニットテスト
- **コミットメッセージ**: プレフィックス規約を使用
  - `[feat]` - 新機能
  - `[fix]` - バグ修正
  - `[refactor]` - リファクタリング
  - `[test]` - テスト追加/修正
  - `[docs]` - ドキュメント更新
  - `[chore]` - 環境設定変更

## Docker環境

```bash
# 開発環境の起動
docker-compose up -d

# コンテナ内でコマンド実行
docker-compose exec app uv run pytest

# ログの確認
docker-compose logs -f app

# 環境のクリーンアップ
docker-compose down -v
```

## 貢献方法

1. このリポジトリをフォーク
2. 機能ブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m '[feat] Add amazing feature'`)
4. ブランチにプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストを作成

## ライセンス

MITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルを参照してください。
