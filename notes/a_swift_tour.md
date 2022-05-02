# A Swift Tour

## Source

[A Swift Tour -The Swift Programming Language (Swift 5.6)](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)

## Simple Values

Use `let` to make a constant and `var` to make a variable. The compiler infers that `myVariable` is an integer because its initial value is an integer.

```swift
var myVariable = 42
myVariable = 50
let myConstant = 42
```

Values are never implicitly converted to another type.

```swift
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
```

Use three double quotation marks (`"""`) for strings that take up multiple lines.

```swift
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
```

Create arrays and dictionaries using brackets (`[]`)

```swift
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
```

Arrays automatically grow as you add elements.

```swift
shoppingList.append("blue paint")
print(shoppingList)
```

To create an empty array or dictionary, use the initializer syntax.

```swift
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]
```

If type information can be inferred, you can write an empty array as `[]` and an empty dictionary as `[:]`.

```swift
shoppingList = []
occupations = [:]
```

## Control Flow

Use `if` and `switch` to make conditionals, and use `for`-`in`, `while`, and `repeat`-`while` to make loops.

```swift
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
// Prints "11"
```

You can use `if` and `let` together to work with values that might be missing.

```swift
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "QQ"
}
print(greeting)
// Prints "QQ"
```

Another way to handle optional values is to provide a default value using the `??` operator. If the optional value is missing, the default value is used instead.

```swift
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
```

Switches support any kind of data and a wide variety of comparison operations—they aren’t limited to integers and tests for equality.

```swift
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
```

`let` can be used in a pattern to assign the value that matched the pattern to a constant.

After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so you don’t need to explicitly break out of the switch at the end of each case’s code.

You use `for`-`in` to iterate over items in a dictionary by providing a pair of names to use for each key-value pair.

```swift
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestkey = ""
for (key, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestkey = key
        }
    }
}
print(largest)
print(largestkey)
// Prints "25"
// Prints "Square"
```

Use `while` to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once.

```swift
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// Prints "128"

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// Prints "128"
```

You can keep an index in a loop by using `..<` to make a range of indexes.

```swift
var total = 0
for i in 0..<4 {
    total += i
}
print(total)
// Prints "6"
```

Use `..<` to make a range that omits its upper value, and use `...` to make a range that includes both values.

## Functions and Closures

```swift
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")
```

By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write `_` to use no argument label.

```swift
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")
```

Use a tuple to make a compound value.

```swift
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
...
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// Prints "120"
print(statistics.2)
// Prints "120"
```

Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that’s long or complex.

```swift
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()
```

Functions are a **first-class type**. This means that a function can return another function as its value.

```swift
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)
```

A function can take another function as one of its arguments.

```swift
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
```

Functions are actually a special case of closures: blocks of code that can be called later.

```swift
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// or

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// or

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
```

## Objects and Classes

```swift
class Shape {
    let TAG = "Shape"
    var numberOfSides = 0

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }  
}

let shape = Shape()
shape.numberOfSides = 2
print(shape.TAG)
print(shape.simpleDescription())
```

Every property needs a value assigned—either in its declaration or in the initializer.

Use `deinit` to create a deinitializer if you need to perform some cleanup before the object is deallocated.

```swift
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
```

Methods on a subclass that override the superclass’s implementation are marked with `override`

```swift
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()
```

```swift
class Circle: NamedShape {
    let radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }

    func area() -> Double {
        return radius * radius * 3.14
    }

    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

let circle = Circle(radius: 2, name: "circle")
print(circle.area())
print(circle.simpleDescription())
```

properties can have a getter and a setter.

```swift
var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
}
```

If you don’t need to compute the property but still need to provide code that’s run before and after setting a new value, use `willSet` and `didSet`.

```swift
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"
```

When working with optional values, you can write `?` before operations like methods, properties, and subscripting. If the value before the `?` is `nil`, everything after the `?` is ignored and the value of the whole expression is `nil`.

```swift
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
```

## Enumerations and Structures

Use `enum` to create an enumeration

```swift
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
```

By default, Swift assigns the raw values starting at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values.

Use the `init?(rawValue:)` initializer to make an instance of an enumeration from a raw value. It returns either the enumeration case matching the raw value or `nil` if there’s no matching `Rank`.

```swift
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
```

In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.

```swift
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
```

Another choice for enumeration cases is to have values associated with the case—these values are determined when you make the instance.

You can think of the associated values as behaving like stored properties of the enumeration case instance.

```swift
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}
// Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."
```

Use `struct` to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that <u>structures are always copied</u> when they’re passed around in your code, but <u>classes are passed by reference</u>.

```swift
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
```

## Protocols and Extensions

*`View` and `Identifiable` are both protocols.

Use `protocol` to declare a protocol.

```swift
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
```

Classes, enumerations, and structs can all adopt protocols.

```swift
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
```

Notice the use of the `mutating` keyword in the declaration of `SimpleStructure` to mark a method that modifies the structure.

Use `extension` to add functionality to an existing type, such as new methods and computed properties.

```swift
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
// Prints "The number 7"
```

When you work with values whose type is a protocol type, methods outside the protocol definition aren’t available.

```swift
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// Prints "A very simple class.  Now 100% adjusted."
// print(protocolValue.anotherProperty)  // Uncomment to see the error
```

## Error Handling

You represent errors using any type that adopts the `Error` protocol.

```swift
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
```

Use `throw` to throw an error and `throws` to mark a function that can throw an error.

```swift
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
```

There are several ways to handle errors. One way is to use `do`-`catch`. Inside the `do` block.

```swift
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// Prints "Job sent"
```

You can provide multiple `catch` blocks that handle specific errors.

```swift
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// Prints "Job sent"
```

Another way to handle errors is to use `try?` to convert the result to an optional. If the function throws an error, the specific error is discarded and the result is `nil`. Otherwise, the result is an optional containing the value that the function returned.

```swift
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
```

Use `defer` to write a block of code that’s executed after all other code in the function.

- The code is executed regardless of whether the function throws an error.

- You can use `defer` to write setup and cleanup code next to each other, even though they need to be executed at different times.

```swift
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
// Prints "false"
```

## Generics

Write a name inside angle brackets to make a generic function or type.

```swift
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
```

You can make generic forms of functions and methods, as well as classes, enumerations, and structures.

```swift
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
```

Use `where` right before the body to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.

```swift
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
```

Writing `<T: Equatable>` is the same as writing `<T> ... where T: Equatable`.
