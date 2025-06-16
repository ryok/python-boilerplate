# デバッグログ

## デバッグ記録テンプレート
<!--
日付: YYYY-MM-DD HH:MM
問題: 
症状: 
調査内容: 
原因: 
解決方法: 
参考リンク: 
-->

## 重要なデバッグ記録

### 2024-06-16: プロジェクト初期セットアップ
- **問題**: Claude Code用のナレッジ管理システムの構築
- **症状**: プロジェクト情報が体系的に管理されていない
- **調査内容**: 
  - Zennの記事を参考に最適なファイル構造を検討
  - 既存のプロジェクト構造との整合性を確認
- **原因**: ナレッジ管理の仕組みが未導入
- **解決方法**: 
  - CLAUDE.mdと.claudeディレクトリ構造を導入
  - 各種ドキュメントテンプレートを作成
- **参考リンク**: https://zenn.dev/driller/articles/2a23ef94f1d603

## よくある問題と対処法

### インポートエラー
```python
# 問題: ModuleNotFoundError: No module named 'src'
# 原因: PYTHONPATHが設定されていない
# 解決:
export PYTHONPATH="${PYTHONPATH}:$(pwd)"
# またはプロジェクトルートから実行
python -m src.cli
```

### 型チェックエラー
```python
# 問題: Pyright: "None" is not callable
# 原因: Optional型の値を直接呼び出している
# 解決:
if callback is not None:
    callback()
```

### 仮想環境の問題
```bash
# 問題: コマンドが見つからない
# 原因: 仮想環境が有効化されていない
# 解決:
source myenv/bin/activate
# 確認
which python  # myenv/bin/python が表示されるべき
```

## パフォーマンス問題の調査記録

### メモリリーク調査テンプレート
```python
import tracemalloc
import gc

# メモリ使用量の追跡開始
tracemalloc.start()

# 問題のあるコードを実行
# ...

# スナップショット取得
snapshot = tracemalloc.take_snapshot()
top_stats = snapshot.statistics('lineno')

print("[ Top 10 ]")
for stat in top_stats[:10]:
    print(stat)
```

### CPU使用率の調査
```bash
# プロファイリング実行
python -m cProfile -o profile.stats src/cli.py

# 結果の分析
python -m pstats profile.stats
# > sort cumulative
# > stats 20
```

## セキュリティ関連のデバッグ

### 環境変数の確認
```bash
# 設定されている環境変数の確認（秘密情報に注意）
env | grep -E "^(API_|DATABASE_|SECRET_)" | sed 's/=.*/=***/'
```

### 依存関係の脆弱性チェック
```bash
# pipauditを使用（要インストール）
uv add --dev pip-audit
uv run pip-audit
```

## ネットワーク関連のデバッグ

### API接続問題
```python
import requests
import logging

# デバッグログを有効化
logging.basicConfig(level=logging.DEBUG)
requests_log = logging.getLogger("requests.packages.urllib3")
requests_log.setLevel(logging.DEBUG)
requests_log.propagate = True
```

## Docker関連のデバッグ

### コンテナ内調査
```bash
# 実行中のコンテナに入る
docker exec -it <container_id> /bin/bash

# ログ確認
docker logs <container_id> --tail 100 -f

# リソース使用状況
docker stats <container_id>
```

## 未解決の問題

### 調査中
- [ ] 特定条件下でのテストのフレーク
- [ ] CI環境でのみ発生する型チェックエラー

### 保留中
- [ ] パフォーマンスの最適化（現時点で問題なし）
- [ ] メモリ使用量の削減（必要に応じて対応）