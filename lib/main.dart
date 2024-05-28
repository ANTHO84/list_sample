import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: AnimalSelectorScreen(),
    );
  }
}

class AnimalSelectorScreen extends StatefulWidget {
  @override
  _AnimalSelectorScreenState createState() => _AnimalSelectorScreenState();
}

class _AnimalSelectorScreenState extends State<AnimalSelectorScreen> {
  String? selectedAnimal;

  final Map<String, String> animalImages = {
    'Chó': 'images/dog.gif',
    'Mèo': 'images/cat.jpeg',
    'Nhim': 'images/nhims.jpeg',
    'Chuot': 'images/mouse.png',
    'Vit': 'images/duck.jpeg',
    'Thỏ': 'images/rabbit.jpeg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton<String>(
            hint: Text('Chọn một loài động vật'),
            value: selectedAnimal,
            items: animalImages.keys.map((String animal) {
              return DropdownMenuItem<String>(
                value: animal,
                child: Text(animal),
              
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedAnimal = newValue;
              });
            },
          ),
          selectedAnimal != null
              ? Image.network(
                  animalImages[selectedAnimal]!,
                  height: 250,
                  width: 250,
                )
              : Container(),
        ],
      ),
      ),
    );
  }
}
