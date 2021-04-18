import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> connectToDB() async {
  final conn = PostgreSQLConnection(
    'localhost',
    5435,
    'todoapp-db',
    username: 'postgres',
    password: 'testpass',
  );
  await conn.open();
  return conn;
}
