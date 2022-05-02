# Lecture 2 Learning more about SwiftUI

## Source

[Lecture 2: Learning more about SwiftUI - YouTube](https://www.youtube.com/watch?v=3lahkdHEhW8)

## Idea

In SwiftUI, it's better to have more smaller views than fewer larger views.

```swift
struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill()
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
            Text("✈️")
                .font(.largeTitle)
        }
     }
}
```

## Variables

In Swift, all variables must have a value.

```swift
var isFaceUp: Bool { return false }

var isFaceUp: Bool = false // default value

var isFaceUp: Bool

// Swift can infer the type for us
let shape = RoundedRectangle(cornerRadius: 25.0) // constant
```

## User Events

```swift
.onTapGesture(perform: {
...
})
```

## @State

All Views are immutable. Swift is able to rebuild entire of UI highly efficently but all the Views are being replaced.

```swift
struct CardView: View {
    // The view is still immutable. It becomes a pointer to some Boolean somewhere in memory. That's the value can be change.
    // We don't use it often.
    @State var isFaceUp: Bool = true
...
}
```

## String

```swift
var content: String
```

## Hot keys

`option` + click: show documentation

`command` + `Shift` +`L`: open Library

## Array

```swift
var emojis: Array<String> = ["🚀", "🚁", "🚆", "🛩"]
var emojis: [String] = ["🚀", "🚁", "🚆", "🛩"] // identical with above
// Get element
emojis[0]
emojis[1]
emojis[2]
emojis[3]
// Range zero up to six but not including six
emojis[0..<6]
// Range zero up to six
emojis[0...6]
```

## ForEach

Any kind of `struct` can be an *identifiable*, but it has to have a `var` called `id` which is unique to identify it.

```swift
ForEach(emojis, id: \.self,) { emoji in
    CardView(content: emoji)
}
```

## Code snippet

[How to create code snippets in Xcode | Sarunw](https://sarunw.com/posts/how-to-create-code-snippets-in-xcode/)

## Integrer

```swift
var emojiCount: Int = 6
var emojiCount = 6
var emojiCount = 6.0 // double
```

## VStack

```swift
VStack {
...
}
```

## Button

```swift
Button(action: {}, label: { Text("click me")})
```

## HStack

```swift
HStack {
    ...
    Spacer()
    ...
}
```

## SF symbols

[SF Symbols - Apple Developer](https://developer.apple.com/sf-symbols/)

```swift
Image(systemName: "plus.circle")
Image(systemName: "minus.circle")
```

## Font

```swift
VStack {
    HStack {
        ....
    }
    HStack {
        ....
    }
    .font(.largeTitle)
    .padding(.horizontal)
}
```

## Suger

```swift
Button(action: {
    if (emojiCount < emojis.count) {
        emojiCount += 1
    }
}, label: {
    Image(systemName: "plus.circle")
})
```

is equal to

```swift
Button {
    if (emojiCount < emojis.count) {
        emojiCount += 1
    }
} label: {
    Image(systemName: "plus.circle")
}
```

## LazyVGrid

A LazyVGrid basically lets you specify a number of columns

```swift
LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
...
}

// More control by GridItem
GridItem(.fixed(200))
GridItem(.flexiable(200)) // by default

// felxiable
LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
...
}
```

## aspectRatio

```swift
.aspectRatio(2/3, contentMode: .fit)
```

## ScrollView

```swift
ScrollView {
...
}
```

## StrokeBorder

```swift
RoundedRectangle(cornerRadius: 25.0).strokeBorder(lineWidth: 3)
```
