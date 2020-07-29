/// Represents a generic pair of two values.
class Pair<A, B> {
  final A first;
  final B second;

  Pair(this.first, this.second);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Pair && runtimeType == other.runtimeType &&
              first == other.first && second == other.second;

  @override
  int get hashCode => first.hashCode ^ second.hashCode;

  /// Returns string representation of the [Pair] including its [first] and [second] values.
  @override
  String toString() {
    return "($first, $second)";
  }
}