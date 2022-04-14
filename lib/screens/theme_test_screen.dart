import 'package:flutter/material.dart';

class ThemeTestScreen extends StatelessWidget {
  const ThemeTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Text('Hello babe'),
            Text('How are u'),
          ],
        ),
      ),
    );
  }
}
