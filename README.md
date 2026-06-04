# Flutter progressive time picker

A beautiful Flutter clock-style time picker inspired by Material Design.

Users simply tap a button to open an analog clock dialog, select an hour, select a minute, and confirm their choice.

The selected time is then displayed above the button.

---

# ✨ Features

- 🕐 Analog Clock Picker
- ⏰ Hour Selection
- ⏱ Minute Selection
- 🌗 AM / PM Toggle
- 📱 Dialog Based UI
- 🎯 Simple API
- 📳 Haptic Feedback
- ⌚ Current Time Button
- ✅ Select Button
- ❌ Cancel Button
- 🎨 Material Design Inspired
- ⚡ Lightweight & Fast
- 🔄 Controller Based Architecture

---

### Demo 



https://github.com/user-attachments/assets/527daf0c-d4ef-4fb7-97a5-4003a15bfee5


# 📦 Installation

Add dependency to your `pubspec.yaml`

```yaml
dependencies:
 flutter_progressive_time_picker:
    path: ../
```

Run:

```bash
flutter pub get
```

---

# 🚀 Import

```dart
import 'package:flutter_progressive_time_picker/flutter_progressive_time_picker.dart';

```

---

# 📱 Basic Usage

```dart
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
```

---

# 📱 Complete Example

```dart
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

```

---



# ⚙️ Parameters

| Parameter | Type | Description |
|------------|------|-------------|
| buttonText | String | Button label |
| initialTime | TimeOfDay | Initial selected time |
| onTimeSelected | ValueChanged<TimeOfDay> | Returns selected time |

---


# 📄 License

MIT License

Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
