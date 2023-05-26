class ProductModel {
  num? id,price;
  String? title, description, category, image;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});

  factory ProductModel.fromJson(Map m1) {
    return ProductModel(
        id: m1['id'],
        title: m1['title'],
        price: m1['price'],
        description: m1['description'],
        image: m1['image'],
        category: m1['category']);
  }
}
