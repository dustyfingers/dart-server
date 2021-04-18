import 'dart:io';
import 'dart:convert';

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 5000);

  print('Server started on port ${server.port}');

  await for (HttpRequest request in server) {
    String content = await utf8.decoder.bind(request).join();
    var data = jsonDecode(content) as Map;
    print(content);
    print(data);
    await request.response.close();
  }
}
