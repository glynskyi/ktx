import 'package:ktx/ktx.dart';
import 'package:test/test.dart';

class _Fruit {
  final String kind;
  final String color;

  _Fruit(this.kind, this.color);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Fruit && runtimeType == other.runtimeType && kind == other.kind && color == other.color;

  @override
  int get hashCode => kind.hashCode ^ color.hashCode;
}

void main() {
  test('converts list to map', () {
    final numbers = [1, 2, 3];
    final map = numbers.associateBy((number) => number);
    expect(map, {1: 1, 2: 2, 3: 3});
  });

  test('converts map to list', () {
    final numbers = {1: "1", 2: "2", 3: "3"};
    final map = numbers.mapToList((key, value) => "$key" == value);
    expect(map, [true, true, true]);
  });

  test('sorts strings by length', () {
    final alphabet = ["Xi", "Alpha", "Beta"];
    final sortedAlphabet = alphabet.sortBy((symbol) => symbol.length);
    expect(sortedAlphabet, ["Xi", "Beta", "Alpha"]);
  });

  test('sorts strings descending by first symbol', () {
    final alphabet = ["Xi", "Alpha", "Beta"];
    final sortedAlphabet = alphabet.sortByDescending((symbol) => symbol[0]);
    expect(sortedAlphabet, ["Xi", "Beta", "Alpha"]);
  });

  test('groups by first name', () {
    final fruits = [_Fruit("Apple", "Pear"), _Fruit("Apple", "Red")];
    final groupedFruits = fruits.groupBy((fruit) => fruit.kind);
    expect(groupedFruits, {
      "Apple": [_Fruit("Apple", "Pear"), _Fruit("Apple", "Red")]
    });
  });

  test('maps with nullable elements', () {
    final fruits = [_Fruit("Pear", "Green"), _Fruit("Apple", "Red")];
    final mappedFruits = fruits.mapNotNull((fruit) => fruit.color.startsWith("G") ? fruit : null);
    expect(mappedFruits, [_Fruit("Pear", "Green")]);
  });

  test('calls `let` on Integer', () {
    const a = 2;
    const b = 3;
    final c = a.let((it) => it * b);
    expect(c, 6);
  });

  test('calls `let` on nullable object', () {
    const String? source = null;
    final target = source?.let((it) => it.length);
    expect(target, null);
  });

  test('uses Pair with none nullable values', () {
    final age = Pair("age", 42);
    expect(age.first, "age");
    expect(age.second, 42);
  });

  test('uses Pair with nullable values', () {
    final age = Pair("age", null);
    expect(age.first, "age");
    expect(age.second, null);
  });

  test('compares two Pairs', () {
    final age1 = Pair("age", 42);
    final age2 = Pair("age", 42);
    expect(age1, age2);
  });

  test('prints Pairs', () {
    final age = Pair("age", 42);
    expect(age.toString(), "(age, 42)");
  });

  test('uses map to store Pairs', () {
    final age1 = Pair("age", 42);
    final age2 = Pair("age", 48);
    final map = {age1: "person1", age2: "person2"};
    expect(map[age1], "person1");
  });

  test('transforms list with indexes', () {
    final fruits = ["Apple", "Pear", "Orange"];
    final indexedFruits = fruits.mapIndexed((index, fruit) => "${index + 1}: $fruit");
    expect(indexedFruits, ["1: Apple", "2: Pear", "3: Orange"]);
  });

  test('zips to lists into one', () {
    final kinds = ["Apple", "Pear", "Apricot"];
    final colors = ["Red", "Green", "Orange"];
    final fruits = kinds.zip<String, _Fruit>(colors, (kind, color) => _Fruit(kind, color));
    expect(fruits, [_Fruit("Apple", "Red"), _Fruit("Pear", "Green"), _Fruit("Apricot", "Orange")]);
  });

  test('sumBy on empty collection', () {
    final fruits = <String>[];
    final calories = fruits.sumBy((fruit) => fruit.length);
    expect(calories, 0);
  });

  test('sumBy on collection with a single element', () {
    final fruits = <String>["Apple"];
    final calories = fruits.sumBy((fruit) => fruit.length);
    expect(calories, 5);
  });

  test('sumBy on collection with a few elements', () {
    final fruits = <String>["Apple", "Pear"];
    final calories = fruits.sumBy((fruit) => fruit.length);
    expect(calories, 9);
  });
}
