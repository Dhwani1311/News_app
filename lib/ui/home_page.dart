import 'package:flutter/material.dart';
import 'package:flutter_app_news/bloc/sample_bloc.dart';
import 'package:flutter_app_news/model/sample_model.dart';

import 'details.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sampleBloc = SampleBloc();
  @override
  void initState() {
    sampleBloc.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Center(child: Text("News App")),
          backgroundColor: Colors.green[300]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream: sampleBloc.dataFromAPIStream,
          builder: (context, AsyncSnapshot<ListApiModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator()
                  //);
                  );
            }
            ListApiModel sampleApiData = snapshot.data;
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: sampleApiData.userDataList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = sampleApiData.userDataList[index];

                return GestureDetector(
                  child: new Card(
                    child: Column(
                      children: [
                        Container(
                          child: Image.network(
                            item.urlToImage,
                            // width: 100,
                            height: 150,
                          ),
                        ),
                        Container(
                            child: new Text(
                          item.author,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  title: item.title,
                                  description: item.description,
                                  urlToImage: item.urlToImage,
                                  author: item.author,
                                )));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
