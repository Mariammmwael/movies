import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/cubit/browse/browse_state.dart';

import 'package:movieapp/data/repository/movie_repositry.dart';
import 'package:movieapp/model/movie_model.dart';

class BrowseCubit extends Cubit<BrowseState> {
  final MovieRepository repository;

  BrowseCubit(this.repository) : super(BrowseInitial());

  List<Movies> movies = [];

  List<Movies> filteredMovies = [];

  List<String> genres = [];

  String? selectedGenre;

  Future<void> getMovies() async {
    emit(BrowseLoading());

    try {
      movies = await repository.getMovies();

      final Set<String> genreSet = {};

      for (final movie in movies) {
        genreSet.addAll(movie.genres ?? []);
      }

      genres = genreSet.toList();

      filteredMovies = movies;

      emit(BrowseSuccess());
    } catch (e) {
      emit(BrowseError(e.toString()));
    }
  }

  void selectGenre(String genre) {
    selectedGenre = genre;

    filteredMovies = movies.where((movie) {
      return movie.genres?.contains(genre) ?? false;
    }).toList();

    emit(BrowseGenreSelected());
  }

  void showAllMovies() {
    selectedGenre = null;

    filteredMovies = movies;

    emit(BrowseGenreSelected());
  }
}
