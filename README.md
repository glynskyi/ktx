# KTX

[![pub](https://img.shields.io/pub/v/ktx)](https://pub.dartlang.org/packages/ktx)
[![build](https://api.travis-ci.com/glynskyi/ktx.svg?branch=master)](https://travis-ci.com/glynskyi/ktx)
[![coverage](https://coveralls.io/repos/github/glynskyi/ktx/badge.svg?branch=master)](https://coveralls.io/github/glynskyi/ktx?branch=master)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

The KTX Library provides a comprehensive set of tools for managing collections – groups of a variable number of items (possibly zero)
that share significance to the problem being solved and are operated upon commonly.

## Getting Started

* [`associateBy`](#associateby)
* [`mapToList`](#maptolist)
* [`sortBy`](#sortby)
* [`groupBy`](#groupby)
* [`mapIndexed`](mapIndexed)
* [`zip`](#zip)
* [`let`](#let)

---

### associateBy

`associateBy` is an operation allows associate the list items with the given key.

```Dart
final List<Fruit> fruits = [
    Fruit(id: 1, kind: "Pear", color: "Red"),
    Fruit(id: 2, kind: "Apple", color: "Green")
];
final Map<int, Fruit> mappedFruits = fruits
    .associateBy((fruit) => fruit.id);
```

---

### mapToList

`mapToList` returns a list containing the results of applying the given [transform] function.

```Dart
final Map<int, Fruit> fruits = {
  1: Fruit(kind: "Pear", color: "Red"),
  2: Fruit(kind: "Apple", color: "Green")
};
final List<String> fruitNames = fruits
    .mapToList((key, fruit) => fruit.kind);
```

---

### sortBy

`sortBy` sorts elements in the list in-place according to natural sort order of the value returned by specified [selector] function.

```Dart
final List<Fruit> fruits = [
    Fruit(id: 1, kind: "Apple", color: "Red"),
    Fruit(id: 2, kind: "Apple", color: "Green")
];
final List<Fruit> sortedByNamefruits = fruits
    .sortBy((fruit) => fruit.kind);
```

---

### groupBy

`groupBy` groups elements of the original collection by the key returned by the given [keySelector] function applied to each element
and returns a map where each group key is associated with a list of corresponding elements.

```Dart
final List<Fruit> fruits = [
    Fruit(id: 1, kind: "Apple", color: "Red"),
    Fruit(id: 2, kind: "Apple", color: "Green")
];
final Map<String, List<Fruit>> groupedFruits = fruits
    .groupBy((fruit) => fruit.kind);
```

---

### mapIndexed

`mapIndexed` returns a list containing the results of applying the given [transform] function to each element and its index in the original collection.

```Dart
final fruits = ["Apple", "Pear", "Orange"];
final indexedFruits = fruits.mapIndexed((index, fruit) => "${index + 1}: $fruit");

/// ["1: Apple", "2: Pear", "3: Orange"]);
```

---

### zip

`zip` returns a list of values built from the elements of `this` collection and the [other] collection with the same index.

```Dart
final kinds = ["Apple", "Pear", "Apricot"];
final colors = ["Red", "Green", "Orange"];
final fruits = kinds.zip(colors, (kind, color) => Fruit(kind, color));
```

---

### let

`let` calls the specified function [block] with `this` value as its argument and returns its result.

```Dart
final Fruit? fruit = Fruit(id: 1, kind: "Apple", color: "Red");
fruit?.let((fruit) => print(fruit));
```