import 'dart:convert';
import 'package:http/http.dart';

class RemoteService {
  var client = Client();
  Future<Response> get({
    required String url,
    Map<String, String>? header,
    Map<String, String>? body,
  }) async {
    late Response response;
    if (body != null) {
      var request = Request('GET', Uri.parse(url));
      request.body = json.encode(body);
      if (header != null) {
        request.headers.addAll(header);
      }
      final responseStream = await client.send(request);
      response = await Response.fromStream(responseStream);
      print(response.body);
    } else {
      response = await client.get(
        Uri.parse(url),
        headers: header,
      );
    }
    return response;
  }

  Future<Response> post({
    required String url,
    Map<String, String>? header,
    Map<String, String>? body,
  }) async {
    late Response response;
    if (body != null) {
      var request = Request('POST', Uri.parse(url));
      request.body = json.encode(body);
      if (header != null) {
        request.headers.addAll(header);
      }
      final responseStream = await client.send(request);
      response = await Response.fromStream(responseStream);
      print(response.body);
    } else {
      response = await client.post(
        Uri.parse(url),
        headers: header,
        body: body,
      );
    }
    return response;
  }
}
