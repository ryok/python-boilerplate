# プロジェクト技術ナレッジ

## 実装パターン

### エラーハンドリング
```python
# 推奨パターン: 具体的な例外を捕捉
try:
    result = risky_operation()
except ValueError as e:
    logger.error(f"Invalid value: {e}")
    raise
except Exception as e:
    logger.exception("Unexpected error occurred")
    raise
```

### ロギング設定
- `src/core/logger.py`で一元管理
- 環境変数`LOG_LEVEL`で制御（デフォルト: INFO）
- 構造化ログを推奨（JSONフォーマット対応）

### 設定管理パターン
```python
# src/core/config.pyの使用例
from src.core.config import get_config

config = get_config()
database_url = config.get("DATABASE_URL", "sqlite:///default.db")
```

### テストパターン
```python
# pytest fixtureの活用
@pytest.fixture
def sample_config():
    return {"key": "value"}

def test_function(sample_config):
    assert sample_config["key"] == "value"
```

## 技術的な決定事項

### uvを採用した理由
- pip比で10倍以上高速なパッケージインストール
- 依存関係解決の信頼性が高い
- ロックファイル（uv.lock）による再現性の確保

### Ruffを採用した理由
- Black + isort + flake8の機能を統合
- Rustで実装されており高速
- 設定ファイル一つで完結（ruff.toml）

### Pyrightを採用した理由
- VSCodeとの親和性が高い
- strictモードでの厳密な型チェック
- 型推論の精度が高い

## よくある問題と解決策

### 問題: 仮想環境のパスが見つからない
```bash
# 解決策
uv venv myenv
source myenv/bin/activate  # Linux/Mac
# または
myenv\Scripts\activate  # Windows
```

### 問題: 型チェックエラー
```python
# 解決策: 型ヒントの明示
from typing import Optional

def process_data(value: Optional[str] = None) -> str:
    if value is None:
        return "default"
    return value.upper()
```

### 問題: インポートエラー
```python
# 解決策: 絶対インポートを使用
# 悪い例
from core.config import get_config

# 良い例
from src.core.config import get_config
```

## パフォーマンス最適化のヒント

### 1. 遅延インポート
```python
def process_large_data():
    # 必要な時だけインポート
    import pandas as pd
    return pd.DataFrame()
```

### 2. キャッシュの活用
```python
from functools import lru_cache

@lru_cache(maxsize=128)
def expensive_computation(n: int) -> int:
    # 重い計算処理
    return n ** 2
```

### 3. 非同期処理の検討
```python
import asyncio

async def fetch_data():
    # 非同期I/O操作
    await asyncio.sleep(1)
    return "data"
```

## デバッグテクニック

### 1. ブレークポイントの設定
```python
# コード内でデバッガを起動
import pdb; pdb.set_trace()
# または Python 3.7+
breakpoint()
```

### 2. ログレベルの動的変更
```python
import logging
# デバッグ時のみ
logging.getLogger().setLevel(logging.DEBUG)
```

### 3. プロファイリング
```bash
# cProfileを使用
python -m cProfile -s cumulative src/cli.py
```