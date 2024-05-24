import 'package:get/get.dart';
import 'package:health_hub_app/users/model/article.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:health_hub_app/api_connection/api_connection.dart';

Future<List<Article>?> getArticles(String userEmail) async {
  try {
    var response = await http.post(
      Uri.parse(API.getArticle),
      body: {'user_email': userEmail},
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      if (responseBody["articleFound"]) {
        List<Article>? list = [];
        print(responseBody); // Ensure to handle this in production
        Map<String, dynamic> article;
        for (article in responseBody["articleData"]) {
          list.add(Article.fromJson(article));
        }
        return list;
      }
    }
  } catch (e) {
    print('${e.toString()}');
  }
}
