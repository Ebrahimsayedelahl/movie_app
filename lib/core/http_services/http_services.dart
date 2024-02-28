import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/models/movies_model.dart';

class HttpServices {
  static final String baseUrl = 'https://moviesverse1.p.rapidapi.com';
  static final String apiKey = '024febf387mshce34a6e1f1ce9f1p1ce76fjsn9139c48e286c';

  static Future<MoviesModel> getMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/top-250-movies'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'moviesverse1.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {

      final Map<String, dynamic> jsonData = json.decode(response.body);
      return MoviesModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load top 250 movies');
    }
  }
}
