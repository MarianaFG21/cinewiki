import 'package:cinewiki/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;


  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, 
    this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}