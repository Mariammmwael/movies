import 'package:movieapp/data/api/api_service.dart';
import 'package:movieapp/model/movie_model.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository(this.apiService);

  Future<List<Movies>> searchMovies(String query) async {
    final response = await apiService.searchMovies(query);

    final movieModel = MovieModel.fromJson(response.data);

    return movieModel.data?.movies ?? [];
  }
}
