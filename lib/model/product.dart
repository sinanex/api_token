class ProductModel {
  String? status;
  List<AllData> data;

  ProductModel({required this.status, required this.data});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        status: json['status'],
        data: (json['data'] as List<dynamic>)
            .map((item) => AllData.fromJson(item))
            .toList());
  }
}

class AllData {
  String? id;
  String? title;
  String? catorgary;
  String? src;
  List<dynamic> productDesc;
  String? productName;

  AllData({
    required this.id,
    required this.catorgary,
    required this.productDesc,
    required this.src,
    required this.title,
    required this.productName,
  });
  factory AllData.fromJson(Map<String, dynamic> json) {
    return AllData(
        productName: json['productName'],
        id: json['_id'],
        catorgary: json['category'],
        productDesc: json['productDescription'],
        src: json['src'],
        title: json['title']);
  }
}
