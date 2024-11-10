part of 'product_list_page_bloc.dart';

@immutable
sealed class ProductListPageState {}

final class ProductListPageInitial extends ProductListPageState {}

final class ListProductLoading extends ProductListPageState {}

final class ListProductLoaded extends ProductListPageState {
  ListProductLoaded(this.products);

  final List<ProductEntity> products;
}

final class ListProductLoadingMore extends ListProductLoaded {
  ListProductLoadingMore(super.products);
}

final class ListProductFailure extends ProductListPageState {
  ListProductFailure(this.message);

  final String message;
}
