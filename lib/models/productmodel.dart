class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String category;

  //final Float rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image
      //required this.rating
      });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        image: json['image'],
        description: json['description'],
        category: json['category']
        //rating: json['rating']
        );
  }
}
