SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 A.db ".exit"
sqlite3 B.db ".exit"

sqlite3 :memory: \
"attach database 'A.db' as 'A';" \
"attach database 'B.db' as 'B';" \
".databases"

