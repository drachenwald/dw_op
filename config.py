import os

DB_USER = os.getenv('DW_OP_DB_USER', 'op')
DB_PWD = os.getenv('DW_OP_DB_PWD', 'op')
DB_DATABASE = os.getenv('DW_OP_DB_DATABASE', 'drachdb')
DB_HOST = os.getenv('DW_OP_DB_HOST', 'db')

DISABLE_AUTH = False
BASE_DIR = os.path.dirname(os.path.realpath(__file__))
DB_PATH = os.path.join(BASE_DIR, 'op.sqlite') # only used in the editor.py

USERS = (
    (
        'admin',
        'pbkdf2:sha256:50000$qb7HDOK3$dea256b639a772db6440f447833fcc3cd1951bce1abd2d7216d2153a06ace3b4',
        'Joel Uckelman',
        'uckelman@nomic.net'
    ),
    (
        'posthorn',
        'pbkdf2:sha256:50000$rKxWJQRz$0cd783cdfa8494ba610c4974c31c3747b8ebeaab78e174217118f3011f93ba9a',
        'Posthorn',
        'posthorn@drachenwald.sca.org'
    ),
    (
        'signet',
        'pbkdf2:sha256:50000$RrV4YAQp$afa434495723c87755da12634f9b264ad0646980cceb5e7d93056a00fd6513dc',
        'Signet',
        'signet@drachenwald.sca.org'
    )
)

ARMORIAL_PATH="/home/wiifmqg/dw_op/static/images/arms"
GOOGLE_CRED = {
  "type": "service_account",
  "project_id": "dw-order-of-precedence",
  "private_key_id": "",
  "private_key": "",
  "client_email": "artificial-deputy-for-the-orde@dw-order-of-precedence.iam.gserviceaccount.com",
  "client_id": "111021806773359996540",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/artificial-deputy-for-the-orde%40dw-order-of-precedence.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
