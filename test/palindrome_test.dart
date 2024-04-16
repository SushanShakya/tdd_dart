import 'package:tdd_dart/palindrome.dart';
import 'package:test/test.dart';

void main() {
  test("Empty string is a palindrome", () {
    expect(isPalindrome(""), true);
  });

  test('A value with single character is a palindrome', () {
    final actual = isPalindrome("a");
    expect(actual, true);
  });

  test('A value with two same characters is a palindrome', () {
    expect(isPalindrome("aa"), true);
  });

  test('A value with two different characters is not a palindrome', () {
    expect(isPalindrome("ab"), false);
  });

  test(
    "A value with 3 characters is a palindrome if it's first and last entry is same",
    () {
      expect(isPalindrome("aba"), true);
    },
  );

  test(
    "A value with 3 characters is not a palindrome if it's first and last entry is different",
    () {
      expect(isPalindrome("aab"), false);
      expect(isPalindrome("abc"), false);
      expect(isPalindrome("abb"), false);
    },
  );

  test(
    "A value with 4 characters is a palindrome if it's first entry is equal to last entry and 2nd entry is equal to 2nd last entry",
    () {
      expect(isPalindrome("abba"), true);
      expect(isPalindrome("baab"), true);
    },
  );

  test(
    "A value with even characters is palindrome if it's first entry is equal to last entry and 2nd entry is equal to 2nd last entry and so on",
    () {
      expect(isPalindrome("aaaaaa"), true);
      expect(isPalindrome("abaaba"), true);
      expect(isPalindrome("xelaabbaalex"), true);
    },
  );
  test(
    "A value with even characters is not palindrome if it's first entry is not equal to last entry and 2nd entry is not equal to 2nd last entry and so on",
    () {
      expect(isPalindrome("aaaaax"), false);
      expect(isPalindrome("abaabb"), false);
      expect(isPalindrome("xelaabaaalex"), false);
    },
  );
  test(
    "A value with odd characters is palindrome if it's first entry is equal to last entry and 2nd entry is equal to 2nd last entry and so on",
    () {
      expect(isPalindrome("aaaxaaa"), true);
      expect(isPalindrome("abaxaba"), true);
      expect(isPalindrome("xelaabtbaalex"), true);
    },
  );

  test(
    "A value with odd characters is not palindrome if it's first entry is not equal to last entry and 2nd entry is not equal to 2nd last entry and so on",
    () {
      expect(isPalindrome("aaaxaba"), false);
      expect(isPalindrome("bbaxaba"), false);
      expect(isPalindrome("aelaabtbaalex"), false);
    },
  );
}
