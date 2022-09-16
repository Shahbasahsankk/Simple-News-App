import 'package:api_news_sample/constants/api_key.dart';
import 'package:api_news_sample/constants/strings.dart';

class ApiEndPoints{
  static const String topHeadlines="$kBaseUrl/top-headlines?country=us&apiKey=$apiKey";
  static const String PersonApi='https://reqres.in/api/users?page=2';
}