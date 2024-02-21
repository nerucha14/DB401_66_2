import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU2ZmJhZmYyYjFlYjBjZTY4MDE2NmYwZjgxODk1MDYyODZkOGY1NmUwYmQ1ZGFkNzgxNTMzZWVkMjY2ZDVhYjcxMGI5YWFlN2I1MzUxMjUxIn0.eyJhdWQiOiIyIiwianRpIjoiZTZmYmFmZjJiMWViMGNlNjgwMTY2ZjBmODE4OTUwNjI4NmQ4ZjU2ZTBiZDVkYWQ3ODE1MzNlZWQyNjZkNWFiNzEwYjlhYWU3YjUzNTEyNTEiLCJpYXQiOjE3MDc4ODIyNTksIm5iZiI6MTcwNzg4MjI1OSwiZXhwIjoxNzM5NTA0NjU5LCJzdWIiOiIzMDAyIiwic2NvcGVzIjpbXX0.S29sMOWPcBsJW81T9HpQXNFiFTuFJEg2m9lNhxJyejWZdKKR9MiVMJ4x68h_G0Jijdri8GdDPLotFnySxE9QAnjcIUUY6v-q9VdoFmJRUGqgSkagAVcMFdqxRHjrlZ6K6UV5kinHfes6yAU8sVLpZ3gRx-ThMwhEHIuvIbzQbpK2aiY7IUjo8zFKF15cxgs3c8UdHTAs9Xvcy_MhhfBoiI8AEscPbLnHXNV2Ve2-epywrOeG3RX83sWDib-xAcgCtZCOqHZOYs0hHjcErVVkdmD5Q0bedrIaHbypHQS3PhOR3wjQi1VOmj1KdRSqZFsZQVMGi4dGJdgZZAWir8bNRsVvClc1xKQS3maqdXGnsi9IcGF89AiDmgGdkwGiv0uNqtYvyh6WINsfXQtFWwTKu8AJVS7bDEzHXeRMklEM_0pHyvJFxjDkdQeekPLslcrIb6PNap0Tw5IW3AtToWyE3RHlQLel32IGJmBHBNsW90KPfh-PiPK1vk1nPD-ypzwcFT4O_0nk3980kfb5dqWU_miqRsgFAdcyJmQpVSTNS0SKBBcV69S356jFiYDSxvZpvivmspnfxb5uFe1d64ittcO6bRKDO1mdK2jFy94Bf4R23GTvQ_4P2ukhOGYYeNZcp9q70zbmBa0mm4zq6aMz-BWdlsSj99eM-L1M-eVtqUU';

  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
      Uri.parse(
          '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
      headers: {
        'accept': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['WeatherForecasts'][0]['forecasts']
          [0]['data'];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
        address: '${address.subLocality}\n${address.administrativeArea}',
        temperature: result['tc'],
        cond: result['cond'],
      );
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
