import 'package:ktx/ktx.dart';
import 'package:test/test.dart';

class _User {
  final String firstName;
  final String lastName;

  _User(this.firstName, this.lastName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode;
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
    final List<_User> users = [_User("Vladimir", "Glynskyi"), _User("Vladimir", "Zelenskyi")];
    final groupedUsers = users.groupBy((user) => user.firstName);
    expect(groupedUsers, {
      "Vladimir": [_User("Vladimir", "Glynskyi"), _User("Vladimir", "Zelenskyi")]
    });
  });

  test('maps with nullable elements', () {
    final List<_User> users = [_User("Vladimir", "Glynskyi"), _User("Vladimir", "Zelenskyi")];
    final mappedUsers = users.mapNotNull((user) => user.lastName.startsWith("G") ? user : null);
    expect(mappedUsers, [_User("Vladimir", "Glynskyi")]);
  });
}
