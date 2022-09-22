import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the roor of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  } else {
                    double? num = double.tryParse(value);
                    if (num == null)
                      return 'Invalid value';
                    else if (num < 1 || num > 10)
                      return 'Please enter value between 1 and 10.000';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
