import 'package:movie_app/features/home/data/models/movie_model.dart';

class MoviesModel {
  List<MovieModel>list;

  MoviesModel({
    required this.list
});

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    List<MovieModel> list = (json['movies'] as List<dynamic>)
        .map((item) => MovieModel.fromJson(item),)
        .toList();
    return MoviesModel(
      list:list,
    );
  }

}