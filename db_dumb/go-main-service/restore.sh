#!/bin/bash
# restore.sh - Script to restore the database

echo "Starting restore script..."

# Wait until MySQL is ready (using TCP connection check)
echo "Waiting for MySQL to be ready..."
until mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" ping --host=localhost --silent; do
  echo "Waiting for MySQL to start..."
  sleep 5
done

# Log the start of the restoration
echo "MySQL is ready. Starting database restoration..."

# Set MySQL time zone
echo "Setting MySQL time zone to Asia/Calcutta..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SET GLOBAL time_zone = 'Asia/Bangkok';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SET time_zone = '+07:00';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SET @@session.time_zone = '+07:00';"

# Create the user 'sen_master' (only if not already created)
echo "Creating user 'sen_master'..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Grant 'sen_master' user permissions on 'sen_master_db' only
echo "Granting permissions to 'sen_master' on 'sen_master_db'..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# Restore the database from the dump
echo "Restoring database from backup..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" < /docker-entrypoint-initdb.d/go-main-service-db-dump.sql

# Check if the restore was successful
if [ $? -eq 0 ]; then
    echo "Database restored successfully."
else
    echo "Error during database restoration."
fi
