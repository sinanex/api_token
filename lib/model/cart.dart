class CartModel {
  String? status;
  List<Data>? cartData;

  CartModel({
    required this.cartData,
    required this.status,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        cartData: (json['data'] as List<dynamic>)
            .map((item) => Data.fromJson(item))
            .toList(),
        status: json['status']);
  }
}

class Data {
  String? id;
  String? title;
  String? catogary;
  String? src;
  String? productName;
num? price;

  Data(
      {required this.catogary,
      required this.id,
      required this.price,
      required this.productName,
      required this.src,
      required this.title});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        catogary: json['category'],
        id: json['_id'],
        price: json['actualPrice'],
        productName: json['productName'],
        src: json['src'],
        title: json['title']);
  }
}
