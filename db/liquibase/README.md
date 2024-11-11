# Liquibase

## Installation

1. use this link: https://docs.liquibase.com/start/install/liquibase-linux.html
2. mkdir -p /opt/liquibase && cd /opt/liquibase
3. download the tar and the core-jar files
4. untar the files
5. add 'export PATH=$PATH:/opt/liquibase/' to the end of .bashrc file
6. source ~/.bashrc
7. liquibase --version

## For update
1. download the right [extension](https://github.com/liquibase/liquibase-mongodb/releases/tag/liquibase-mongodb-4.0.0.2) and the proper [jdbc-jar](https://repo1.maven.org/maven2/org/mongodb/mongo-java-driver/3.10.0/) for mongo
2. copy these two to /opt/liquibase/lib
3. liquibase status
4. liquibase status --log-level debug [if needed]
5. liquibase update
6. liquibase update --changeLogFile=./changelogs/run-command.yaml
