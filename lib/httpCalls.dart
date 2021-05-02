import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

Future<Map> postToDB(
    {required String api,
    required String apiKey,
    required Map<String, dynamic> body,
    Map<String, String>? headers}) async {
  final http.Response response = await http.post(
    Uri.parse(api),
    headers: {
      'Content-Type': 'application/json',
      'X-CC-Version': '2018-03-22',
      'X-CC-Api-Key': apiKey,
    },
    body: jsonEncode(body),
  );
  print(response.body);
  return jsonDecode(response.body);
}

Future<Map> getFromDB({required String api, required String apiKey}) async {
  final http.Response response = await http.get(
    Uri.parse(api),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'X-CC-Version': '2018-03-22',
      'X-CC-Api-Key': apiKey,
    },
  );
  return jsonDecode(response.body);
}

Future<Map> putOnDB(
    {required String api, required String apiKey, required Map body}) async {
  final http.Response response = await http.put(Uri.parse(api),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'X-CC-Version': '2018-03-22',
        'X-CC-Api-Key': apiKey,
      },
      body: jsonEncode(body));

  return jsonDecode(response.body);
}

Future<Map> deleteFromDB({required String api, required String apiKey}) async {
  final http.Response response = await http.delete(
    Uri.parse(api),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'X-CC-Version': '2018-03-22',
      'X-CC-Api-Key': apiKey,
    },
  );

  return jsonDecode(response.body);
}
