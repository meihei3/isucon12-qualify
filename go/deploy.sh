#!/bin/bash
set -x

echo "start deploy ${USER}"
for server in isu01; do
  ssh -t $server "cd webapp; docker compose -f docker-compose-go.yml down"
  # ローカルでビルドしたファイルを本番反映
  scp ./isuports.go $server:/home/isucon/webapp/go/isuports.go
  # ../sql/ に SQLファイルがあればやる
  scp ../sql/init.sql $server:/home/isucon/webapp/sql/init.sql
  scp ../sql/init.sh $server:/home/isucon/webapp/sql/init.sh
  scp ../sql/sqlite3-to-mysql.sh $server:/home/isucon/webapp/sql/sqlite3-to-mysql.sh
  ssh -t $server "cd webapp; docker compose -f docker-compose-go.yml up -d --build"
done
