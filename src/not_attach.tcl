package require sqlite3

proc openInMem { db db_name } { sqlite3 $db file:$db_name?mode=memory&cache=shared -uri true }
proc create { db tbl_name } { $db eval "CREATE TABLE $tbl_name (id INT,name TEXT);" }
proc insert { db tbl_name } { $db eval "INSERT INTO $tbl_name VALUES (1,'yamada');" }
proc show { db tbl_name } {
    set result [$db eval "SELECT * FROM $tbl_name;"]
    foreach row $result {
        puts $row
    }
}
openInMem dbA1 "memdbA"
create dbA1 "AAA"
openInMem dbA2 "memdbA"
insert dbA2 "AAA"

show dbA1 "AAA"
show dbA2 "AAA"

openInMem dbB1 "memdbB"
create dbB1 "BBB"
openInMem dbB2 "memdbB"
insert dbB2 "BBB"

show dbB1 "BBB"
show dbB2 "BBB"

# no such table
#dbA1 eval { select * from BBB }
#dbA2 eval { select * from BBB }
#dbB1 eval { select * from AAA }
#dbB2 eval { select * from AAA }

dbA1 close
dbA2 close
dbB1 close
dbB2 close
