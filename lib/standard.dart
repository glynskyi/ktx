/// Calls the specified function [block] with `this` value as its argument and returns its result.
extension ObjectExtension<T> on T {
  R let<R>(R Function(T) block) {
    return block(this);
  }
}