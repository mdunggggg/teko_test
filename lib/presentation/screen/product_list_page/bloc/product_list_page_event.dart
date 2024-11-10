part of 'product_list_page_bloc.dart';

@immutable
sealed class ProductListPageEvent {}


final class ListProductLoad extends ProductListPageEvent {}

final class ListProductLoadMore extends ProductListPageEvent {}