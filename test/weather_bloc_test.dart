import 'package:test/test.dart';
import 'package:flutter_weather/blocs/blocs.dart';
import 'package:flutter_weather/repositories/repositories.dart';
import 'package:http/http.dart' as http;

void main() {
  group('WeatherBloc', () {
    WeatherRepository weatherRepository;
    WeatherBloc weatherBloc;
    setUp(() {
      weatherRepository = WeatherRepository(
        weatherApiClient: WeatherApiClient(
          httpClient: http.Client(),
        ),
      );
      weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
    });

    test('initial state is empty weather', () {
      expect(weatherBloc.initialState, WeatherEmpty());
    });
  });
}
