import 'package:api_movie_najera/screens/screen_weather.dart';

import 'package:flutter/material.dart';
import 'package:api_movie_najera/providers/movies_provider.dart';
import 'package:api_movie_najera/providers/movies_provider2.dart';
import 'package:api_movie_najera/providers/movies_provider3.dart';
import 'package:api_movie_najera/widgets/background.dart';
import 'package:api_movie_najera/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    final moviesProvider2 = Provider.of<MoviesProvider2>(context, listen: true);
    final moviesProvider3 = Provider.of<MoviesProvider3>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          const Text('Weather API ☀'),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CardWeatherSwiper()));
              },
              icon: const Icon(Icons.arrow_right_alt_outlined))
        ],
      ),
      body: Stack(children: [
        const Background(),
        SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.dataMovies),
              CardSwiper(movies: moviesProvider2.dataMovies),
              CardSwiper(movies: moviesProvider3.dataMovies)
            ],
          ),
        ),
      ]),
    );
  }
}
