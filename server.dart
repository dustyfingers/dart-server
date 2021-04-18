import 'dart:io';
import 'dart:convert';

import 'controllers/todo_controller.dart';

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 5000);
  print('Server started on port ${server.port}');

  await for (HttpRequest req in server) {
    // req.uri.path, req.method and req.headers would be pretty useful for creating endpoints...

    switch (req.uri.path) {
      case '/':
        try {
          String dataAsJson = await utf8.decoder.bind(req).join();
          var dataAsMap = jsonDecode(dataAsJson) as Map;
          print(dataAsJson);
          print(dataAsMap);
          req.response.write(dataAsJson);
          await req.response.close();
        } catch (error) {
          print(error);
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
}
