import 'package:get_it/get_it.dart';
import 'package:teko_hiring_test/data/mapper/button_attribute_mapper.dart';
import 'package:teko_hiring_test/data/mapper/button_mapper.dart';
import 'package:teko_hiring_test/data/mapper/component_mapper.dart';
import 'package:teko_hiring_test/data/mapper/form_mapper.dart';
import 'package:teko_hiring_test/data/mapper/form_submit_mapper.dart';
import 'package:teko_hiring_test/data/mapper/label_attribute_mapper.dart';
import 'package:teko_hiring_test/data/mapper/label_mapper.dart';
import 'package:teko_hiring_test/data/mapper/product_list_mapper.dart';
import 'package:teko_hiring_test/data/mapper/product_mapper.dart';
import 'package:teko_hiring_test/data/remotes/products_remote.dart';
import 'package:teko_hiring_test/domain/repositories/product_repository.dart';
import 'package:teko_hiring_test/presentation/screen/home/bloc/home_bloc.dart';

import '../../data/api/dio.dart';
import '../../data/mapper/product_list_attribute_mapper.dart';
import '../../data/repository_impl/product_repository_impl.dart';
import '../../domain/use_case/get_teko_test_use_case.dart';

class DiConfig {
  static final DiConfig _instance = DiConfig._internal();

  factory DiConfig() {
    return _instance;
  }

  GetIt injector = GetIt.instance;

  DiConfig._internal() {
    injector.registerSingleton<ApiService>(ApiService());

    // ================== REMOTE ==================
    injector.registerLazySingleton<ProductRemote>(
      () => ProductRemote(injector.get()),
    );

    // ================== REPOSITORY ==================
    injector.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(injector.get(), injector.get()),
    );

    // ================== USE CASE ==================
    injector.registerLazySingleton<GetTekoTestUseCase>(
      () => GetTekoTestUseCase(injector.get()),
    );
    // ================== BLOC ==================
    injector.registerFactory(
      () => HomeBloc(injector.get()),
    );


    // ================== MAPPER ==================
    injector.registerLazySingleton<ProductMapper>(
      () => ProductMapper(),
    );
    injector.registerLazySingleton<ProductListMapper>(
      () => ProductListMapper(injector.get()),
    );
    injector.registerLazySingleton<ProductListAttributeMapper>(
      () => ProductListAttributeMapper(injector.get()),
    );
    injector.registerLazySingleton<LabelMapper>(
      () => LabelMapper(),
    );
    injector.registerLazySingleton<LabelAttributeMapper>(
      () => LabelAttributeMapper(injector.get()),
    );
    injector.registerLazySingleton<FormSubmitMapper>(
      () => FormSubmitMapper(injector.get()),
    );
    injector.registerLazySingleton<FormMapper>(
      () => FormMapper(),
    );
    injector.registerLazySingleton<ButtonMapper>(
      () => ButtonMapper(),
    );
    injector.registerLazySingleton<ButtonAttributeMapper>(
      () => ButtonAttributeMapper(injector.get()),
    );
    injector.registerLazySingleton<ComponentMapper>(
      () => ComponentMapper(
        injector.get(),
        injector.get(),
        injector.get(),
        injector.get(),
      ),
    );
  }
}

GetIt get injector => DiConfig().injector;
