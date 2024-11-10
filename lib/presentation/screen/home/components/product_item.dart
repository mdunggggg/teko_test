import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';
import 'package:teko_hiring_test/shared/extension/ext_num.dart';
import 'package:teko_hiring_test/shared/extension/ext_widget.dart';

import '../../../../shared/style_text/style_text.dart';
import '../../../components/cache_image.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.imageSrc.startsWith('http'))
          BaseCacheImage(url: product.imageSrc).size(height: 200),
        if (!product.imageSrc.startsWith('http'))
          Image.file(File(product.imageSrc)).size(height: 200),
        4.height,
        Text(
          product.name,
          style: StyleApp.bold(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        4.height,
        Text(
          '${product.price.formatCurrency} đ',
          style: StyleApp.normal(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    ) ;
  }
}
