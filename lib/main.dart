import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Change Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorChangeButton(),
    );
  }
}

class ColorChangeButton extends StatefulWidget {
  @override
  _ColorChangeButtonState createState() => _ColorChangeButtonState();
}

class _ColorChangeButtonState extends State<ColorChangeButton> {
  Color _backgroundColor = Colors.red; // Default background color is red
  List<Color> _colors = [
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.orange
  ];
  int _currentIndex = 0;

  void _changeBackgroundColor() {
    setState(() {
      // Change the background color to yellow first, then cycle through the array
      if (_backgroundColor == Colors.red) {
        _backgroundColor = Colors.yellow;
      } else {
        _backgroundColor = _colors[_currentIndex];
        _currentIndex =
            (_currentIndex + 1) % _colors.length; // Cycle through colors
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor, // Set the background color
      appBar: AppBar(
        title: Text('Color Change Button'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _changeBackgroundColor,
          child: Text('Press Me'),
        ),
      ),
    );
  }
}
