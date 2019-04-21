### DockerでHello World
Dockerコンテナを作成し、コンソール上にHello Worldの文字をecho表示する。

Dockerコンテナを作成/実行するときは、docker container runコマンドを使う。

```
$ docker container run Dockerイメージ名 実行コマンド
```

```
$ docker container run ubuntu:latet /bin/echo 'Hello world'
```
