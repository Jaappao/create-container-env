# devContainer向け プロジェクトディレクトリ作成スクリプト

## 使い方
1. `create-container-env.sh` をaliasするなり、pathに通すなり
2. `create-container-env.sh <プロジェクトディレクトリ名>`
3. 入力を促されるので番号を入力
  - どのテンプレートを使用するかを選ぶ(dir-template以下にあるディレクトリのこと)
  - そのテンプレートディレクトリをベースにしたプロジェクトフォルダがカレントディレクトリ以下に生成される
4. 作成されたディレクトリを指定して VSCode Remote - SSH `Open Folder in Container` すると便利にコンテナ開発が可能

## 実行環境
- MacBook Pro（14インチ、2021） Apple M1 Pro
- macOS Monterey 12.6.2
- Docker Desktop 4.15.0 (93002)
- Docker version 20.10.21, build baeda1f

## 作成の経緯
- 元々はPythonをローカル環境で構築するベストプラクティスを探すために作っていた。
  - Pythonをローカル環境で構築するのは大変だと思った。コンテナをベースとした開発環境を作りたいと思った。
  - Pythonバージョンを可変にしたりするためにpyenv入れてたし、科学技術計算系ができる仮想環境作るためにcondaを使ってたが、インタプリタのパスがどこにあるのか毎回わかんなくなる。VSCodeのシンタックスサポートとかを受けるためには、インタプリタのパスが毎回変わるのは大変。/usr/local/binがいい。
  - pipコマンドとcondaコマンドを取り違えて環境を汚してしまいがちだった。
  - 外部に同じ環境を持っていくときにポータビリティが低いのも気になっていた。requiements.txtだけ持っていけば済むことが少ない。（バイナリを別に導入したりすることがあるなら、コンテナ化した方がいい）
- MS純正のdevcontainerをガッツリ使ってもいいけど、devcontainer.jsonに全て記述すると、✅開発体験　❌ポータビリティ と思った。コンテナをVSCode以外の環境へ持っていく時のポータビリティを考えるとDockerfileとかdocker-compose.ymlを使いたい。
- 使いながらアップデートする。