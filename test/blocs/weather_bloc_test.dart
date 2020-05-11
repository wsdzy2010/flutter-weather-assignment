import 'package:flutter_weather/blocs/blocs.dart';
import 'package:flutter_weather/models/weather.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_weather/repositories/repositories.dart';
import 'package:http/http.dart' as http;

void main() {
  WeatherRepository weatherRepository;
  Weather weather;
  group('weather bloc test', () {
    setUp(() async {
      weatherRepository = WeatherRepository(
        weatherApiClient: WeatherApiClient(
          httpClient: http.Client(),
        ),
      );
      weather = await weatherRepository.getWeather('Chicago');
      print('weather = $weather');
    });

    blocTest('emits [] when nothing is added', build: () async {
      weatherRepository = WeatherRepository(
        weatherApiClient: WeatherApiClient(
          httpClient: http.Client(),
        ),
      );
      return WeatherBloc(weatherRepository: weatherRepository);
    }, act: null, expect: []);

    // blocTest('emits [] when city is added',
    //     build: () async {
    //       return WeatherBloc(weatherRepository: weatherRepository);
    //     },
    //     act: (bloc) => bloc.add(FetchWeather(city: 'Chicago') as WeatherEvent),
    //     expect: [WeatherLoading(), WeatherLoaded(weather: weather)]);
  });
}
