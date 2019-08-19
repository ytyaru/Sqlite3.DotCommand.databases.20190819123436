SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# 予約DB名
sqlite3 :memory: \
"attach database 'A.db' as 'temp';" \
".databases"

sqlite3 :memory: \
"attach database 'A.db' as 'main';" \
".databases"

