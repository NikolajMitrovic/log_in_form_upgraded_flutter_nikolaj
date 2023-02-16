import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_in_form_flutter/bloc/weather/weather_bloc.dart';
import 'package:log_in_form_flutter/bloc/weather/weather_event.dart';
import 'package:log_in_form_flutter/bloc/weather/weather_state.dart';
import 'package:log_in_form_flutter/data/http_helper.dart';
// import 'package:log_in_form_flutter/data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPLace = TextEditingController();
  // Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(httpHelper: HttpHelper()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, weatherState) {
            if (weatherState.status == WeatherStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: txtPLace,
                      decoration: InputDecoration(
                        hintText: 'Enter a city',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () => context.read<WeatherBloc>().add(WeatherSubmitEvent(city: txtPLace.text)),
                        ),
                      ),
                    ),
                  ),
                  weatherRow('Place: ', weatherState.weather?.name ?? ''),
                  weatherRow('Description: ', weatherState.weather?.description ?? ''),
                  weatherRow('Temperature: ', (weatherState.weather?.temperature ?? 0).toStringAsFixed(2)),
                  weatherRow('Perceived: ', (weatherState.weather?.perceived ?? 0).toStringAsFixed(2)),
                  weatherRow('Pressure: ', (weatherState.weather?.pressure ?? 0).toString()),
                  weatherRow('Humidity: ', (weatherState.weather?.humidity ?? 0).toString()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Future getData() async {
  //   HttpHelper helper = HttpHelper();
  //   stuff = await helper.getWeather(txtPLace.text);
  //   setState(() {});
  // }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );

    return row;
  }
}
