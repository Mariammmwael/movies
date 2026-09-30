import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:movieapp/core/api/yts_api_service.dart';
import 'package:movieapp/core/theme/app_assets.dart';
import 'package:movieapp/core/theme/app_colors.dart';
import 'package:movieapp/features/movie_details/movie_details_screen.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/app_colors.dart';
import 'package:movieapp/cubit/search/search_cubit.dart';
import 'package:movieapp/cubit/search/search_state.dart';
import 'package:movieapp/data/api/api_service.dart';
import 'package:movieapp/data/repository/movie_repositry.dart';
>>>>>>> origin/browse-profile-updateprofile

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();
  List<YtsMovie> searchResults = [];
  bool isLoading = false;
  bool hasSearched = false;

  void _onSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        searchResults = [];
        hasSearched = false;
        isLoading = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    final results = await YtsApiService.searchMovies(query);

    if (mounted) {
      setState(() {
        searchResults = results;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: _onSearch,
                onSubmitted: _onSearch,
                decoration: InputDecoration(
                  hintText: 'Search Movies...',
                  hintStyle: const TextStyle(color: Colors.white38),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/image/saerch.png',
                      width: 20,
                      height: 20,
                      color: Colors.white70,
=======
    return BlocProvider(
      create: (_) => SearchCubit(MovieRepository(ApiService(Dio()))),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            onSubmitted: (value) {
                              if (value.trim().isNotEmpty) {
                                context.read<SearchCubit>().searchMovies(
                                  value.trim(),
                                );
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: AppColors.whiteColor),
                              prefixIcon: Image.asset(
                                'assets/image/saerch.png',
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchInitial) {
                          return Center(
                            child: Image.asset('assets/image/empty_search.png'),
                          );
                        }

                        if (state is SearchLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is SearchError) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }
                        if (state is SearchSuccess) {
                          final movies = state.movies;
                          if (movies.isEmpty) {
                            return const Center(
                              child: Text(
                                'No movies found',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          }

                          return GridView.builder(
                            padding: const EdgeInsets.all(12.0),
                            itemCount: movies.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 0.65,
                                ),
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            movie.mediumCoverImage ?? '',
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    color: Colors.grey,
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.error,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  );
                                                },
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '${movie.rating ?? 0}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    movie.title ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${movie.year ?? ''}  ',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return const SizedBox();
                      },
>>>>>>> origin/browse-profile-updateprofile
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF282A28),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.yellow,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
<<<<<<< HEAD
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.yellow),
                    )
                  : searchResults.isNotEmpty
                      ? GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.68,
                          ),
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            final movie = searchResults[index];
                            return _buildSearchCard(movie);
                          },
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/image/empty_search.png',
                                width: 140,
                                height: 140,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.search_off,
                                    size: 100,
                                    color: AppColors.yellow,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
            ),
          ],
        ),
=======
          );
        },
>>>>>>> origin/browse-profile-updateprofile
      ),
    );
  }

  Widget _buildSearchCard(YtsMovie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  movie.mediumCoverImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppAssets.blackMovie,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              // Rating Badge
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white24,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movie.rating > 0 ? movie.rating.toStringAsFixed(1) : '7.7',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.star,
                        color: AppColors.yellow,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
