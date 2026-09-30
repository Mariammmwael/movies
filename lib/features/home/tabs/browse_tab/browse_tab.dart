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
import 'package:movieapp/cubit/browse/browse_cubit.dart';
import 'package:movieapp/cubit/browse/browse_state.dart';
import 'package:movieapp/data/api/api_service.dart';
import 'package:movieapp/data/repository/movie_repositry.dart';
>>>>>>> origin/browse-profile-updateprofile

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Music',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Thriller',
    'Western',
  ];

  String selectedGenre = 'Action';
  List<YtsMovie> apiMovies = [];
  bool isLoading = true;

  // Local fallback movies matching the design screenshot
  final List<Map<String, String>> localFallbackMovies = [
    {'image': AppAssets.redheadgirl, 'rating': '7.7'},
    {'image': AppAssets.darkknight, 'rating': '7.7'},
    {'image': AppAssets.captainamericaa, 'rating': '7.7'},
    {'image': AppAssets.civilwar, 'rating': '7.7'},
    {'image': AppAssets.avengersEndgame, 'rating': '7.7'},
    {'image': AppAssets.doctorStrange, 'rating': '7.7'},
  ];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    setState(() {
      isLoading = true;
    });

    final movies = await YtsApiService.getMoviesByGenre(selectedGenre);

    if (mounted) {
      setState(() {
        apiMovies = movies;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // Horizontal Genre Chips Row
            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  final isSelected = genre == selectedGenre;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (selectedGenre != genre) {
                          setState(() {
                            selectedGenre = genre;
                          });
                          _fetchMovies();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.yellow : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? AppColors.yellow : AppColors.yellow,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          genre,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Movies Grid
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.yellow,
                      ),
                    )
                  : apiMovies.isNotEmpty
                      ? _buildApiGrid()
                      : _buildFallbackGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApiGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: apiMovies.length,
      itemBuilder: (context, index) {
        final movie = apiMovies[index];
        return _buildMovieCard(
          imageUrl: movie.mediumCoverImage,
          rating: movie.rating > 0 ? movie.rating.toStringAsFixed(1) : '7.7',
          isNetwork: true,
        );
      },
    );
  }

  Widget _buildFallbackGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: localFallbackMovies.length,
      itemBuilder: (context, index) {
        final item = localFallbackMovies[index];
        return _buildMovieCard(
          imageUrl: item['image']!,
          rating: item['rating']!,
          isNetwork: false,
        );
      },
    );
  }

  Widget _buildMovieCard({
    required String imageUrl,
    required String rating,
    required bool isNetwork,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: isNetwork
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            AppAssets.redheadgirl,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
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
                        rating,
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
=======
    return BlocProvider(
      create: (context) =>
          BrowseCubit(MovieRepository(ApiService(Dio())))..getMovies(),
      child: BlocBuilder<BrowseCubit, BrowseState>(
        builder: (context, state) {
          final cubit = context.read<BrowseCubit>();

          if (state is BrowseLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BrowseError) {
            return Center(child: Text(state.message));
          }

          return SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: cubit.genres.length,
                    separatorBuilder: (_, index) {
                      return const SizedBox(width: 10);
                    },
                    itemBuilder: (context, index) {
                      final genre = cubit.genres[index];

                      return GestureDetector(
                        onTap: () {
                          cubit.selectGenre(genre);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: cubit.selectedGenre == genre
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: Text(
                            genre,
                            style: TextStyle(
                              color: cubit.selectedGenre == genre
                                  ? AppColors.backgroundColor
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.65,
                        ),
                    itemCount: cubit.filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = cubit.filteredMovies[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    movie.largeCoverImage ?? '',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.movie,
                                        color: Colors.white,
                                      );
                                    },
                                  ),
                                ),

                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(8),
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
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
>>>>>>> origin/browse-profile-updateprofile
      ),
    );
  }
}
