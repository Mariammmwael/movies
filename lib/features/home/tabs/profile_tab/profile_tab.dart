import 'package:flutter/material.dart';
import 'package:movieapp/core/theme/app_assets.dart';
import 'package:movieapp/core/theme/app_colors.dart';
import 'package:movieapp/core/user_profile.dart';
import 'package:movieapp/features/movie_details/movie_details_screen.dart';
import 'package:movieapp/features/update_profile_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedTabIndex = 0; // 0 = Watch List, 1 = History

  final List<Map<String, String>> historyMovies = const [
    {'image': AppAssets.redheadgirl, 'rating': '7.7'},
    {'image': AppAssets.badboys, 'rating': '7.7'},
    {'image': AppAssets.blackMovie, 'rating': '7.7'},
    {'image': AppAssets.avengersEndgame, 'rating': '7.7'},
    {'image': AppAssets.darkknight, 'rating': '7.7'},
    {'image': AppAssets.redheadgirl, 'rating': '7.7'},
    {'image': AppAssets.captainamericaa, 'rating': '7.7'},
    {'image': AppAssets.doctorStrange, 'rating': '7.7'},
    {'image': AppAssets.civilwar, 'rating': '7.2'},
    {'image': AppAssets.theGodfather, 'rating': '7.7'},
    {'image': AppAssets.darkknight, 'rating': '7.7'},
    {'image': AppAssets.badboys, 'rating': '7.2'},
  ];

  final List<Map<String, String>> watchListMovies = const [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            const SizedBox(height: 16),

            // Profile Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  ValueListenableBuilder<String>(
                    valueListenable: UserProfile.avatar,
                    builder: (context, avatarPath, child) {
                      return CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(avatarPath),
                      );
                    },
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem('12', 'Wish List'),
                        _buildStatItem('10', 'History'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // User Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ValueListenableBuilder<String>(
                  valueListenable: UserProfile.name,
                  builder: (context, userName, child) {
                    return Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Action Buttons (Edit Profile & Exit)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            UpdateProfileScreen.routeName,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE50914), // Red
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Exit',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.exit_to_app, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tabs Bar (Watch List / History)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white12,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabButton(
                      index: 0,
                      label: 'Watch List',
                      icon: Icons.list_alt,
                    ),
                  ),
                  Expanded(
                    child: _buildTabButton(
                      index: 1,
                      label: 'History',
                      icon: Icons.folder,
                    ),
                  ),
                ],
              ),
            ),

            // Tab Content Body
            Expanded(
              child: selectedTabIndex == 0
                  ? _buildWatchListTab()
                  : _buildHistoryTab(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton({
    required int index,
    required String label,
    required IconData icon,
  }) {
    final isSelected = selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.yellow : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.yellow : Colors.white54,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.yellow : Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWatchListTab() {
    if (watchListMovies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.emptyPopcorn,
              width: 140,
              height: 140,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.movie,
                  size: 100,
                  color: AppColors.yellow,
                );
              },
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65,
      ),
      itemCount: watchListMovies.length,
      itemBuilder: (context, index) {
        final item = watchListMovies[index];
        return _buildGridMovieCard(item['image']!, item['rating']!);
      },
    );
  }

  Widget _buildHistoryTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65,
      ),
      itemCount: historyMovies.length,
      itemBuilder: (context, index) {
        final item = historyMovies[index];
        return _buildGridMovieCard(item['image']!, item['rating']!);
      },
    );
  }

  Widget _buildGridMovieCard(String imagePath, String rating) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),

              // Rating Badge
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(8),
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
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.star,
                        color: AppColors.yellow,
                        size: 11,
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
