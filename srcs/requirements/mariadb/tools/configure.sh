service mysql start 2>/dev/null;

if ! test -d /var/lib/mysql/$MYSQL_DATABASE; then
	mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;
						CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
						GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;
						FLUSH PRIVILEGES;"
	mysqladmin -u root password "$MYSQL_ROOT_PASS" 
fi

sleep 3 ;	# Give mysql service time to start up and process commands before stopping.
mysqladmin -u root --password=$MYSQL_ROOT_PASS shutdown

mysqld --bind-address=0.0.0.0