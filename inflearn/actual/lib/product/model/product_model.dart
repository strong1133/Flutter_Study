class ProductModel {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  ProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory ProductModel.fromJson({required Map<String, dynamic> jsonMap}) {
    ProductModel productModel =
        ProductModel(id: jsonMap['id'], name: jsonMap['name'], imgUrl: jsonMap['imgUrl'], detail: jsonMap['detail'], price: jsonMap['price']);

    return productModel;
  }
}
