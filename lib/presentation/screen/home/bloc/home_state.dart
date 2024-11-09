part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final LabelEntity label;
  final List<FormEntity> forms;
  final ButtonEntity button;
  final List<ProductEntity> productList;

  HomeLoaded(this.productList, this.label, this.forms, this.button);
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
