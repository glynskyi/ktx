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
}
