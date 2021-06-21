// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url, headers: {
      "Authorization":
          "563492ad6f91700001000001a08cee7d253a4577a3b22fcedcddbcc1",
    });

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw Exception('Failed to load data!');
    }
  }
}
