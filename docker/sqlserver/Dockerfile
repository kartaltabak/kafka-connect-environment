FROM mcr.microsoft.com/mssql/server:2022-latest

COPY sqlserver-setup.sql /scripts/init.sql
COPY --chmod=755 init-database.sh /init-database.sh

ENTRYPOINT ["/init-database.sh"]
