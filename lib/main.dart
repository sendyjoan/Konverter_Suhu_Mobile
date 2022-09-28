import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropDown = "Kelvin";
  double hasilPerhitungan = 0;
  List<String> listHasil = [];

  void onDropdownChange(String? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void SuhuConvertion() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            break;
          case "Reamur":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            break;
          case "Fahrenheit":
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius Ke " +
            selectedDropDown +
            " Hasil " +
            hasilPerhitungan.toString());
      }
    });
  }

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
                keyboardType: TextInputType.number,
                controller: etInput,
                decoration: InputDecoration(
                  labelText: 'Celcius',
                  hintText: 'Enter the temperature in celcius',
                ),
              ),
              SizedBox(
                height: 6,
              ),
              DropdownButton(
                isExpanded: true,
                value: selectedDropDown,
                items: listSatuanSuhu.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  onDropdownChange(value);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Hasil",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "$hasilPerhitungan",
                style: TextStyle(fontSize: 34),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        SuhuConvertion();
                      },
                      child: Text("Konversi Suhu"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listHasil.length,
                  itemBuilder: (context, index) {
                    return Text(listHasil[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
