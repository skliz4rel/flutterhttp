import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutterhttp/model/post.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/posts')
  Future<List<Post>> getPosts();

  @POST("/posts")
  Future<Post> createPost(@Body() Post post);

  @GET("/posts/{id}")
  Future<Post> getPostById(@Path() String id);

  @DELETE("/posts/{id}")
  Future<Void> deletePostById(@Path() String id);
}
