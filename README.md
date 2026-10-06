# nv

[kihachi2000/neovim-container](https://github.com/kihachi2000/neovim-container/pkgs/container/neovim-container) で管理している Neovim コンテナイメージを起動するスクリプト。

## 使い方

起動環境に合ったスクリプトにパスを通し、以下のコマンドを実行する。

```sh
nv [オプション] [編集対象ファイル]
```

`NVIM_CONTAINER_TAG` 環境変数を設定すると、`ghcr.io/kihachi2000/neovim-container:<tag>` を利用できる。未設定時は `latest` を使う。

コンテナ内でデバッグ用途の `bash` を起動する場合は、`nv-debug` を使う。
