# Enju IRモジュール

Next-L Enjuに機関リポジトリの機能を追加するモジュールです。

## インストール

Next-L Enjuの``Gemfile``に以下の行を追加します。

```
gem 'enju_ir', github: 'next-l/enju_ir'
```

モジュールのインストールを実行します。

```sh
$ bundle update
$ rake enju_ir:engine:migrations
$ rake db:migrate RAILS_ENV=production
```

``config/routes.rb``に以下の行を追加します。


```
mount EnjuIr::Engine, at: '/ir', as: :enju_ir
```

Enjuを再起動し、``/ir/datasets``を開きます。

## インポート

TBD

## 作者

- 田辺浩介 (@nabeta)
