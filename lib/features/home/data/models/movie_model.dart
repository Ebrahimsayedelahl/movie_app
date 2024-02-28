
class MovieModel {
  dynamic title;
  dynamic year;
  dynamic timeline;
  dynamic rating;
  dynamic image;

  MovieModel({
    required this.title,
    required this.year,
    required this.timeline,
    required this.rating,
    required this.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      year: json['year'],
      timeline: json['timeline'],
      rating: json['rating'],
      image: json['image'],
    );
  }
}
