#!/bin/bash
echo "Waiting for SQL Server to start..."
until /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "SELECT 1" -C &>/dev/null; do
    sleep 2
done

DB_EXISTS=$(/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" \
    -Q "SET NOCOUNT ON; SELECT COUNT(*) FROM sys.databases WHERE name='EmailApp'" \
    -C -h -1 | tr -d ' ')

if [ "$DB_EXISTS" -eq "0" ]; then
    echo "Creating database..."
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "CREATE DATABASE EmailApp" -C
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -d EmailApp -i /init.sql -C
else
    echo "Database already exists, skipping init."
fi

echo "Database initialized."