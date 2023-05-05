# dotfiles

[chezmoi](https://www.chezmoi.io/)を使ってdotfileを管理している

## 新規でセットアップ

```sh
brew install chezmoi
chezmoi init --ssh --apply kkkw
```

## コマンド

```sh
# 管理対象の一覧
chezmoi managed
# 既存のファイルをchezmoi管理にする
chezmoi add ~/.zshrc
# 既存のファイルをテンプレートとして追加する
chezmoi add --template ~/.zshrc
# すでに管理下に置かれているファイルをテンプレートとして扱うよう変更する
chezmoi chattr +template ~/.zshrc
# 編集
chezmoi edit ~/.zshrc
# 適用(ドライラン)
chezmoi apply --dry-run --verbose
# 適用
chezmoi apply
# ファイル指定で適用
chezmoi apply ~/.zshrc
# リポジトリに移動
chezmoi cd
# templateで使える変数の確認
chezmoi data
# gitリポジトリの(他マシンでの)変更を取り込む
chezmoi update
# templateのテスト
cat foo.tmpl | chezmoi execute-template
# templateのテスト2
chezmoi cat ~/foo.yml
```
