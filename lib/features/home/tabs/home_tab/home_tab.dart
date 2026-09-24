import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/theme/app_assets.dart';
import 'package:movieapp/core/theme/app_colors.dart';
import 'package:movieapp/features/movie_details/movie_details_screen.dart';

class MovieItem {
  final String id;
  final String title;
  final String image;
  final double rating;

  const MovieItem({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
  });
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentCarouselIndex = 0;

  final List<MovieItem> _carouselMovies = const [
    MovieItem(
      id: '1',
      title: '1917',
      image: AppAssets.blackMovie,
      rating: 7.7,
    ),
    MovieItem(
      id: '2',
      title: 'Captain America',
      image: AppAssets.captainamericaa,
      rating: 7.7,
    ),
    MovieItem(
      id: '3',
      title: 'The Dark Knight',
      image: AppAssets.darkknight,
      rating: 7.7,
    ),
    MovieItem(
      id: '4',
      title: 'Black Widow',
      image: AppAssets.redheadgirl,
      rating: 7.7,
    ),
  ];

  final List<MovieItem> _actionMovies = const [
    MovieItem(
      id: '1',
      title: 'Captain America',
      image: AppAssets.captainamericaa,
      rating: 7.7,
    ),
    MovieItem(
      id: '2',
      title: 'The Dark Knight',
      image: AppAssets.darkknight,
      rating: 7.7,
    ),
    MovieItem(
      id: '3',
      title: 'Black Widow',
      image: AppAssets.redheadgirl,
      rating: 7.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentMovie = _carouselMovies[_currentCarouselIndex];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          // Background Hero Movie Backdrop with Gradient Overlay
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                currentMovie.image,
                key: ValueKey<String>(currentMovie.image),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.4),
                    Colors.black.withValues(alpha: 0.7),
                    AppColors.black.withValues(alpha: 0.95),
                    AppColors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.35, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // Main Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),

                  // "Available Now" Top Banner Title
                  Text(
                    'Available Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.8),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Main Carousel Slider
                  CarouselSlider.builder(
                    itemCount: _carouselMovies.length,
                    options: CarouselOptions(
                      height: 350,
                      viewportFraction: 0.62,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentCarouselIndex = index;
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final movie = _carouselMovies[index];
                      return _buildMovieCard(movie, isCarousel: true);
                    },
                  ),

                  const SizedBox(height: 12),

                  // "Watch Now" Graphic Banner
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MovieDetailsScreen.routeName);
                    },
                    child: Text(
                      'Watch Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.9),
                            blurRadius: 12,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action Section Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Action',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Text(
                                'See More',
                                style: TextStyle(
                                  color: AppColors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.yellow,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Action Movies Horizontal List
                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _actionMovies.length,
                      itemBuilder: (context, index) {
                        final movie = _actionMovies[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: SizedBox(
                            width: 125,
                            child: _buildMovieCard(movie, isCarousel: false),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(MovieItem movie, {required bool isCarousel}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  movie.image,
                  fit: BoxFit.cover,
                ),
              ),

              // Rating Badge (Top Left)
              Positioned(
                top: 10,
                left: 10,
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
                        '${movie.rating}',
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
