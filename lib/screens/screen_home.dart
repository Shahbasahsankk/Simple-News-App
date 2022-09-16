import 'package:api_news_sample/models/news.dart';
import 'package:api_news_sample/screens/screen_person.dart';
import 'package:api_news_sample/services/news_services.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const hei = SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonHome()),
              );
            },
            icon: const Icon(Icons.arrow_forward),
          )
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: NewsServices().getNews(),
        builder:
            (BuildContext context, AsyncSnapshot<TopHeadlinesModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error Occured'),
            );
          }else
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView(
              children: List.generate(
                data!.articleList.length,
                (index) {
                  return Column(
                    children: [
                      Image.network(data.articleList[index].imageUrl),
                      Text(data.articleList[index].author),
                      hei,
                      Text(data.articleList[index].title),
                      hei,
                      Text(data.articleList[index].description),
                    ],
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        },
      ),
    );
  }
}
