part of 'home_bloc.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeEmpty extends HomeState {}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class HomeLoaded extends HomeState {
  final List<Blog> blogs;

  HomeLoaded({
    required this.blogs,
  });

  HomeLoaded copyWith({
    required List<Blog> blogs
  }) {
    return HomeLoaded(
      blogs: blogs,
    );
  }

  @override
  List<Object> get props => [
    blogs,
  ];
}