import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/models/movie_model.dart';
import 'dart:math';

final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: 'Movie $index',
        duration: '${Random().nextInt(100) + 60} minutes'));

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;

  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
