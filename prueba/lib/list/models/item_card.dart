import 'dart:convert';

class ItemCard {
  final String title;
  final String category;
  final String price;
  final String imageUrl;

  ItemCard({
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
  });

  factory ItemCard.fromJson(Map<String, dynamic> json) {
    return ItemCard(
      title: json['title'],
      category: json['category'],
      price: json['price'],
      imageUrl: 'assets/images/${json['id']}.png',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'price': price,
    };
  }

  static List<ItemCard> fromJsonList(String jsonString) {
    final List<dynamic> data = json.decode(jsonString);
    return data.map((item) => ItemCard.fromJson(item)).toList();
  }
}
