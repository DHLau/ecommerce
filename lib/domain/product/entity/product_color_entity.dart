// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductColorEntity {
  final String title;
  final String hexCode;

  ProductColorEntity({
    required this.title,
    required this.hexCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hexCode': hexCode,
    };
  }
}
