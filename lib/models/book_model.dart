
class Books {
  final int id;
  final String category;
  final String name;
  final String description;
  final String writer;
  final double fee;
  final int validation;
  final int item;
  final bool available;

  Books({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.writer,
    required this.fee,
    required this.validation,
    required this.item,
    required this.available,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      description: json['description'],
      writer: json['writer'],
      fee: double.parse(json['fee'].toString()),
      validation: json['validation'],
      item: json['item'],
      available: json['available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'description': description,
      'writer': writer,
      'fee': fee.toStringAsFixed(2),
      'validation': validation,
      'item': item,
      'available': available,
    };
  }
}

