# dw_op

This repository contains the code for the Drachenwald Order of Precedence. It is a Flask app, programmed in Python.

The repository does not contain any personal information, and has only database structure, and test data in it.

## Set up your local environment (this assumes a mac terminal environment)

### Set up database

Create a sqlite file named op.sqlite with the contents of the op.sqlite.sql file, then spool that data over to MySQL. Our application's history began with sqlite, and is now using MySQL.

```shell
sqlite3 op.sqlite < op.sqlite.sql
mysql -uroot 'CREATE DATABASE drachdb;'
mysql -uroot "GRANT ALL PRIVILEGES ON drachdb.* TO 'op'@'localhost' IDENTIFIED BY 'op';"
```

So, now you have an empty local MySQL database, primed to transfer the sqlite data into.

With a virtualenv running:

```shell
python transferdb.py
```

### Start the Flask app

```shell
pip install virtualenv

virtualenv venv

source ./venv/bin/activate

pip install -r requirements.txt

flask --app viewer run
```

#### Alternative for `flask --app viewer run`:

```shell
export FLASK_APP=viewer.py
export FLASK_DEBUG=true

flask run
```


## Local docker

```
docker-compose up
```

The website will be served on http://0.0.0.0:5000.

The database runs on a MariaDB instance. You can print its version like:

```shell
$ docker exec -ti dw_op-db-1  mariadb --version
mariadb from 11.1.2-MariaDB, client 15.2 for debian-linux-gnu (x86_64) using  EditLine wrapper
```



### Updating your website

<details>

<summary>What it looks like when troubleshooting</summary>

```shell
askja:dw_op hennar$ ls
__pycache__		editor.py		requirements.txt	templates
auth.py			editor.wsgi		shield.svg		transferdb.py
combo.wsgi		get_armorial.py		sql-init		viewer.py
config.py		op.sqlite.sql		start_op_ovh.sh		viewer.wsgi
docker-compose.yml	readme.md		static
askja:dw_op hennar$ cd sql-init/
askja:sql-init hennar$ ls
dev-db.sql	dev-db2.sql
askja:sql-init hennar$ bbedit dev-db.sql 
askja:sql-init hennar$ vim dev-db.sql 
askja:sql-init hennar$ ls
dev-db.sql	dev-db2.sql
askja:sql-init hennar$ docker ps
CONTAINER ID   IMAGE        COMMAND                  CREATED          STATUS          PORTS                      NAMES
7a063fbb8acf   mariadb      "docker-entrypoint.s…"   27 minutes ago   Up 27 minutes   0.0.0.0:3306->3306/tcp     dw_op_db_1
a5afb60bc967   python:3.5   "bash -c 'cd /build …"   27 minutes ago   Up 27 minutes   127.0.0.1:5000->5000/tcp   dw_op_python_1
askja:sql-init hennar$ docker exec -it dw_op_db_1 bash
root@7a063fbb8acf:/# exit
exit
askja:sql-init hennar$ ls
dev-db.sql	dev-db2.sql
askja:sql-init hennar$ cd..
-bash: cd..: command not found
askja:sql-init hennar$ cd ..
askja:dw_op hennar$ ls
__pycache__		config.py		editor.wsgi		readme.md		sql-init		templates		viewer.wsgi
auth.py			docker-compose.yml	get_armorial.py		requirements.txt	start_op_ovh.sh		transferdb.py
combo.wsgi		editor.py		op.sqlite.sql		shield.svg		static			viewer.py
askja:dw_op hennar$ docker volume ls
DRIVER    VOLUME NAME
local     dw_op2_data
local     dw_op_data
askja:dw_op hennar$ docker volume ls
DRIVER    VOLUME NAME
local     dw_op2_data
local     dw_op_data
askja:dw_op hennar$ docker volume rm dw_op_data
Error response from daemon: remove dw_op_data: volume is in use - [7a063fbb8acf3f036dbd7cfcc6b1eebb7253bfe29ec600f5b62c6d646651d46b]
askja:dw_op hennar$ docker volume rm dw_op_data
dw_op_data
askja:dw_op hennar$ 
```

</details>

### Diagnose and troubleshoot

The database container, upon not having a database, reads the files in `sql-init/` and execute that SQL.

To view the database container:

```shell
docker ps # show running containers
docker exec -it dw_op_db_1 bash # get a Bash shell into the container
```

If you wish to remove the whole dataset, so that next time you start Docker Compose, it is reinitialized from sql-init files.

```shell
docker volume rm dw_op_data
```

To interact with the database using the normal CLI interface:

```shell
$ docker exec -ti dw_op-db-1  mariadb -uop -pop
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 36
Server version: 11.1.2-MariaDB-1:11.1.2+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> USE drachdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [drachdb]>
```

# Production information
the OP uses a google service account to send email & add recommendations to a spreadsheet. The details for this account can be found under the workspace admin accounts on https://console.cloud.google.com/
https://apps.google.com/supportwidget/articlehome?hl=en&article_url=https%3A%2F%2Fsupport.google.com%2Fa%2Fanswer%2F7378726%3Fhl%3Den&assistant_id=generic-unu&product_context=7378726&product_name=UnuFlow&trigger_context=a
