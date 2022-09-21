import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170.5;
  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bmi Calculator",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      gender(context, 'male'),
                      SizedBox(
                        width: 10.0,
                      ),
                      gender(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Text(
                              "CM",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                        Slider(
                            min: 90,
                            max: 220,
                            value: heightVal,
                            onChanged: (newValue) {
                              setState(() {
                                heightVal=newValue;
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      another(context, 'age'),
                      SizedBox(
                        width: 10.0,
                      ),
                      another(context, 'weight'),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 15,
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(heightVal / 100, 2);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Result(
                              result: result, age: age, isMale: isMale)));
                    },
                    child: Text('Calculate',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ));
  }

  Expanded gender(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: (isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                type == 'male' ? "Male" : "Female",
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded another(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? "Age" : "Weight",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: Icon(Icons.remove),
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  mini: true,
                ),
                SizedBox(
                  width: 10.0,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: Icon(Icons.add),
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  mini: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
