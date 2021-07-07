import 'dart:convert';

class ListApiModel {
  ListApiModel({this.userDataList});

  factory ListApiModel.fromJson(json) {
    List<SampleModel> userDataListData = [];
    json['articles']
        .forEach((x) => userDataListData.add(SampleModel.fromJson(x)));
    userDataListData.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    return ListApiModel(userDataList: userDataListData);
  }

  List<SampleModel> userDataList = [];
}

class SampleModel {
  SampleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
