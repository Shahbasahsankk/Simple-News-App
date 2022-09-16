import 'dart:convert';
import 'dart:developer';

import 'package:api_news_sample/constants/api_end_points.dart';
import 'package:api_news_sample/models/person_data.dart';
import 'package:http/http.dart' as http;

class PersonService{
  Future<PersonData> getPersonData()async{
    var uri=Uri.parse(ApiEndPoints.PersonApi);
    var response= await http.get(uri);
    try {
      if(response.statusCode>=200&& response.statusCode<=299){
      var jsonData=response.body;
      log(jsonData.toString());
      var jsonAsBody=await jsonDecode(jsonData);
      var finalJson= PersonData.fromJson(jsonAsBody);
      return finalJson;
   }else{
    throw Exception('');
   }
    } catch (e) {
      throw Exception(e.toString());
    }
   
  }
}