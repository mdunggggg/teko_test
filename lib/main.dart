import 'package:flutter/material.dart';
import 'package:teko_hiring_test/domain/use_case/list_product_use_case.dart';
import 'package:teko_hiring_test/presentation/di/di.dart';
import 'data/local/db/app_database.dart';
import 'presentation/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();
  final ListProductUseCase listProductUseCase = DiConfig().injector.get();
  final res = await listProductUseCase(offset: 1, limit: 10);
  print('res length: ${res.length}');
  runApp(const MyApp());
}
