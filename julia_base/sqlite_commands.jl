using LinearAlgebra
using Statistics
using SQLite
using DataFrames
Pkg.status()

db = SQLite.connect("D:/DATASA/Templates/CORE_HOT_HTML/CISE_DB.db")
mem = SQLite.DB()

tables = SQLite.query(db, "select name from sqlite_master where type = 'table'")
SQLite.query(db, "select * from cise LIMIT 5")

df1 = query("select * from tblcsdata");
head(df1, 2)
df2 = sqldf("select * from df1 where AGE between 25 and 30");
df3 = sqldf("select age, avg(LEV_LT3) as avg_lev from df2 group by age")

dt = DataFrame(zeros(5, 5))
r = SQLite.Query(db, "select * from $tablename") |> DataFrame
 
db = SQLite.DB("Chinook_Sqlite.sqlite")
	
SQLite.query(db, "SELECT * FROM Genre WHERE regexp('e[trs]', Name)")
SQLite.query(db, "SELECT * FROM Genre ORDER BY GenreId LIMIT 2")
SQLite.query(db, "INSERT INTO Genre VALUES (regexp('^word', 'this is a string'), 'My Genre')")
SQLite.query(db, "SELECT * FROM Genre ORDER BY GenreId LIMIT 2")
SQLite.query(db, "SELECT * FROM MediaType WHERE Name REGEXP '-\d'")
SQLite.query(db, "SELECT * FROM MediaType WHERE Name REGEXP '-d'")
SQLite.query(db, "SELECT * FROM MediaType WHERE Name REGEXP '-\\d'")
SQLite.query(db, "SELECT * FROM MediaType WHERE Name REGEXP '-\d'")

@register db function add3(x)
	x + 3
end
@register db mult3(x) = 3 * x

@register db sin

dsum(prev, cur) = prev + cur
dsum(prev) = 2 * prev
SQLite.register(db, 0, dsum, dsum)
SQLite.register(db, 0, (p,c) -> p+c, p -> 2p, name="dsum")
