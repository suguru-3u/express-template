# 概要

このプロジェクトは Express,TypeScript を使用したアプリを作成する際の雛形のプロジェクトです。

# 使用技術

- Express
- TypeScript
- Docker

# 使い方

GitHub から本プロジェクトをダウンロードした後に Docker を使用して環境を作成していきます。具体的な手順は下記に記載します。

1. GitHub からクローンする
2. Docker を立ち上げる
3. Docker iamge を作成する
   1. docker のイメージ作成
      1. `docker build . -t <イメージの名前>:latest`
   2. imege の確認
      1. `docker image ls`でイメージが存在するのか確認を行い、表示される IMAGE ID を控えておく。
4. コンテナの作成&時コンテナにログインする
   1. No3 で控えた IMAGE ID を使用して以下のコマンドを実行する
      `docker run -p 3000:3000 --name express -it <控えたIMAGE ID or IMAGE NAME> sh`

- その他コマンド
  - コンテナが立ち上がっていることを確認：`docker container ls`
  - コンテナ内にログイン： `docker exec -it <コンテナ名> sh`
  - コンテナの停止：`docker container stop express`
  - コンテナの削除：`docker container rm express`
  - image の削除：`docker image rm <IMAGE ID>`

上記の手順でアプリを作成することができますが、ライブラリや Node のバージョンは必要に応じて変更してください。

- Docker 公式サイト(node のバージョンについて)
  https://hub.docker.com/_/node

- Express の公式サイト
  https://expressjs.com/ja/advanced/security-updates.html

- TypeScript の Version
  https://www.npmjs.com/package/typescript?activeTab=versions
