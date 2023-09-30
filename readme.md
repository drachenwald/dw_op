# Set up your local environment (this assumes a mac terminal environment)

## Set up database

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

## Start the Flask app

```shell
pip install virtualenv

virtualenv venv

source ./venv/bin/activate

pip install -r requirements.txt

flask --app viewer run
```

### Alternative for `flask --app viewer run`:

```shell
export FLASK_APP=viewer.py
export FLASK_DEBUG=true

flask run
```


# Local docker

```
docker-compose up
```

The website can be found at 127.0.0.1:5000.

## Diagnose and troubleshoot

The database container, upon not having a database, reads the files in `sql-init/` and execute that SQL.

To view the database container:

```shell
docker ps # show running containers
docker exec -it dw_op_db_1 bash # get a Bash shell into the container
```

If you wish to remove the whole dataset:

```shell
docker volume rm dw_op_data
```
