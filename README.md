![ios](https://img.shields.io/badge/iOS-13-green)
![tv](https://img.shields.io/badge/tvOS-13-green)
![watch](https://img.shields.io/badge/watchOS-6-green)
![mac](https://img.shields.io/badge/macOS-10.15-green)

# Refreshable

A backport of the new `refreshable` modifier with support for all SwiftUI versions.

This includes support for a `refreshAction` in the `Environment` as well as a convenient `RefreshableView` that makes it easy to build your own trigger's for _any_ refresh action.

> Note: This package does not (_yet_) include a pull-to-refresh like component. 

## Installation

The code is packaged as a framework. You can install manually (by copying the files in the `Sources` directory) or using Swift Package Manager (__preferred__)

To install using Swift Package Manager, add this to the `dependencies` section of your `Package.swift` file:

`.package(url: "https://github.com/SwiftUI-Plus/Refreshable.git", .upToNextMinor(from: "1.0.0"))`

## Other Packages

If you want easy access to this and more packages, add the following collection to your Xcode 13+ configuration:

`https://benkau.com/packages.json`
