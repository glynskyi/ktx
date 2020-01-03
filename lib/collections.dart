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

  /// Sorts elements in the list in-place according to natural sort order of the value returned by specified [selector] function.
  ///
  /// The sort is _stable_. It means that equal elements preserve their order relative to each other after sorting.
  List<T> sortBy<R extends Comparable>(R Function(T) selector) {
    return sortTo([], _compareBy(selector));
  }

  /// Sorts elements in the list in-place descending according to natural sort order of the value returned by specified [selector] function.
  ///
  /// The sort is _stable_. It means that equal elements preserve their order relative to each other after sorting.
  List<T> sortByDescending<R extends Comparable>(R Function(T) selector) {
    return sortTo([], _compareByDescending(selector));
  }

  List<T> sortTo(List<T> destination, Comparator<T> comparator) {
    destination.addAll(this);
    destination.sort((left, right) => comparator(left, right));
    return destination;
  }

  /// Creates a comparator using the function to transform value to a [Comparable] instance for comparison.
  Comparator<T> _compareBy<R extends Comparable>(R Function(T) selector) {
    return (T left, T right) {
      return selector(left).compareTo(selector(right));
    };
  }

  /// Creates a descending comparator using the function to transform value to a [Comparable] instance for comparison.
  Comparator<T> _compareByDescending<R extends Comparable>(R Function(T) selector) {
    return (T left, T right) {
      return selector(right).compareTo(selector(left));
    };
  }

  /// Groups elements of the original collection by the key returned by the given [keySelector] function
  /// applied to each element and returns a map where each group key is associated with a list of corresponding elements.
  ///
  /// The returned map preserves the entry iteration order of the keys produced from the original collection.
  Map<K, List<T>> groupBy<K>(K Function(T) keySelector) {
    return groupByTo({}, keySelector);
  }

  /// Groups elements of the original collection by the key returned by the given [keySelector] function
  /// applied to each element and puts to the [destination] map each group key associated with a list of corresponding elements.
  ///
  /// @return The [destination] map.
  Map<K, List<T>> groupByTo<K>(Map<K, List<T>> destination, K Function(T) keySelector) {
    for (var element in this) {
      final key = keySelector(element);
      List<T> list = destination[key];
      if (list == null) {
        list = [];
        destination[key] = list;
      }
      list.add(element);
    }
    return destination;
  }
}

extension mapKtx<K, V> on Map<K, V> {
  /// Returns a list containing the results of applying the given [transform] function
  /// to each entry in the original map.
  List<R> mapToList<R>(R Function(K, V) transform) {
    return mapToListTo([], transform);
  }

  /// Applies the given [transform] function to each entry of the original map
  /// and appends the results to the given [destination].
  List<R> mapToListTo<R>(List<R> destination, R Function(K, V) transform) {
    for (var entry in this.entries) {
      destination.add(transform(entry.key, entry.value));
    }
    return destination;
  }
}
