import 'package:dio/dio.dart';


class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:8080/api/v1/wallet",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      }
    )
  );

  //GET
  Future<List<dynamic>> fetchPosts() async {
    try {
      final response = await dio.get('/get_all');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Erro ao buscar posts: ${e.message}');
    }
  }

  //POST
  Future<Map<String, dynamic>> create(Map<String, dynamic> postData) async {
    try {
      final response = await dio.post('/insert', data: postData);
      return response.data;
    } on DioException catch (e) {
      throw Exception('Erro ao buscar posts: ${e.message}');
    }
  }
}