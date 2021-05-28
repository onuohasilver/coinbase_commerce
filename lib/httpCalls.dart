import 'dart:convert';
import 'package:http/http.dart' as http;

///helper methods for http requests
///TODO: Map httpCalls to Singleton Class

///Generic Post function to make Post API calls
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
  return jsonDecode(response.body);
}

///Generic Get function to make Get API calls
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

///Generic Put function to make Put API calls
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

///Generic Delete function to make delete API calls
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
