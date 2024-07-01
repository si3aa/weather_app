import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There Is Now Weather Start',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Searching Now 🔍',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
