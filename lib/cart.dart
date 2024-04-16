// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  final String name;
  final int quantity;
  CartItem({
    required this.name,
    this.quantity = 1,
  });

  @override
  bool operator ==(covariant CartItem other) {
    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  CartItem copyWith({
    String? name,
    int? quantity,
  }) {
    return CartItem(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }
}

class Cart {
  List<CartItem> items;

  Cart({this.items = const []});

  bool isEmpty() {
    return items.isEmpty;
  }

  void addItem(CartItem item) {
    if (items.contains(item)) {
      final i = items.indexOf(item);
      items.replaceRange(
        i,
        i + 1,
        [items[i].copyWith(quantity: items[i].quantity + item.quantity)],
      );
      return;
    }
    items = [...items, item];
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void remove(String name) {
    items.remove(CartItem(name: name));
  }
}
