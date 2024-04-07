import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pool_data/domain/entities/match.dart' as pd;
import 'package:pool_data/domain/entities/user.dart';

class Request {
  static String link =
      "https://eu-central-1.aws.services.cloud.mongodb.com/api/client/v2.0/app/data-jtnzf/auth/providers/anon-user/login";
  static String? accessToken;
  static String? refreshToken;
  static String? userId;
  static const String endpoint = "https://eu-central-1.aws.data.mongodb-api.com/app/data-jtnzf/endpoint/data/v1";

  static Future<void> sendPostRequest() async {
    var url = Uri.parse(link);
    var response = await http.post(
      url,
    );
    Map<String, dynamic> parsedResponse = json.decode(response.body);

    accessToken = parsedResponse['access_token'];
    refreshToken = parsedResponse['refresh_token'];
    userId = parsedResponse['user_id'];
  }

  static Future<void> getMatches(List<pd.Match> matchList) async {
    var response = await Dio().post(
      '$endpoint/action/find',
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "poolData",
          "collection": "matches",
        },
      ),
    );
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      matchList.add(pd.Match.fromJson(docs.elementAt(index)));
    }
  }

  static Future<void> getUsers(List<User> userList) async {
    var response = await Dio().post(
      '$endpoint/action/find',
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "poolData",
          "collection": "users",
        },
      ),
    );
    List docs = response.data['documents'];
    for (int index = 0; index < docs.length; index++) {
      userList.add(User.fromJson(docs.elementAt(index)));
    }
  }

  static Future<void> addMatch(Map<String, dynamic> json) async {
    var url = "$endpoint/action/insertOne";

    await Dio().post(
      url,
      options: Options(
        headers: {
          "content-type": "application/json",
          "Authorization": 'Bearer $accessToken',
        },
      ),
      data: jsonEncode(
        {
          "dataSource": "Cluster0",
          "database": "poolData",
          "collection": "matches",
          "document": json,
        },
      ),
    );
  }
}
