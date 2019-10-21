import 'package:ktx/ktx.dart';
import 'package:test/test.dart';

void main() {
  test('converts list to map', () {
    final numbers = [1, 2, 3];
    final map = numbers.associateBy((number) => number);
    expect(map, {1: 1, 2: 2, 3: 3});
  });
}
