import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String postsEndpoint = '/posts';

  Future<List<PostModel>> fetchPosts({required int page, required int limit}) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl$postsEndpoint?_page=$page&_limit=$limit'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
