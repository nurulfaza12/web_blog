import 'package:flutter/material.dart';
import 'package:web_blog/constants.dart';
import 'package:web_blog/models/blog.dart';
import 'package:web_blog/palette.dart';
import 'package:web_blog/screens/detail/detail_argument.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({Key? key, required this.blog}) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// TODO: add args
      onTap: () => Navigator.of(context).pushNamed(
        Constant.detailPath,
        arguments: DetailArgument(blog),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        //height: 75.0,
        constraints: BoxConstraints(maxHeight: 120.0),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                'Blog',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            SizedBox(height: 8.0),
            Flexible(
              child: Text(
                blog.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
