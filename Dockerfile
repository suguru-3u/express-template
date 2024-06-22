# ベースイメージとしてNode.jsを指定
# FROM node:20-alpine

# # コンテナ内の作業スペースの指定
# WORKDIR /usr/app

# # package.jsonとpackage-lock.jsonを最初にコピー
# COPY package*.json ./

# # ライブラリーのインストール
# RUN npm install

# # その他のファイルをコピー
# COPY . .

# # TypeScriptをビルド
# RUN npm run build

# # Dockerのポート番号の開放
# EXPOSE 3000


# 開発環境
FROM node:20-alpine AS development
WORKDIR /usr/app
# パッケージインストール
COPY package*.json ./
RUN npm ci
# アプリケーションソースのコピー
COPY . .
# 開発用にアプリケーションをビルド
RUN npm run build

# 依存パッケージのインストール
FROM node:20-alpine as base
WORKDIR /usr/app
# packeg.jsonとpackage-lock.jsonのみコピーする
COPY package*.json ./
RUN npm ci

# Build環境
FROM node:20-alpine as builder
WORKDIR /usr/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# 実行環境
FROM node:20-alpine as production
WORKDIR /usr/app
ENV NODE_ENV production
COPY --from=base /usr/app/node_modules ./node_modules
COPY --from=builder /usr/app/dist ./dist
COPY --from=builder /usr/app/package.json ./
EXPOSE 3000