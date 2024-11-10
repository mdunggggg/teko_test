part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeLoad extends HomeEvent {
  HomeLoad();
}

class HomeAddProduct extends HomeEvent {
  final String name;
  final int price;
  final String? imageSrc;

  HomeAddProduct(this.name, this.price, this.imageSrc);
}


