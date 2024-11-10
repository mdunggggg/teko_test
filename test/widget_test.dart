import 'package:flutter_test/flutter_test.dart';
import 'package:teko_hiring_test/data/local/dao/product_dao.dart';
import 'package:teko_hiring_test/data/local/db/app_database.dart';
import 'package:teko_hiring_test/data/model/product_model/product_model.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';

Future<void> main() async {
  final AppDatabase appDatabase = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
  final ProductDao productDao = appDatabase.productDao;
  test('test insert product', () async {
    await productDao.insertProduct(ProductEntity(name: 'San pham 1', price: 100000, imageSrc: 'https://google.com'));
    final List<ProductEntity> products = await productDao.getProducts();
    expect(products.length, 1);
  });

  test('test insert multi product', () async {
    const int numProduct = 10;
    for (int i = 0; i < numProduct; i++) {
      await productDao.insertProduct(ProductEntity(name: 'San pham $i', price: 100000, imageSrc: 'https://google.com'));
    }
    final List<ProductEntity> products = await productDao.getProducts();
    expect(products.length, numProduct);
  });



}
