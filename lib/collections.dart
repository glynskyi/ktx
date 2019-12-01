import 'dart:core';

extension ktx<T> on Iterable<T> {
  /// Returns a [Map] containing the values provided by [valueTransform] and indexed by [keySelector] functions applied to elements of the given collection.
  ///
  /// If any two elements would have the same key returned by [keySelector] the last one gets added to the map.
  ///
  /// The returned map preserves the entry iteration order of the original collection.
  Map<K, T> associateBy<K>(K Function(T) keySelector) {
    return associateByTo({}, keySelector);
  }

  /// Populates and returns the [destination] mutable map with key-value pairs,
  /// where key is provided by the [keySelector] function applied to each element of the given collection
  /// and value is the element itself.
  ///
  /// If any two elements would have the same key returned by [keySelector] the last one gets added to the map.
  Map<K, T> associateByTo<K>(Map<K, T> destination, K Function(T) keySelector) {
    for (var element in this) {
      destination[keySelector(element)] = element;
    }
    return destination;
  }
}
