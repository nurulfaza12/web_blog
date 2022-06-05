part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadBlogs extends HomeEvent {
  const LoadBlogs();
}

class SearchBlog extends HomeEvent {
  final String word;

  const SearchBlog(this.word);

  @override
  List<Object> get props => [word];
}