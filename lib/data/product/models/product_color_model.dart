// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:ecommerce/domain/product/entity/product_color_entity.dart';

class ProductColorModel {
  final String title;
  final String hexCode;

  ProductColorModel({
    required this.title,
    required this.hexCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hexCode': hexCode,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      hexCode: map['hexCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(title: title, hexCode: hexCode);
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(title: title, hexCode: hexCode);
  }
}
