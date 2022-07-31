import 'dart:convert';

List<Product> productFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String productToJson(Product data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class Product {

  // Properties
  int id;
  String productName;
  String productDetail;
  String productBarcode;
  int productQty;
  String productPrice;
  String productImage;
  String productCategory;
  int productStatus;
  DateTime createdAt;
  DateTime updatedAt;

  // Constructor
  Product({
    required this.id,
    required this.productName,
    required this.productDetail,
    required this.productBarcode,
    required this.productQty,
    required this.productPrice,
    required this.productImage,
    required this.productCategory,
    required this.productStatus,
    required this.createdAt,
    required this.updatedAt,
  });
  
  
  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      productName: json["product_name"],
      productDetail: json["product_detail"],
      productBarcode: json["product_barcode"],
      productQty: json["product_qty"],
      productPrice: json["product_price"],
      productImage: json["product_image"],
      productCategory: json["product_category"],
      productStatus: json["product_status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
  );

  // Map to json
  Map<String, dynamic> toJson() => {
      "id": id,
      "product_name": productName,
      "product_detail": productDetail,
      "product_barcode": productBarcode,
      "product_qty": productQty,
      "product_price": productPrice,
      "product_image": productImage,
      "product_category": productCategory,
      "product_status": productStatus,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
  };

  // to string
  @override
  String toString() {
    return 'Product(id: $id, productName: $productName, productDetail: $productDetail, productBarcode: $productBarcode, productQty: $productQty, productPrice: $productPrice, productImage: $productImage, productCategory: $productCategory, productStatus: $productStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

}
