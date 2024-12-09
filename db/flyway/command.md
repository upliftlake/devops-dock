

docker run --rm -v "{absolute path to folder to store SQLite db file}:/flyway/db" -v "{absolute path to folder containing sql migrations}:/flyway/sql" -v "{absolute path to folder containing conf file}:/flyway/conf" redgate/flyway migrate

```sh
docker run --rm -v "/home/crispyCoffee/pipelines/upliftlake/devops-dock/db/flyway/sqlitedb:/flyway/db" -v "/home/crispyCoffee/pipelines/upliftlake/devops-dock/db/flyway/sqlitedb:/flyway/sql" -v "/home/crispyCoffee/pipelines/upliftlake/devops-dock/db/flyway/sqlitedb:/flyway/conf" redgate/flyway migrate
```

# Tutorial
https://documentation.red-gate.com/fd/tutorial-using-mongodb-with-flyway-225609601.html
https://documentation.red-gate.com/fd/quickstart-docker-205226373.html
https://documentation.red-gate.com/fd/mongodb-225608320.html
