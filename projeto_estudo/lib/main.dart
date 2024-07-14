import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  onPressed() => {
    print('Button Clicked')
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
            Container(
              color: Colors.green,
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(20),
            ),
            const Text(
                'Hello World',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ElevatedButton(
                onPressed: onPressed,
                child: Text('Click Me'),
            )
          ],
        ),
      ),
      // home: Stack(
      //   children: [
      //     Container(
      //       color: Colors.red,
      //     ),
      //     Container(
      //       color: Colors.green,
      //       margin: const EdgeInsets.all(20),
      //     ),
      //   ],
      //
      // ),
    );
  }
}

