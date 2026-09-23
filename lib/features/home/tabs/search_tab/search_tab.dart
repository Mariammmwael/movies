import 'package:flutter/material.dart';
import 'package:movieapp/core/app_colors.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: searchController,
                      //  onSubmitted: searchMovie,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: AppColors.whiteColor),
                        prefixIcon: (Image.asset('assets/image/saerch.png')),
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
              child: Center(
                child: Image.asset('assets/image/empty_search.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
