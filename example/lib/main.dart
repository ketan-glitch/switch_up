import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:switch_up/switch_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFfc8e28),
      ),
      home: const MyHomePage(title: 'Switch Up'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<States> states = [
    States(id: '1', name: 'Maharashtra', country: 'India'),
    States(id: '2', name: 'Gujarat', country: 'India'),
    States(id: '3', name: 'Goa', country: 'India'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SwitchUp<String>(
                backgroundColor: Colors.grey.shade200,
                items: const <String>['Home', 'Chat', 'Settings'],
                onChanged: (String value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                value: 'Settings',
              ),
              const SizedBox(height: 50),
              SwitchUp(
                backgroundColor: Colors.grey.shade200,
                color: Colors.amber,
                radius: 0,
                height: 50,
                items: const ['Active', 'Pending'],
                onChanged: (value) {
                  log(value);
                },
                value: 'Pending',
              ),
              const SizedBox(height: 50),
              SwitchUp(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF941F37),
                    Color(0xFF590012),
                  ],
                ),
                curves: Curves.bounceOut,
                backgroundColor: Colors.grey.shade200,
                items: const ['Male', 'Female', 'Other'],
                onChanged: (value) {
                  log(value);
                },
                value: 'Female',
              ),
              const SizedBox(height: 50),
              SwitchUp(
                backgroundColor: Colors.grey.shade200,
                radius: 40,
                gradient: const RadialGradient(
                  // begin: Alignment.topLeft,
                  // end: Alignment.bottomRight,
                  radius: 10,
                  colors: [
                    Color(0xFF941F37),
                    Color(0xFF590012),
                  ],
                ),
                curves: Curves.easeInOutQuart,
                items: const ['Normal', 'Bold', 'Italic'],
                onChanged: (value) {
                  log(value);
                },
                value: 'Bold',
              ),
              const SizedBox(height: 50),
              SwitchUp<States>(
                backgroundColor: Colors.pink.withOpacity(.1),
                radius: 10,
                height: 60,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFC466B),
                    Color(0xFF3F5EFB),
                  ],
                ),
                curves: Curves.easeInOutQuart,
                items: states,
                onChanged: (States value) {
                  if (kDebugMode) {
                    print(value);
                  }
                },
                value: states[2],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SwitchUp(
                      backgroundColor: Colors.grey.shade200,
                      height: 50,
                      radius: 40,
                      items: const ['Male', 'Female', 'Other'],
                      onChanged: (value) {
                        log(value);
                      },
                      value: 'Other',
                      curves: Curves.ease,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SwitchUp(
                      backgroundColor: Colors.grey.shade200,
                      color: Colors.amber,
                      radius: 0,
                      height: 50,
                      items: const ['Active', 'Pending'],
                      onChanged: (value) {
                        log(value);
                      },
                      value: 'Pending',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class States {
  final String id;
  final String name;
  final String country;

  States({required this.id, required this.name, required this.country});

  @override
  String toString() {
    return name;
  }
}
