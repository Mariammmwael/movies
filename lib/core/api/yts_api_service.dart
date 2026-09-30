import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class YtsMovie {
  final int id;
  final String title;
  final int year;
  final double rating;
  final String mediumCoverImage;
  final String summary;
  final List<String> genres;

  YtsMovie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.mediumCoverImage,
    required this.summary,
    required this.genres,
  });

  factory YtsMovie.fromJson(Map<String, dynamic> json) {
    return YtsMovie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      year: json['year'] ?? 2022,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      mediumCoverImage: json['medium_cover_image'] ?? '',
      summary: json['summary'] ?? '',
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
    );
  }
}

class YtsApiService {
  static const String baseUrl = 'https://yts.mx/api/v2';

  static Future<List<YtsMovie>> getMoviesByGenre(String genre) async {
    try {
      final uri = Uri.parse('$baseUrl/list_movies.json?genre=${genre.toLowerCase()}&limit=20');
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'ok' && data['data'] != null && data['data']['movies'] != null) {
          final List moviesJson = data['data']['movies'];
          return moviesJson.map((json) => YtsMovie.fromJson(json)).toList();
        }
      }
    } catch (e) {
      debugPrint('YtsApiService Error: $e');
    }
    return [];
  }

  static Future<List<YtsMovie>> searchMovies(String query) async {
    if (query.trim().isEmpty) return [];
    try {
      final uri = Uri.parse('$baseUrl/list_movies.json?query_term=${Uri.encodeComponent(query)}&limit=20');
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'ok' && data['data'] != null && data['data']['movies'] != null) {
          final List moviesJson = data['data']['movies'];
          return moviesJson.map((json) => YtsMovie.fromJson(json)).toList();
        }
      }
    } catch (e) {
      debugPrint('YtsApiService Search Error: $e');
    }
    return [];
  }
}
