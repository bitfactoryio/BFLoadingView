# BFLoadingView

[![Version](https://img.shields.io/cocoapods/v/BFLoadingView.svg?style=flat)](https://cocoapods.org/pods/BFLoadingView)
[![Platform](https://img.shields.io/cocoapods/p/BFLoadingView.svg?style=flat)](https://cocoapods.org/pods/BFLoadingView)
![Swift version](https://img.shields.io/badge/swift-5.1-orange.svg)
[![License](https://img.shields.io/cocoapods/l/BFTableView.svg?style=flat)](https://cocoapods.org/pods/BFTableView.)

## Example

To run the example project, clone the repo, and open the workspace `Example/BFLoadingView.xcworkspace` in XCode.

## Requirements
- iOS 11.0+
- Swift 5.1

## Usage

BFLoadingView is a nice morphing poligonal activity indicator designed as an animating HUD. Try to add it to your `UIViewController` and you should get the following result:

![](https://github.com/bitfactoryio/BFLoadingView/raw/master/animation.gif)

### Use it!

First you have to import the BFLoadingView Library by adding `import BFLoadingView`.

Then call the following when you want to show the animated activity indicator. The fade in duration is 0.25 seconds:
```swift
showLoadingView()
```

But yeah, you can also set colors. How about this:
```swift
showLoadingView(backgroundColor: .red, triangle1Color: .black, triangle2Color: .blue, viewBackgroundColor: .yellow)
```

When you are done with your task in code you can also hide the indicator again by the following function:
```swift
hideLoadingView()
```

That's it. Have fun!

## Installation

BFLoadingView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BFLoadingView'
```

## Author

Matthias Nagel, matthias@bitfactory.io  
[Bitfactory GmbH](https://www.bitfactory.io)

## License

BFLoadingView is available under the MIT license. See the LICENSE file for more info.
