import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_blog/models/blog.dart';
import 'package:web_blog/repositories/blog_repository.dart';
import 'package:web_blog/services/api_service.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BlogRepository _blogRepository = BlogRepository(ApiService());
  late List<Blog> _allBlogs; // store data fetched from API

  HomeBloc() : super(HomeLoading()) {
    on<LoadBlogs>(_onLoadBlogs);
    on<SearchBlog>(_onSearchBlog);
  }

  Future<void> _onLoadBlogs(LoadBlogs event, Emitter<HomeState> emit) async {
    try {
      final blogs = await _blogRepository.getBlogs();
      _allBlogs = blogs;
      return emit(HomeLoaded(blogs: blogs));
    } catch (e) {
      return emit(HomeFailure(error: e.toString()));
    }
  }

  Future<void> _onSearchBlog(SearchBlog event, Emitter<HomeState> emit) async {
    if (event.word.isEmpty) {
      return emit(HomeLoaded(blogs: _allBlogs));
    } else {
      emit(HomeLoading());

      // add delay to show loading state
      final searchResult = await Future.delayed(
        const Duration(seconds: 1),
        () => _allBlogs
            .where((blog) => blog.title.contains(event.word.toLowerCase()))
            .toList(),
      );

      if (searchResult.isNotEmpty) {
        return emit(HomeLoaded(blogs: searchResult));
      } else {
        return emit(HomeEmpty());
      }
    }
  }
}
