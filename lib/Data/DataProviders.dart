import 'dart:convert';

import '/Data/constants.dart';
import 'package:http/http.dart' as http;

import 'model/Posts.dart';

class DataProviders {
  Future<List<Posts>> get_Posts() async {
    try {
      var response = await http.get(Uri.parse(url + '/posts'));

      List<Posts> posts = jsonDecode(response.body)
          .map<Posts>((e) => Posts.fromJson(e))
          .toList();
      return posts;
    } catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }

  Future<Posts> get_Post_ID(int id) async {
    try {
      var response = await http.get(Uri.parse(url + '/posts/$id'));
      print(response.body);
      Posts post = Posts.fromJson(jsonDecode(response.body));

      return post;
    } catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }

  Future<void> add_post(Posts post) async {
    var body = jsonEncode({
      "userId": post.userId,
      "id": post.id,
      "title": post.title,
      "body": post.body
    });
    try {
      var response = await http.post(Uri.parse(url + '/posts'), body: body);
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> update_Post_put(Posts post) async {
    var body = jsonEncode({
      "userId": post.userId,
      "id": post.id,
      "title": post.title,
      "body": post.body
    });
    try {
      var response =
          await http.put(Uri.parse(url + '/posts/${post.id}'), body: body);
      print(response.body);
      print(response.statusCode);
      print(jsonDecode(response.body)['id']);
      return jsonDecode(response.body)['id'];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> update_Post_patch(
    int? uid,
    int? id,
    String? title,
    String? bodyp,
  ) async {
    var body =
        jsonEncode({"userId": uid, "id": id, "title": title, "body": bodyp});
    try {
      var response =
          await http.put(Uri.parse(url + '/posts/${id}'), body: body);
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(
    int? id,
  ) async {
    try {
      var response = await http.delete(
        Uri.parse(url + '/posts/${id}'),
      );
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      throw Exception(e);
    }
  }
}
