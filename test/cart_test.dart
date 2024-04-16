import 'package:tdd_dart/cart.dart';
import 'package:test/test.dart';

void main() {
  late Cart cart;
  setUp(() {
    cart = Cart();
  });
  test("Cart is empty to begin with", () {
    expect(cart.isEmpty(), true);
  });

  test("Cart can be initialized with items and it becomes non empty", () {
    final items = [CartItem(name: 'Apple'), CartItem(name: 'Mango')];
    cart = Cart(items: items);
    expect(cart.items, items);
    expect(cart.isEmpty(), false);
  });

  test("Item can be added to card", () {
    cart.addItem(CartItem(name: "Apple"));
    expect(cart.items.length, 1);
  });

  test(
    "Adding two different items increases size of cart",
    () {
      cart = Cart();
      cart.addItem(CartItem(name: "apple"));
      cart.addItem(CartItem(name: "b"));
      expect(cart.items.length, 2);
    },
  );

  test(
    "Adding same item to the cart increases quantity of the item instead of adding a new cart element",
    () {
      cart = Cart(
        items: [
          CartItem(name: 'Apple'),
          CartItem(name: "b"),
        ],
      );
      cart.addItem(CartItem(name: "Apple"));

      expect(cart.items.length, 2);
      expect(cart.items[0].quantity, 2);
    },
  );

  test(
    "Adding same item with extra quantity to the cart increases quantity of the item to sum of old and new quantities",
    () {
      cart = Cart(
        items: [
          CartItem(name: 'Apple', quantity: 2),
          CartItem(name: "b"),
        ],
      );
      cart.addItem(CartItem(name: "Apple", quantity: 2));

      expect(cart.items.length, 2);
      expect(cart.items[0].quantity, 4);
    },
  );

  test('Item can be removed from the cart by index', () {
    cart = Cart(items: [
      CartItem(name: "Apple"),
      CartItem(name: "Ball"),
    ]);
    cart.removeItem(0);
    expect(cart.items[0], CartItem(name: "Ball"));

    cart = Cart(items: [
      CartItem(name: "Apple"),
      CartItem(name: "Ball"),
    ]);
    cart.removeItem(1);
    expect(cart.items[0], CartItem(name: "Apple"));
  });

  test('Item can be removed from the cart by item name', () {
    cart = Cart(items: [
      CartItem(name: "Apple"),
      CartItem(name: "Ball"),
    ]);
    cart.remove("Apple");
    expect(cart.items[0], CartItem(name: "Ball"));

    cart = Cart(items: [
      CartItem(name: "Apple"),
      CartItem(name: "Ball"),
    ]);
    cart.remove("Ball");
    expect(cart.items[0], CartItem(name: "Apple"));
  });

  test("Removing non-existent item from cart does nothing", () {
    cart = Cart(items: [
      CartItem(name: "Apple"),
      CartItem(name: "Ball"),
    ]);
    cart.remove("cart");
    expect(cart.items.length, 2);
  });
}
