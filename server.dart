import 'dart:io';
import 'dart:convert';

import 'controllers/todo_controller.dart';
import 'config/db.dart';

Future main() async {
  try {
    var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 5000);
    var db = await connectToDB();

    print(db);

    print('Server started on port ${server.port}');

    await for (HttpRequest req in server) {
      // req.uri.path, req.method and req.headers would be pretty useful for creating endpoints...

      switch (req.uri.path) {
        case '/':
          try {
            String dataAsJson = await utf8.decoder.bind(req).join();
            var dataAsMap = jsonDecode(dataAsJson) as Map;
            req.response.write(dataAsJson);
            await req.response.close();
          } catch (error) {
            req.response.write(error);
            await req.response.close();
          }
          break;
        case '/todo':
          // fetch, create, edit and delete todo routes here
          break;
        default:
          req.response.write('');
          await req.response.close();
      }
    }
  } catch (error) {
    print(error);
    print('couldn\'t start server.');
  }
}
