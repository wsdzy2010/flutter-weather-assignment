import 'package:flutter/material.dart';
import 'package:flutter_weather/simple_bloc_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather/blocs/blocs.dart';
import 'widgets/widgets.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(weatherRepository: weatherRepository));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: Weather(),
      ),
    );
  }
}
