import 'dart:convert';
import 'package:flutter_app_news/model/sample_model.dart';
import 'package:http/http.dart' as http;

class SampleAPI {
  Future<ListApiModel> getDataFromAPI() async {
    final response = await http.get(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=921dfa03539246f28c1f24bcc5e1ca7e');
    final data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //print(data);
      return ListApiModel.fromJson(data);
      //return data.sort((a, b) => b['publishedAt'].compareTo(a['publishedAt']));
    } else {
      print('Data Not Found');
    }
  }
}
