/// Calls the specified function [block] with `this` value as its argument and returns its result.
extension ObjectExtension on Object {
  R let<T, R>(R Function(T) block) {
    return block(this);
  }
}