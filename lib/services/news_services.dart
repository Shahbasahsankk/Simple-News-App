import 'dart:convert';

import 'package:api_news_sample/constants/api_end_points.dart';
import 'package:api_news_sample/models/news.dart';
import 'package:http/http.dart'as http;

class NewsServices{
  Future<TopHeadlinesModel>getNews() async{
    var uri=Uri.parse(ApiEndPoints.topHeadlines);
    var response=await http.get(uri);
    if(response.statusCode>=200&& response.statusCode<=299){
      var jsonData= response.body;
      var jsonAsBody=await jsonDecode(jsonData);
      var data= TopHeadlinesModel.fromJson(jsonAsBody); 
      return  data;
    }else{
      throw Exception('Error Occured');
    }
    
  }
}