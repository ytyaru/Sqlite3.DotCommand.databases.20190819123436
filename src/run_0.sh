SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: ".databases"

sqlite3 A.db ".databases"

sqlite3 :memory: \
"attach database 'A.db' as 'A';" \
".databases"
