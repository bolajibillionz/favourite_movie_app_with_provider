import 'package:flutter/material.dart';
import 'package:movie_app_with_provider/providers/movie_provider.dart';
import 'package:movie_app_with_provider/screens/fav_movies.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies Provider'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>const MyFavouriteMovies()));
              },
              icon: const Icon(Icons.favorite),
              label: Text(
                'Go to my List (${myList.length})',
                style: const TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 20)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (_, index) {
                      final currentMovie = movies[index];
                      return Card(
                        key: ValueKey(currentMovie.title),
                        color: Colors.blue,
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            currentMovie.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            currentMovie.duration ?? 'No info',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                if (!myList.contains(currentMovie)) {
                                  context
                                      .read<MovieProvider>()
                                      .addToList(currentMovie);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .removeFromList(currentMovie);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: myList.contains(currentMovie)
                                    ? Colors.red
                                    : Colors.white,
                                size: 30,
                              )),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
