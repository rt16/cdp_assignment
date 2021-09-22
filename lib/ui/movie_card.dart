import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/db/movie_database.dart';
import 'package:movie_app/pages/movie_detail.dart';

movieCard(Result movie, BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new MovieDetail(movie);
        }));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5)),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          base_image_url + movie.posterPath!,
          fit: BoxFit.fill,
        ),
      ));
}
