import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_blog/screens/home/bloc/home_bloc.dart';
import 'package:web_blog/screens/home/view/widgets/blog_card.dart';
import 'package:web_blog/screens/home/view/widgets/error_state.dart';
import 'package:web_blog/screens/home/view/widgets/empty_state.dart';
import 'package:web_blog/screens/home/view/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeFailure) {
            return ErrorState(
                onPressed: () => context.read<HomeBloc>().add(const LoadBlogs()));
          } else {
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: SearchBar(
                    onClear: () =>
                        context.read<HomeBloc>().add(const SearchBlog('')),
                    onSubmit: (word) =>
                        context.read<HomeBloc>().add(SearchBlog(word)),
                  ),
                  //title:
                ),
                if (state is HomeLoading)
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (state is HomeLoaded)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return BlogCard(blog: state.blogs[index]);
                      },
                      childCount: state.blogs.length,
                    ),
                  )
                else
                  const SliverToBoxAdapter(
                    child: EmptyState(),
                  )
              ],
            );
          }
        },
      ),
    );
  }
}
