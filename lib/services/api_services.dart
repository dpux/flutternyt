import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nytapp/models/article_model.dart';
import 'package:nytapp/services/apikeys/api_key.dart';
import 'package:nytapp/services/apikeys/api_key_loader.dart';


class APIService {
  final String _baseUrl = "api.nytimes.com";
//  static const String API_KEY = ApiKeyLoader("apikeys.json").load("nyt").asStream().toString().;

  Future<List<Article>> fetchArticlesBySection(String section) async {

    ApiKey apiKey = await ApiKeyLoader(apiKeyPath: "apikeys.json").load("nyt");

    Map<String, String> params = {
      'api-key': apiKey.apiKey
    };

    Uri uri = Uri.https(_baseUrl, '/svc/topstories/v2/$section.json', params);

    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      List<Article> articles = [];
      data['results'].forEach(
          (articleMap) => articles.add(Article.fromMap(articleMap))
      );
      return articles;
    } catch (e) {
      throw e.toString();
    }

  }

}