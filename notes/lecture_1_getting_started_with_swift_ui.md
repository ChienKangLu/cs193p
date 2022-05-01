# Lecture 1 Getting Started with SwiftUI

## Source

[Lecture 1: Getting started with SwiftUI - YouTube](https://www.youtube.com/watch?v=bqu6BquVi2M)

## Enviroment

- Swift UI

- Xcode 13.3.1
  
  [如何管理 Xcode 版本才不會害到自己跟團隊](https://13h.tw/2019/11/01/manage-xcode-versions.html)
  
  [Download Xcode from apple](https://developer.apple.com/download/all/?q=xcode)
  
  [如何手動快速下載不同版本的 Xcode](https://blog.poychang.net/manually-download-multiple-versions-of-xcode/)

## Trouble shooting

### Error when close simulator

Got the error `Thread 1: signal SIGTERM error`:

You are closing the simulator wrong, u have to use cmd and `q`.

### Xcode 13 Missing Info.plist

Projects created from several templates no longer require configuration files such as entitlements and Info.plist files. Configure common fields in the target’s Info tab, and build settings in the project editor. These files are added to the project when additional fields are used.

## Hot key

- `command` + `B`: Build
- `command` + `/`: Command out

## Data strcuture

Swift supports both **object oriented programming** and **functional programming**.

We use functional programming model in UI code and use object oriented programming to hook up our model, our kind of logic, to our UI.

`struct` is not classes in **object orieted programming** but **functional programming**.

```swift
// The data structure behaves like a View (functional programming)
struct HeaderView: View {

}
```

## Function

```swift
func foo() {

}
```

## Variable

```swift
// something behaves like a View
// this var is not a variable stored in memory. It's a variable calulated by executing this function
var body: some View { // this is a function!
    // Text is just another View defined by Swift UI
    /*
        var Text: View {
            var body: some View { ... }
        }
    */
    Text("Hello, world!") // hidden return logic
        .padding(.all) // padding is a function
}

var i: Int
var s: String
```

## Argument Label

```swift
RoundedRectangle(cornerRadius: 25.0)
```

## RoundedRectangle

```swift
// stroke is a function of shape
RoundedRectangle(cornerRadius: 25.0)
    .stroke(lineWidth: 3)
    .padding(.horizontal)
    .foregroundColor(.red)
```

## ZStack

ZStack stacks these Views on top of each other. ZStack is a view combiner.

```swift
ZStack(content: { // View builder funcion
    RoundedRectangle(cornerRadius: 25.0)
        .stroke(lineWidth: 3)
    Text("Hello, world!")
})
.padding(.horizontal)
.foregroundColor(.red) // apply to all views in container
```

Same as

```swift
ZStack {
    RoundedRectangle(cornerRadius: 25.0)
        .stroke(lineWidth: 3)
    Text("Hello, world!")
}
.padding(.horizontal)
.foregroundColor(.red)
```
