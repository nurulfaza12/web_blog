import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({Key? key, required this.onPressed}) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              'Something is wrong... \nPlease try again',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () => onPressed(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
