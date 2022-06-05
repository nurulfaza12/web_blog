import 'package:flutter/material.dart';
import 'package:web_blog/screens/detail/detail_argument.dart';
import 'package:web_blog/utils/palette.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.argument}) : super(key: key);

  final DetailArgument argument;

  @override
  Widget build(BuildContext context) {
    final blog = argument.blog;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              iconSize: 18.0,
              splashRadius: 18.0,
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  size: 18.0, color: Palette.text),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    style: textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    blog.body,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
