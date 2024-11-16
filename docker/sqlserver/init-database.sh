#!/bin/bash

SQLCMD="/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P ${MSSQL_SA_PASSWORD} -C "
/opt/mssql/bin/permissions_check.sh /opt/mssql/bin/sqlservr &

echo "Waiting for SQL Server to start..."
timeout=120
elapsed=0
while ! ${SQLCMD} -Q "SELECT 1" ; do
    echo "Executing command ${SQLCMD} -Q \"SELECT 1\""
    echo "Failed"
    sleep 1
    elapsed=$((elapsed + 1))
    if [ $elapsed -ge $timeout ]; then
        echo "SQL Server did not become ready in time. Exiting."
        exit 1
    fi
done
echo "SQL Server is ready!"

echo "Running initialization script..."
${SQLCMD} -i /scripts/init.sql || exit 1
echo "Initialization completed."

wait
