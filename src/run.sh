SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

./run_0.sh
./run_reserved_db_name.sh
./run_no_use_main.sh
./not_attach.sh
./named_memory_shared.sh
./named_memory_shared_2.sh

