import 'package:flutter/material.dart';
import 'package:flutter_progressive_time_picker/flutter_progressive_time_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clock Time Picker')),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ClockTimePicker(
                buttonText: 'Pick Time',

                initialTime: TimeOfDay.now(),

                onTimeSelected: (time) {
                  setState(() {
                    selectedTime = time;
                  });

                  debugPrint(time.format(context));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
