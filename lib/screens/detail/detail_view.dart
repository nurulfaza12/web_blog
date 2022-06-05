import 'package:flutter/material.dart';
import 'package:web_blog/screens/detail/detail_argument.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.argument}) : super(key: key);

  final DetailArgument argument;

  @override
  Widget build(BuildContext context) {
    final blog = argument.blog;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(blog.title, style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(height: 12.0),
            Text(blog.body, style: textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}
