import 'dart:convert';

import 'package:web_blog/utils/constants.dart';
import 'package:web_blog/services/api_service.dart';

import '../models/blog.dart';

class BlogRepository {
  ApiService apiService;

  BlogRepository(this.apiService);

  Future<List<Blog>> getBlogs() async {
    try {
      final resp = await apiService.get(path: Constant.blogPath);
      final List<dynamic> data = json.decode(resp.body);
      
      List<Blog> blogs = data.map((blog) => Blog.fromJson(blog)).toList();
      return blogs;
    } catch (e) {
      rethrow;
    }
  }
}