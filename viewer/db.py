import mysql.connector

import click
from flask import current_app, g

def connect_db():
    try:
        mysqluser = current_app.config['DB_USER']
        mysqlpwd = current_app.config['DB_PWD']
        mysqldb = current_app.config['DB_DATABASE']
        dbhost = current_app.config['DB_HOST']

        return mysql.connector.connect(user=mysqluser, password=mysqlpwd, host=dbhost, database=mysqldb, autocommit=True)
    except Exception as e:
        raise Exception("error: %s - %s - %s" % (None, None, e))


def close_db(app=None):
    db = g.pop('db', None)

    if db is not None:
        db.close() # https://dev.mysql.com/doc/connector-python/en/connector-python-example-connecting.html


def get_db():
    if 'db' not in g:
        g.db = connect_db()
    return g.db


def init_app(app):
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)

def init_db():
    db = get_db()

    with current_app.open_resource('sql-init/dev-db.sql') as f:
        db.executescript(f.read().decode('utf8'))


@click.command('init-db')
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Initialized the database.')