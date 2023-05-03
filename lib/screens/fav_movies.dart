import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MyFavouriteMovies extends StatefulWidget {
  const MyFavouriteMovies({super.key});

  @override
  State<MyFavouriteMovies> createState() => _MyFavouriteMoviesState();
}

class _MyFavouriteMoviesState extends State<MyFavouriteMovies> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('My List of ${_myList.length} Movies'),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (_, index) {
            final currentMovie = _myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                  title: Text(currentMovie.title),
                  subtitle: Text(currentMovie.duration ?? ''),
                  trailing: TextButton(
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromList(currentMovie);
                    },
                    child: const Text('remove',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  )),
            );
          }),
    );
  }
}
