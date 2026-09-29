sealed class BrowseState {}

final class BrowseInitial extends BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseSuccess extends BrowseState {}

class BrowseGenreSelected extends BrowseState {}

class BrowseError extends BrowseState {
  final String message;

  BrowseError(this.message);
}
