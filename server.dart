import 'dart:io';
import 'dart:convert';

import 'config/db.dart';

Future main() async {
  try {
    var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 5000);
    var db = await connectToDB();

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
        case '/todos':
          // fetch all, create, edit and delete todo routes here
          switch (req.method) {
            // TODO: fetch all
            case 'GET':
              break;
            // TODO: create post
            case 'POST':
              // TODO: pull this functionality out into the todo_controller
              try {
                // parse json from incoming request
                String reqBody = await utf8.decoder.bind(req).join();
                Map reqBodyMap = await jsonDecode(reqBody);
                String description = reqBodyMap['description'];
                bool completed = reqBodyMap['completed'];

                await db.query(
                    '''INSERT INTO Todos (description, completed) VALUES ('$description','$completed')''');

                print('this happens');

                var res = jsonEncode({'message': 'Todo created successfully'});
                req.response.write(res);
                await req.response.close();
              } catch (error) {
                var res = jsonEncode({
                  'error': error,
                  'message': 'There was an error while creating a todo.'
                });
                req.response.write(res);
                await req.response.close();
              }
              break;
            // TODO: edit post
            case 'PUT':
              break;
            // TODO: delete post
            case 'DELETE':
              break;
            default:
              req.response.write('Invalid request.');
              await req.response.close();
          }
          break;
        default:
          req.response.write('Invalid request.');
          await req.response.close();
      }
    }
  } catch (error) {
    print(error);
    print('Error with server. Server crashed.');
  }
}
