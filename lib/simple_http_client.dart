import 'dart:io';

import 'package:http/http.dart' as http;

class SimpleHttpClient {
  late http.Client client;

  SimpleHttpClient() {
    client = http.Client();
  }

  /// Makes a GET request to the given URL and returns the response body as a String.
  Future<String> get(String url) async {
    final response = client.get(Uri.parse(url));

    return response.then(
      (value) {
        if (value.statusCode == HttpStatus.ok) {
          return value.body;
        } else {
          throw Exception('Failed to load data');
        }
      },
    );
  }
}
