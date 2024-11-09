import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teko_hiring_test/domain/entities/button_attribute_entity.dart';
import 'package:teko_hiring_test/domain/entities/button_entity.dart';
import 'package:teko_hiring_test/domain/entities/form_entity.dart';
import 'package:teko_hiring_test/domain/entities/form_submit_entity.dart';
import 'package:teko_hiring_test/domain/entities/label_attribute_entity.dart';
import 'package:teko_hiring_test/domain/entities/label_entity.dart';
import 'package:teko_hiring_test/domain/entities/product_list_attribute_entity.dart';
import 'package:teko_hiring_test/domain/use_case/get_teko_test_use_case.dart';

import '../../../../domain/entities/product_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getTekoTestUseCase) : super(HomeInitial()) {
    on<HomeLoad>(_loadData);
  }

  final GetTekoTestUseCase _getTekoTestUseCase;

  Future<void> _loadData(HomeLoad event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final res = await _getTekoTestUseCase();

    late LabelEntity label;
    late List<FormEntity> forms;
    late ButtonEntity button;
    late List<ProductEntity> productList = [];

    for(final item in res) {
      if(item.customAttributes is LabelAttributeEntity) {
        label = (item.customAttributes as LabelAttributeEntity).label;
      } else if(item.customAttributes is FormSubmitEntity) {
        forms = (item.customAttributes as FormSubmitEntity).forms;
      } else if(item.customAttributes is ButtonAttributeEntity) {
        button = (item.customAttributes as ButtonAttributeEntity).button;
      } else if(item.customAttributes is ProductListAttributeEntity) {
        productList = (item.customAttributes as ProductListAttributeEntity).productList.products;
      }
    }

    emit(HomeLoaded(productList, label, forms, button));
  }
}
