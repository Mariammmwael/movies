import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> searchMovies(String query) {
    return dio.get(
      'https://movies-api.accel.li/api/v2/list_movies.json',
      queryParameters: {'query_term': query},
    );
  }
}
