
class Contacts {
  final String name;
  final String number;
  bool isSelected;

  Contacts({required this.name, required this.number, this.isSelected = false});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
    };
  }
}
