# ベースイメージとしてNode.jsを指定
FROM node:20-alpine

# コンテナ内の作業スペースの指定
WORKDIR /usr/app

# package.jsonとpackage-lock.jsonを最初にコピー
COPY package*.json ./

# ライブラリーのインストール
RUN npm install

# その他のファイルをコピー
COPY . .

# TypeScriptをビルド
RUN npm run build

# Dockerのポート番号の開放
EXPOSE 3000


