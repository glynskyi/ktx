# KTX

[![pub](https://img.shields.io/pub/v/ktx)](https://pub.dartlang.org/packages/ktx)

The KTX Library provides a comprehensive set of tools for managing collections – groups of a variable number of items (possibly zero)
that share significance to the problem being solved and are operated upon commonly.

## Getting Started

`associateBy` is an operation allows associate the list items with the given key.

```Dart
final List<User> users = [
    User(id: 1, firstName: "Dmytro", lastName: "Glynskyi"),
    User(id: 2, firstName: "Vladimir", lastName: "Zelenskyi")
];
final Map<int, User> mappedUsers = users
    .associateBy((user) => user.id);
```

`mapToList` returns a list containing the results of applying the given [transform] function.

```Dart
final Map<int, User> users = {
  1: User(firstName: "Dmytro", lastName: "Glynskyi"),
  2: User(firstName: "Vladimir", lastName: "Zelenskyi")
};
final List<String> userName = users
    .mapToList((key, user) => user.firstName);
```

`sortBy` sorts elements in the list in-place according to natural sort order of the value returned by specified [selector] function.

```Dart
final List<User> users = [
    User(id: 1, firstName: "Vladimir", lastName: "Glynskyi"),
    User(id: 2, firstName: "Vladimir", lastName: "Zelenskyi")
];
final List<User> sortedByNameUsers = users
    .sortBy((user) => user.firstName);
```

`groupBy` groups elements of the original collection by the key returned by the given [keySelector] function applied to each element 
and returns a map where each group key is associated with a list of corresponding elements.

```Dart
final List<User> users = [
    User(id: 1, firstName: "Vladimir", lastName: "Glynskyi"),
    User(id: 2, firstName: "Vladimir", lastName: "Zelenskyi")
];
final Map<String, List<User>> groupedUsers = users
    .groupBy((user) => user.firstName);
```