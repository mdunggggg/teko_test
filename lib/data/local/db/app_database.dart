import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:teko_hiring_test/data/local/dao/product_dao.dart';

import '../../../domain/entities/product_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ProductEntity])
abstract class AppDatabase extends FloorDatabase {
  static AppDatabase? _instance;
  static AppDatabase get instance {
    return _instance!;
  }

  ProductDao get productDao;
  static Future<void> init() async {
    _instance = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
