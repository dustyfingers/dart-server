# Dart and PostgreSQL

This projects demonstrates how to talk to a PostgreSQL database.

## Download and Install Docker

Visit [https://www.docker.com/products/docker-desktop] and click the download button.

## Run the docker-compose file

1. Start the Docker application
2. Build and run your docker-compose file

```bash
docker-compose up -d
```

## Visit Adminer ui in the browser

Visit [http://localhost:8082] and log in with username `testadmin` and password `testpass` and make sure you have PostgreSQL selected under the `system` tab.
Create the `todoapp-db` database with the proper tables in the adminer panel (a 'Todos' table with a description and completed fields).
(You can find the proper table layouts at dbdesigner.com/link-to-project)

## Run the project

Execute this command in your terminal:

```bash
dart server.dart
```
