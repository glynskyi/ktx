import 'package:ktx/ktx.dart';
import 'package:test/test.dart';

void main() {
  test('converts list to map', () {
    final numbers = [1, 2, 3];
    final map = numbers.associateBy((number) => number);
    expect(map, {1: 1, 2: 2, 3: 3});
  });

  test('converts map to list', () {
    final numbers = {1 : "1", 2: "2", 3: "3"};
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
}
