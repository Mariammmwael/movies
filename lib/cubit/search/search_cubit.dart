import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/cubit/search/search_state.dart';
import 'package:movieapp/data/repository/movie_repositry.dart';

class SearchCubit extends Cubit<SearchState> {
  final MovieRepository repository;

  SearchCubit(this.repository) : super(SearchInitial());

  Future<void> searchMovies(String query) async {
    emit(SearchLoading());

    try {
      final movies = await repository.searchMovies(query);

      emit(SearchSuccess(movies));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
