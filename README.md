Iniciar postges con docker:

docker run --name some-postgres -e POSTGRES_USER=next -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres

Conectarme al contenedor postgres con consola de bash :

<◂> docker exec -it some-postgres bash
root@8ce9d627f638:/#

PARA INICIAR \l ejecutamos:

Para ejecutar el comando "\l", debes primero iniciar el intérprete de comandos "psql" dentro del contenedor de PostgreSQL ejecutando el siguiente comando:

lua

psql -U next
Y me fubnciona \l

Creamos base de datos gorm:

next=# CREATE DATABASE gorm;
CREATE DATABASE
next=#

Listamos base de datos en contenedor docker:
next=# \l

 List of databases
  Name   | Owner | Encoding | Collate  |
  Ctype   | ICU Locale | Locale Provider |
 Access privileges 
-----------+-------+----------+------------+
------------+------------+-----------------+
-------------------
 gorm     | next | UTF8    | en_US.utf8 |
 en_US.utf8 |           | libc           |

 next     | next | UTF8    | en_US.utf8 |
 en_US.utf8 |           | libc           |

 postgres | next | UTF8    | en_US.utf8 |
 en_US.utf8 |           | libc           |

 template0 | next | UTF8    | en_US.utf8 |
 en_US.utf8 |           | libc           |
 =c/next         +
          |      |         |           |
           |           |                |
 next=CTc/next
 template1 | next | UTF8    | en_US.utf8 |
 en_US.utf8 |           | libc           |
 =c/next         +
          |      |         |           |
           |           |                |
 next=CTc/next
(5 rows)

next=# 

Minuto 24 video Fazt: Go PostgreSQL REST API (gorilla/mux, gorm ORM) Golang


Para iniciar y ver conexion base de datos esta bien:
<◂> air .

 __   _  ___ 
 / /\ | | | |_) 
/_/--\ |_| |_| \_ , built with Go 

watching .
watching db
watching routes
!exclude tmp
building...
running...
2023/05/05 17:56:14 Successfully connected to database
Servidor iniciado en http://localhost:8080


VER TABLAS desde contenedor docker:

gorm=# \d
           List of relations
 Schema |    Name    |  Type  | Owner 
--------+--------------+----------+-------
 public | tasks       | table   | next
 public | tasks_id_seq | sequence | next
 public | users       | table   | next
 public | users_id_seq | sequence | next
(4 rows)

gorm=# \d task
Did not find any relation named "task".
gorm=# \d tasks
                                      Table "public.tasks"
  Column   |          Type          | Collation | Nullable |             Def
ault             
-------------+--------------------------+-----------+----------+-----------------
------------------
 id         | bigint                  |          | not null | nextval('tasks_i
d_seq'::regclass)
 created_at | timestamp with time zone |          |         | 
 updated_at | timestamp with time zone |          |         | 
 deleted_at | timestamp with time zone |          |         | 
 title      | text                
