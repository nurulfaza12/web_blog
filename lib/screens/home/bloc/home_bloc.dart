import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_blog/models/blog.dart';
import 'package:web_blog/repositories/blog_repository.dart';
import 'package:web_blog/services/api_service.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BlogRepository _blogRepository = BlogRepository(ApiService());

  HomeBloc() : super(HomeLoading()) {
    on<LoadBlogs>(_onLoadBlogs);
  }

  Future<void> _onLoadBlogs(LoadBlogs event, Emitter<HomeState> emit) async {
    try {
      final blogs = await _blogRepository.getBlogs();
      return emit(HomeLoaded(blogs: blogs));
    } catch (e) {
      return emit(HomeFailure(error: e.toString()));
    }
  }

}