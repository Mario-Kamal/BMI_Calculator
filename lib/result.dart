import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.age, required this.isMale})
      : super(key: key);
  final double result;
  final int age;
  final bool isMale;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30)
      resultText = 'FAT';
    else if (result > 25 && result < 30)
      resultText = 'A LITTLE FAT';
    else if (result >= 18.5 && result <= 24.9)
      resultText = 'NORMAL';
    else
      resultText = 'THIN';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Gender: ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text('Result: ${result.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.headline1),
              Text(
                'Result: $resultPhrase',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text('Age: $age', style: Theme.of(context).textTheme.headline1),
            ],
          ),
        ),
      ),
    );
  }
}
