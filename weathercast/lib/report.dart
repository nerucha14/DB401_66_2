import 'package:flutter/material.dart';
import 'forecast.dart';
import 'weather.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Weather? _weather;

  void updateReport() {
    forecast().then((weather) {
      setState(() {
        _weather = weather;
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: const Duration(days: 1),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    updateReport();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'สภาพอากาศวันนี้',
          style: TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          constraints: _weather == null
              ? const BoxConstraints.tightFor(width: 150, height: 150)
              : null,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blueAccent.shade700.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: _weather == null
              ? null
              : Column(
                  children: [
                    Text(
                      _weather!.address,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${_weather!.temperature}℃',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _weather!.condition,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _weather!.symbol,
                      style: const TextStyle(fontSize: 72),
                    ),
                  ],
                ),
        ),
        ElevatedButton(
            onPressed: () => updateReport(), child: const Text('Refresh'))
      ],
    );
  }
}
