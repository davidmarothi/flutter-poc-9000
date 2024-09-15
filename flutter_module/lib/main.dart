import 'package:flutter/material.dart';

void main(List<String> args) {
  print('Received entrypointArgs: $args');
  String name = args[0];
  
  runApp(MyApp(name));
}

class MyApp extends StatelessWidget {
  final String name;

  MyApp(this.name);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Hello $name!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}