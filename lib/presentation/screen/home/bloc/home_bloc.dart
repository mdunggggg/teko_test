import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teko_hiring_test/domain/entities/button_attribute_entity.dart';
import 'package:teko_hiring_test/domain/entities/button_entity.dart';
import 'package:teko_hiring_test/domain/entities/form_entity.dart';
import 'package:teko_hiring_test/domain/entities/form_submit_entity.dart';
import 'package:teko_hiring_test/domain/entities/label_attribute_entity.dart';
import 'package:teko_hiring_test/domain/entities/label_entity.dart';
import 'package:teko_hiring_test/domain/entities/product_list_attribute_entity.dart';
import 'package:teko_hiring_test/domain/use_case/add_product_use_case.dart';
import 'package:teko_hiring_test/domain/use_case/get_teko_test_use_case.dart';

import '../../../../domain/entities/product_entity.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getTekoTestUseCase, this._addProductUseCase)
      : super(HomeInitial()) {
    on<HomeLoad>(_loadData);
    on<HomeAddProduct>(_addProduct);
  }

  final GetTekoTestUseCase _getTekoTestUseCase;
  final AddProductUseCase _addProductUseCase;

  Future<void> _loadData(HomeLoad event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _getTekoTestUseCase();

    late LabelEntity label;
    late List<FormEntity> forms;
    late ButtonEntity button;
    late List<ProductEntity> productList = [];

    for (final item in res) {
      if (item.customAttributes is LabelAttributeEntity) {
        label = (item.customAttributes as LabelAttributeEntity).label;
      } else if (item.customAttributes is FormSubmitEntity) {
        forms = (item.customAttributes as FormSubmitEntity).forms;
      } else if (item.customAttributes is ButtonAttributeEntity) {
        button = (item.customAttributes as ButtonAttributeEntity).button;
      } else if (item.customAttributes is ProductListAttributeEntity) {
        productList = (item.customAttributes as ProductListAttributeEntity)
            .productList
            .products;
      }
    }

    emit(HomeLoaded(productList, label, forms, button));
  }

  void _addProduct(HomeAddProduct event, Emitter<HomeState> emit) {
    final state = this.state as HomeLoaded;
    final product = ProductEntity(
      name: event.name,
      price: event.price,
      imageSrc: event.imageSrc ??
          'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg',
    );
    _addProductUseCase(product);
    final productList = [product, ...state.productList];
    print('productList: ${productList.length}');
    emit(
      HomeLoaded(
        productList,
        state.label,
        state.forms,
        state.button,
      ),
    );
  }
}
