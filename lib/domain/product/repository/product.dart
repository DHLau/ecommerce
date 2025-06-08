import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';

abstract class ProductRepository {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategoryId(String categoryId);
  Future<Either> getProductByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity entity);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoriteProducts();

  /// 本地收藏
  Future<void> cacheFavoriteProducts(List<ProductEntity> models);

  /// 获取本地收藏
  Future<Either> getCachedFavoriteProducts();
}
