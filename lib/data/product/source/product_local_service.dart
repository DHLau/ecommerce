import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/product/models/product_model.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalService {
  Future<void> cacheFavoriteProducts(List<ProductEntity> models);
  Future<Either> getCachedFavoriteProducts();
}

class ProductLocalServiceImpl implements ProductLocalService {
  static const _key = 'favorite_product_ids';

  // 也就是说，这个构造函数只能在当前 Dart 文件（库）内调用，外部不能用它实例化。
  // ProductLocalServiceImpl._(this._prefs);
  // 这是一个默认（unnamed）构造函数。
  // 它是public（公开）的，外部代码都能用这个构造函数实例化类。

  @override
  Future<void> cacheFavoriteProducts(List<ProductEntity> models) async {
    final stringList =
        models.map((e) => jsonEncode(e.fromEntity().toJson())).toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, stringList);
  }

  @override
  Future<Either> getCachedFavoriteProducts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final stringList = prefs.getStringList(_key);
      return Right(stringList);
    } catch (e) {
      return Left(e);
    }
  }
}
