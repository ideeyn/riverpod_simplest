enum Category { food, drink, book }

class DataModel {
  DataModel({
    required this.name,
    required this.desc,
    required this.category,
    required this.quantity,
  });

  final String name;
  final String desc;
  final Category category;
  final int quantity;
}
