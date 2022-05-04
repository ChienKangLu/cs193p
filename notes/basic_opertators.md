# Basic Operators

## Source

[Basic Operators - The Swift Programming Language (Swift 5.6)](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html)

## Arithmetic Operators

Swift arithmetic operators don’t allow values to overflow by default. You can opt in to value overflow behavior by using Swift’s overflow operators (such as `a &+ b`).

### Remainder Operator

```swift
9 % 4    // equals 1
// 9 = (4 x 2) + 1
```

```swift
-9 % 4   // equals -1
// -9 = (4 x -2) + -1
```

The sign of `b` is ignored for negative values of `b`. This means that `a % b` and `a % -b` always give the same answer.

## Comparison Operators

Swift also provides two *identity operators* (`===` and `!==`), which you use to test whether two object references both refer to the same object instance.

```swift
(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
```

Tuples can be compared with a given operator only if the operator can be applied to each value in the respective tuples.

```swift
("blue", -1) < ("purple", 1)        // OK, evaluates to true
("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
```

## Ternary Conditional Operator

```swift
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
```

## Nil-Coalescing Operator

The *nil-coalescing operator* (`a ?? b`) unwraps an optional `a` if it contains a value, or returns a default value `b` if `a` is `nil`.

The nil-coalescing operator is shorthand for the code below:

```swift
a != nil ? a! : b
```

```swift
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
```

## Range Operators

### Closed Range Operator

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```

### Half-Open Range Operator

```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

```

### One-Sided Ranges

```swift
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
```

```swift
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
```

```swift
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
```


