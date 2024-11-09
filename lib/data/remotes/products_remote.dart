import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:teko_hiring_test/data/api/dio.dart';
import 'package:teko_hiring_test/data/model/base/component_model.dart';

import '../model/base/base_model.dart';

part 'products_remote.g.dart';


@RestApi(baseUrl: 'api/products')
abstract class ProductRemote {
  factory ProductRemote(ApiService apiService) = _ProductRemote;

  @GET('/management')
  Future<BaseModel<List<ComponentModel>>> getManagements();
}