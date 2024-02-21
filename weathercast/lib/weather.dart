class Weather {
  //eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU2ZmJhZmYyYjFlYjBjZTY4MDE2NmYwZjgxODk1MDYyODZkOGY1NmUwYmQ1ZGFkNzgxNTMzZWVkMjY2ZDVhYjcxMGI5YWFlN2I1MzUxMjUxIn0.eyJhdWQiOiIyIiwianRpIjoiZTZmYmFmZjJiMWViMGNlNjgwMTY2ZjBmODE4OTUwNjI4NmQ4ZjU2ZTBiZDVkYWQ3ODE1MzNlZWQyNjZkNWFiNzEwYjlhYWU3YjUzNTEyNTEiLCJpYXQiOjE3MDc4ODIyNTksIm5iZiI6MTcwNzg4MjI1OSwiZXhwIjoxNzM5NTA0NjU5LCJzdWIiOiIzMDAyIiwic2NvcGVzIjpbXX0.S29sMOWPcBsJW81T9HpQXNFiFTuFJEg2m9lNhxJyejWZdKKR9MiVMJ4x68h_G0Jijdri8GdDPLotFnySxE9QAnjcIUUY6v-q9VdoFmJRUGqgSkagAVcMFdqxRHjrlZ6K6UV5kinHfes6yAU8sVLpZ3gRx-ThMwhEHIuvIbzQbpK2aiY7IUjo8zFKF15cxgs3c8UdHTAs9Xvcy_MhhfBoiI8AEscPbLnHXNV2Ve2-epywrOeG3RX83sWDib-xAcgCtZCOqHZOYs0hHjcErVVkdmD5Q0bedrIaHbypHQS3PhOR3wjQi1VOmj1KdRSqZFsZQVMGi4dGJdgZZAWir8bNRsVvClc1xKQS3maqdXGnsi9IcGF89AiDmgGdkwGiv0uNqtYvyh6WINsfXQtFWwTKu8AJVS7bDEzHXeRMklEM_0pHyvJFxjDkdQeekPLslcrIb6PNap0Tw5IW3AtToWyE3RHlQLel32IGJmBHBNsW90KPfh-PiPK1vk1nPD-ypzwcFT4O_0nk3980kfb5dqWU_miqRsgFAdcyJmQpVSTNS0SKBBcV69S356jFiYDSxvZpvivmspnfxb5uFe1d64ittcO6bRKDO1mdK2jFy94Bf4R23GTvQ_4P2ukhOGYYeNZcp9q70zbmBa0mm4zq6aMz-BWdlsSj99eM-L1M-eVtqUU
  static const _condition = [
    '',
    'ท้องฟ้าแจ่มใส (Clear)',
    'มีเมฆบางส่วน (Partly cloudy)',
    'เมฆเป็นส่วนมาก (Cloudy)',
    'มีเมฆมาก (Overcast)',
    'ฝนตกเล็กน้อย (Light rain)',
    'ฝนปานกลาง (Moderate rain)',
    'ฝนตกหนัก (Heavy rain)',
    'ฝนฟ้าคะนอง (Thunderstorm)',
    'อากาศหนาวจัด (Very cold)',
    'อากาศหนาว (Cold)',
    'อากาศเย็น (Cool)',
    'อากาศร้อนจัด (Very hot)',
  ];

  static const _symbol = [
    '',
    '🌈',
    '☁',
    '☁☁',
    '☁☁☁',
    '🌦',
    '🌧',
    '☔',
    '⛈',
    '☃',
    '⛄',
    '❄',
    '☀',
  ];

  final String address;
  final double temperature;
  final int cond;

  Weather(
      {required this.address, required this.temperature, required this.cond});

  String get condition => _condition[cond];

  String get symbol => _symbol[cond];
}
