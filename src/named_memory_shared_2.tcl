package require sqlite3

proc openInMem { db db_name } { sqlite3 $db file:$db_name?mode=memory&cache=shared -uri true }
#proc openInMem { db db_name } { sqlite3 $db file:$db_name?mode=memory -uri true }
openInMem Main "Users"
openInMem Main "Items"

Main eval { create table users(id integer primary key, name text, has text); }
Main eval { insert into users(name,has) values('Yamada','[1,2]'); }
Main eval { insert into users(name,has) values('Suzuki','[1]'); }
Main eval { insert into users(name,has) values('Tanaka','[]'); }
Main eval { create table items(id integer primary key, name text); }
Main eval { insert into items(name) values('おにぎり'); }
Main eval { insert into items(name) values('日の丸弁当'); }
Main eval { insert into items(name) values('たくあん'); }

set res [Main eval { pragma database_list; }]
puts $res

set res [Main eval { select * from users; }]
puts $res
set res [Main eval { select * from items; }]
puts $res

set res [Main eval { select json_each.value from users u, json_each(u.has); }]
puts $res
set res [Main eval { select json_each.value from users u, json_each(u.has) where json_valid(u.has) and u.name='Yamada'; }]
puts $res
set res [Main eval { select name from items, (select json_each.value from users u, json_each(u.has) where json_valid(u.has) and u.name='Yamada') as has where has.value=items.id; }]
puts $res

Main close
