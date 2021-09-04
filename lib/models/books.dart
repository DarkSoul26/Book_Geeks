import 'package:book_geeks/models/author.dart';
import 'package:flutter/material.dart';

class Bookss {
  final String title;
  final String description;
  final double score;
  final String image;
  final Authorss author;

  Bookss({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.score,
    @required this.author,
  });
}
