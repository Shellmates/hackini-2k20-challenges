#!/usr/bin/python3
import os
from datetime import datetime

log_file = "/home/sysadmin/logs.txt"
backup_dir = "/home/sysadmin/backups"
time = datetime.strftime(datetime.now(), "%Y-%m-%d %H:%M:%S")

php_sessions = []

for f in os.listdir('/tmp'):
    if f[:5] == 'sess_':
        php_sessions.append(f)

if not os.path.exists(backup_dir):
    os.mkdir(backup_dir)

if php_sessions:
    with open(log_file, 'a') as log:
        log.write('{} => Backing up the following files:\n'.format(time))
        for sess in php_sessions:
            log.write('\t- {}\n'.format(sess))
            os.system('/bin/cp "/tmp/{0}" "{1}/{0}"'.format(sess, backup_dir))
        log.write('-'*50 + '\n')
