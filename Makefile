DBNAME=dark
HOSTNAME=localhost
USER=dark
PASS=darkpass

help:
	cat Makefile

fluentd:
	env DBNAME=$(DBNAME) \
		HOSTNAME=$(HOSTNAME) \
		USER=$(USER) \
		PASS=$(PASS) fluentd -c ./slack-mysql.conf

init-dbup: dbup.phar
	php $< init

migrate: dbup.phar
	$(MAKE) __env_dbup command='php $< up'

status: dbup.phar
	php $< status

dbup.phar:
	wget https://github.com/brtriver/dbup/raw/master/dbup.phar

__env_dbup:
	env DBUP_DBNAME=$(DBNAME) \
		DBUP_HOSTNAME=$(HOSTNAME) \
		DBUP_USER=$(USER) \
		DBUP_PASS=$(PASS) $(command)

