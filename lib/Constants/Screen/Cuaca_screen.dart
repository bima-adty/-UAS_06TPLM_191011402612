import '../provider/cuaca_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {

const HomeScreen({Key? key}): super(key: key);
@override
State<HomeScreen> createState() =>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
    appBar: AppBar(
      title: Text("Aplikasi Cuaca"),
  ),
    body: Consumer<CuacaProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: provider.cityNameText,
                decoration: InputDecoration(
                hintText: "Masukkan Nama Kota", 
                labelText: "Nama Kota",
                ),
              ),
          TextButton(
            onPressed: () {
              provider.showWeatherData();
          },
            child: Text("Tampilkan Data Cuaca"),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              provider?.Cuacamodel?.name ?? "Waiting Data",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            provider.Cuacamodel.weather?.first?.main ?? "Waiting data"),
          SizedBox(
            width: 200, height: 200,
            child: Image.network(           
            "https://openweathermap.org/img/w/${provider.Cuacamodel.weather?.first?.icon}.png",
              fit: BoxFit.contain,
            ),
          ),
          Text("Temp: ${provider.Cuacamodel.main?.temp} Celcius"),
              ],
            ),
          );
        },
      ),
    );
  }
}