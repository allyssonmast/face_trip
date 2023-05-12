import 'package:flutter/material.dart';

class WidgetTopWelcome extends StatelessWidget {
  const WidgetTopWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text('Welcome Buddies', style: Theme.of(context).textTheme.bodyLarge),
        Text(' Login to book your seat, I said its your seat',
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 30),
      ],
    );
  }
}
