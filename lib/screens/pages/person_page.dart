import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('PersonPage'),
          ],
        ),
      ),
    );
  }
}
