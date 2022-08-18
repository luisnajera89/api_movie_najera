import 'package:flutter/material.dart';
import 'package:api_movie_najera/providers/weather_provider.dart';
import 'package:api_movie_najera/providers/movies_provider.dart';
import 'package:api_movie_najera/providers/movies_provider2.dart';
import 'package:api_movie_najera/providers/movies_provider3.dart';
import 'package:api_movie_najera/screens/details_screen.dart';
import 'package:api_movie_najera/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppSate());

class AppSate extends StatelessWidget {
  const AppSate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => MoviesProvider2(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => MoviesProvider3(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Screen & Weather',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      initialRoute: 'home',
      theme: ThemeData.light().copyWith(
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 27, 27, 27))),
    );
  }
}
