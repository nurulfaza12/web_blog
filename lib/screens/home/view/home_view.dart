import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_blog/screens/home/bloc/home_bloc.dart';
import 'package:web_blog/screens/home/view/widgets/blog_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(const LoadBlogs()),
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is HomeLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return BlogCard(blog: state.blogs[index]);
                      },
                      childCount: 10,
                    ),
                  );
                } else {
                  /// TODO: empty & error state
                  return SliverToBoxAdapter(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
