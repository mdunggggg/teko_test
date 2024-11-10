import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';
import 'package:teko_hiring_test/domain/use_case/list_product_use_case.dart';

part 'product_list_page_event.dart';

part 'product_list_page_state.dart';

class ProductListPageBloc
    extends Bloc<ProductListPageEvent, ProductListPageState> {
  ProductListPageBloc(this._listProductUseCase)
      : super(ProductListPageInitial()) {
    on<ListProductLoad>(_loadData);
    on<ListProductLoadMore>(_loadMoreData);
  }

  final ListProductUseCase _listProductUseCase;
  int page = 0;
  bool loadMore = true;
  static const int size = 10;

  FutureOr<void> _loadData(
    ListProductLoad event,
    Emitter<ProductListPageState> emit,
  ) async {
    final res = await _listProductUseCase(offset: page * size, limit: size);
    emit(ListProductLoaded(res));
    loadMore = res.length == size;
    print('loadMore: $loadMore');
    print('res.length: ${res.length}');
    ++page;
  }

  FutureOr<void> _loadMoreData(
    ListProductLoadMore event,
    Emitter<ProductListPageState> emit,
  ) async {
    if (state is ListProductLoaded &&
        state is! ListProductLoadingMore &&
        loadMore) {
      emit(ListProductLoadingMore((state as ListProductLoaded).products));
      await Future.delayed(Duration(seconds: 1)); // Fake loading
      final res = await _listProductUseCase(offset: page * size, limit: size);
      emit(ListProductLoaded((state as ListProductLoadingMore).products + res));
      loadMore = res.length == size;
      ++page;
    }
  }
}
