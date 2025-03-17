# Python ボイラープレート設計書

## 要件定義書

### 目的
- 再利用可能なPythonプロジェクトの基本構造を提供する
- 開発の迅速化と標準化を実現する
- テスト駆動開発（TDD）をサポートする構造を持つ

### 機能要件
1. 基本的なパッケージ構造の提供
2. ロギング機能の実装
3. コマンドライン引数の処理機能
4. 設定ファイル読み込み機能
5. 単体テスト環境の整備

### 非機能要件
1. PEP8準拠のコードスタイル
2. Googleスタイルのドキュメント文字列
3. 高いテストカバレッジ
4. モジュール間の低い結合度と高い凝集度

## 設計書

### 概略設計
本ボイラープレートは以下の構造を持ちます：

```
python-boilerplate/
├── docs/               # ドキュメント
│   └── design.md       # 設計書
├── src/                # ソースコード
│   ├── __init__.py     # パッケージ定義
│   ├── core/           # コア機能
│   │   ├── __init__.py # パッケージ定義
│   │   ├── config.py   # 設定管理
│   │   ├── logger.py   # ロギング
│   │   └── main.py     # メイン機能
│   └── cli.py          # コマンドラインインターフェース
├── tests/              # テストコード
│   ├── __init__.py     # パッケージ定義
│   ├── core/           # コア機能のテスト
│   │   ├── __init__.py # パッケージ定義
│   │   ├── test_config.py  # 設定管理のテスト
│   │   ├── test_logger.py  # ロギングのテスト
│   │   └── test_main.py    # メイン機能のテスト
│   └── test_cli.py     # CLIのテスト
├── .gitignore          # Git除外設定
├── pyproject.toml      # プロジェクト設定
├── README.md           # プロジェクト説明
└── requirements.txt    # 依存パッケージ
```

### 機能設計

#### コア機能（core）
1. **設定管理（config.py）**
   - YAML/JSON形式の設定ファイル読み込み
   - 環境変数からの設定値取得
   - デフォルト設定の提供

2. **ロギング（logger.py）**
   - 複数レベルのログ出力（DEBUG, INFO, WARNING, ERROR, CRITICAL）
   - ファイル出力とコンソール出力
   - ログフォーマットのカスタマイズ

3. **メイン機能（main.py）**
   - アプリケーションのメインロジック
   - 他のモジュールの統合

#### コマンドラインインターフェース（cli.py）
- argparseを使用したコマンドライン引数の処理
- サブコマンドのサポート
- ヘルプメッセージの提供

### クラス構成

#### ConfigManager（config.py）
```python
class ConfigManager:
    """設定を管理するクラス"""
    
    def __init__(self, config_path=None):
        """初期化"""
        
    def load_config(self, config_path):
        """設定ファイルを読み込む"""
        
    def get(self, key, default=None):
        """設定値を取得する"""
        
    def set(self, key, value):
        """設定値を設定する"""
```

#### Logger（logger.py）
```python
class Logger:
    """ロギングを管理するクラス"""
    
    def __init__(self, name, level='INFO', log_file=None):
        """初期化"""
        
    def debug(self, message):
        """DEBUGレベルのログを出力"""
        
    def info(self, message):
        """INFOレベルのログを出力"""
        
    def warning(self, message):
        """WARNINGレベルのログを出力"""
        
    def error(self, message):
        """ERRORレベルのログを出力"""
        
    def critical(self, message):
        """CRITICALレベルのログを出力"""
```

#### Application（main.py）
```python
class Application:
    """アプリケーションのメインクラス"""
    
    def __init__(self, config=None):
        """初期化"""
        
    def run(self):
        """アプリケーションを実行"""
```

#### CLI（cli.py）
```python
class CLI:
    """コマンドラインインターフェースを提供するクラス"""
    
    def __init__(self):
        """初期化"""
        
    def parse_args(self, args=None):
        """コマンドライン引数を解析"""
        
    def run(self):
        """CLIを実行"""
