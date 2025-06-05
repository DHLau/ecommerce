// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductOrderedEntity {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createDate;
  final String id;

  ProductOrderedEntity({
    required this.id,
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createDate,
  });

  factory ProductOrderedEntity.fromMap(Map<String, dynamic> map) {
    return ProductOrderedEntity(
      id: map['id'] as String,
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: map['productColor'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createDate: map['createDate'] as String,
    );
  }
}
