import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nytapp/services/apikeys/api_key.dart';

class ApiKeyLoader {
  final String apiKeyPath;

  ApiKeyLoader({this.apiKeyPath = ""});

  Future<ApiKey> load(String apiName) {
    return rootBundle.loadStructuredData<ApiKey>(this.apiKeyPath,
        (String jsonStr) async {
      final apiKey = ApiKey.fromJson(json.decode(jsonStr), apiName);
      return apiKey;
    });
  }
}
