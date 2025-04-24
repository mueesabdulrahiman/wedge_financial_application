import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hoxton_wealth_project/models/article.dart';
import 'package:http/http.dart' as http;

class CarouselRepository {
  final url = Uri.parse('https://api-qa.getwedge.com/mock-server/v1/articles');

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(url);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonBody = json.decode(response.body);
        final data = jsonBody['articles'] as List<dynamic>;

        final articles =
            data.take(5).map((json) => Article.fromJson(json)).toList();

        return articles;
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
