import 'package:flutter_app_news/apiProvider/repository.dart';
import 'package:flutter_app_news/model/sample_model.dart';
import 'package:rxdart/rxdart.dart';

class SampleBloc {
  final _repository = Repository();
  final _dataFromAPI = BehaviorSubject<ListApiModel>();

  Observable<ListApiModel> get dataFromAPIStream => _dataFromAPI.stream;

  Future<ListApiModel> getData() async {
    final apiData = await _repository.getDataFromAPI();
    _dataFromAPI.sink.add(apiData);
  }

  disponse() {
    _dataFromAPI.close();
  }
}
