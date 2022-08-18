import 'package:flutter/material.dart';
import 'package:api_movie_najera/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class CardWeatherSwiper extends StatefulWidget {
  const CardWeatherSwiper({Key? key}) : super(key: key);

  @override
  State<CardWeatherSwiper> createState() => _CardWeatherSwiperState();
}

class _CardWeatherSwiperState extends State<CardWeatherSwiper> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    final String weather =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-weather";

    return Scaffold(
      backgroundColor: const Color.fromARGB(166, 81, 154, 202),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Weather API"),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: 800,
              width: double.infinity,
              child: Column(
                children: [
                  _ImageAndTemp(
                    //Today's resources
                    weatherProvider.todayWeather,
                    weatherProvider.todayTemp,
                    weatherProvider.todayDay,
                    weatherProvider.todayText,

                    //Forecast resources
                    weatherProvider.foretempmax0,
                    weatherProvider.foretempmin0,
                    weatherProvider.foredate0,
                    weatherProvider.foretext0,

                    weatherProvider.foretempmax1,
                    weatherProvider.foretempmin1,
                    weatherProvider.foredate1,
                    weatherProvider.foretext1,

                    weatherProvider.foretempmax2,
                    weatherProvider.foretempmin2,
                    weatherProvider.foredate2,
                    weatherProvider.foretext2,
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

class _ImageAndTemp extends StatefulWidget {
  final String todayWeather;
  final String todayTemp;
  final String todayDay;
  final String todayText;
  final String foretempmax0;
  final String foretempmin0;
  final String foredate0;
  final String foretext0;
  final String foretempmax1;
  final String foretempmin1;
  final String foredate1;
  final String foretext1;
  final String foretempmax2;
  final String foretempmin2;
  final String foredate2;
  final String foretext2;
  const _ImageAndTemp(
    this.todayWeather,
    this.todayTemp,
    this.todayDay,
    this.todayText,

    //Part  of the forecast
    this.foretempmax0,
    this.foretempmin0,
    this.foredate0,
    this.foretext0,
    this.foretempmax1,
    this.foretempmin1,
    this.foretext1,
    this.foretempmax2,
    this.foretempmin2,
    this.foredate2,
    this.foretext2,
    this.foredate1,
  );

  @override
  State<_ImageAndTemp> createState() => _ImageAndTempState();
}

class _ImageAndTempState extends State<_ImageAndTemp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const Text(
            'Weather of today',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerRight,
            height: 130.0,
            width: 245,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 248, 255),
            ),
            child: Row(
              children: [
                const SizedBox(width: 25),
                const Align(
                    alignment: Alignment.centerRight, child: Icon(Icons.cloud)),
                const SizedBox(width: 30),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Durango',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.todayTemp} °C',
                            maxLines: 2,
                            style: DefaultTextStyle.of(context)
                                .style
                                .apply(fontSizeFactor: 1.1),
                          ),
                          Text(
                            '${widget.todayDay}',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            '${widget.todayText}',
                            style: Theme.of(context).textTheme.subtitle1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20), //apply padding to all four sides
            child: Text(
              'Forecast 📅',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 25,
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 10.0,
              width: double.infinity,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(0, 54, 54, 244))),
          Container(
            alignment: Alignment.centerRight,
            height: 150.0,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  height: 300.0,
                  width: 117,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                  ),
                  child: Column(children: [
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Durango',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.foretempmax0} °C',
                          style: Theme.of(context).textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          '${widget.foretempmin0} °C',
                          style: Theme.of(context).textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          '${widget.foretext0}',
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${widget.foredate0}',
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 200.0,
                  width: 117,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(children: [
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        const Text(
                          'Durango',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.foretempmax1} °C',
                          style: Theme.of(context).textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          '${widget.foretempmin1} °C',
                          style: Theme.of(context).textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          '${widget.foredate1} ☀',
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${widget.foretext1}',
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 200.0,
                  width: 117,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                  ),
                  child: Column(children: [
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        const Text(
                          'Durango',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.todayTemp} °C',
                          style: Theme.of(context).textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          '${widget.foretempmin2} °C',
                          style: Theme.of(context).textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          '${widget.foredate1} ☀',
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${widget.foretext2}',
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            margin: const EdgeInsets.all(30.0),
            height: 220.0,
            width: 320.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          )
        ],
      ),
    );
  }
}
