import 'package:flutter/material.dart';

class EmptyErrorState extends StatelessWidget {
  const EmptyErrorState({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
