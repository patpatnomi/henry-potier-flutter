import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl;

  NetworkService({required this.baseUrl});

  Future getData(String endpoint) async {
    try {
      final url = baseUrl + endpoint;
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw NetworkException('Failed to fetch $url');
      }
    } on SocketException {
      throw NetworkException('No Internet Connection');
    }
  }
}

class NetworkException implements Exception {
  final String _message;

  NetworkException(this._message);

  @override
  String toString() {
    return _message;
  }
}
