import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> connectToDB() async {
  var connection = PostgreSQLConnection("localhost", 5432, "todoapp-db",
      username: "testadmin", password: "testpass");
  await connection.open();
  return connection;
}
