import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/app_colors.dart';
import 'package:movieapp/cubit/browse/browse_cubit.dart';
import 'package:movieapp/cubit/browse/browse_state.dart';
import 'package:movieapp/data/api/api_service.dart';
import 'package:movieapp/data/repository/movie_repositry.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
