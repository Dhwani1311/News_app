import 'package:flutter_app_news/apiProvider/sample_api.dart';
import 'package:flutter_app_news/model/sample_model.dart';

class Repository {
  final sampleAPI = SampleAPI();

  Future<ListApiModel> getDataFromAPI() => sampleAPI.getDataFromAPI();
}
