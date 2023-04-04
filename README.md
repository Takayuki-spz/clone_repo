# 【概要】

# 【作成背景】

# 【使用技術】
・バックエンド
　Ruby 3.1.2
　Rails 7.0.4
　MySQL 8.0.31
　Rspec
・フロントエンド
　HTML/CSS
　Sass
　JavaScript
　jQuery
　Bootstrap
・インフラ
　docker / docker-compose
　(未実装) Circleci
　(未実装) AWS (Route53,ALB,VPC,subnet,ECR,ECS,RDS,ACM,SSM,cloudWatch)
　(未実装) terraform

# 【機能一覧】
・ユーザー
　新規作成
　ログイン機能
　ログアウト機能
　閲覧
　編集
・フォローフォロワー機能
　閲覧
・タイムライン
　作成
　閲覧
　(未実装) 編集
　削除
　(未実装) いいね機能
・タイムラインへのコメント
　作成
　削除
- 検索
  - (未実装) タグからタイムラインを検索

# 【工夫した点】
## バックエンド
- (未実装) バックエンドとフロントエンドを完全に分離し、API通信を実装
- N+1問題を考慮した実装
- リアルなseedデータを作成
- (未実装) Ckeditorから送られてくるデータをsanitize処理しxss対策を実施

## フロントエンド
- (未実装) 完全SPAで作成シンプルで分かりやすいUIを採用

## インフラ
- (未実装) Dockerを採用することで複数人でも同じ環境を構築できるようにDockerと相性の良いAWS(ECS Fargate)を採用
- (未実装) terraformによるインフラのコード化
- CircleCIを用いてCI/CDパイプラインを構築

# 【今後の実装したいこと】
- typeScriptの検討


