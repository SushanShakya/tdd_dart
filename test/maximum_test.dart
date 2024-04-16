import 'package:tdd_dart/maximum.dart';
import 'package:test/test.dart';

void main() {
  test("An empty list returns 0 as maximum", () {
    expect(maximum([]), 0);
  });

  test("A list with single item returns that item as maximum", () {
    expect(maximum([0]), 0);
    expect(maximum([10]), 10);
  });

  test("A list with 2 items should return the greater item", () {
    expect(maximum([10, 20]), 20);
    expect(maximum([20, 10]), 20);
  });

  test("A list with 3 items should return the greater item", () {
    expect(maximum([10, 20, 30]), 30);
    expect(maximum([30, 20, 10]), 30);
  });

  test("A list with n items should return the greater item", () {
    expect(maximum([10, 20, 30, 0, 1, 2]), 30);
    expect(maximum([30, 20, 10, 40, 20, 1, 2]), 40);
  });
}
