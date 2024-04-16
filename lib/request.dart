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
    try {
      var url = Uri.parse(link);
      var response = await http.post(
        url,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = json.decode(response.body);
        accessToken = parsedResponse['access_token'];
        refreshToken = parsedResponse['refresh_token'];
        userId = parsedResponse['user_id'];
      } else {
        // Handle non-200 status code (e.g., 404, 500)
        print("HTTP Error: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (error) {
      // Handle any other errors that occur during the request
      print("Error sending POST request: $error");
    }
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

  static Future<void> addUser(Map<String, dynamic> json) async {
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
          "collection": "users",
          "document": json,
        },
      ),
    );
  }

  static Future<void> updateUser(String id, int matchWon, int matchLost, int rackWon, int rackLost) async {
    await Dio().post(
      "$endpoint/action/updateOne",
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
          "filter": {
            "_id": {"\$oid": id}
          },
          "update": {
            "\$set": {"matchWon": matchWon, "matchLost": matchLost, "rackWon": rackWon, "rackLost": rackLost}
          }
        },
      ),
    );
  }
}
