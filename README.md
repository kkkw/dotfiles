
## install rcm

### mac

```sh
$ brew install rcm
```

### ubuntu

```sh
$ sudo apt install rcm
```

## rcup

```sh
//初回はRCRCを指定する必要がある
env RCRC=$HOME/dotfiles/rcrc rcup
```

## mkrc

dotfiles配下で管理していないファイルを  
mkrcを使ってdotfilesに移動し、  
シンボリックリンクに置き換えることをインストールと表現している

```sh
//ホスト名を指定してインストールする
$ mkrc -B osx .config/karabiner/karabiner.json

//インストール先を指定する
$ mkrc -d dotfiles-local .zshrc.local

//ディレクトリごと指定する
$ mkrc -d dotfiles-local -S .aws
```

## rcdn

mkrcの逆
dotfiles内でコマンドを打つ
dotfiles内のファイルは消えないが、シンボリックリンクは削除される

```sh
$ cd ~/dotfiles
$ rcdn .zshrc
```
