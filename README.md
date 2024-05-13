# TakeHomeTest

[![Swift Version](https://img.shields.io/badge/Swift-5.5-F16D39.svg?style=flat)](https://swift.org/download/)
[![SPM Compatible](https://img.shields.io/badge/Swift_Package_Manager-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![License](https://img.shields.io/github/license/yourusername/PackageName.svg?style=flat)](https://github.com/yourusername/PackageName/blob/main/LICENSE)

## Description

Application is a modular Swift package providing a user interface for interacting with your data. The application is built using a modular architecture, with each module managed using Swift Package Manager (SPM). The primary initialization is done in SwiftUI.

### Technologies Used

- SwiftUI: Provides the primary user interface framework for building the application.
- Combine: Used for handling asynchronous events and data streams.
- async/await: Utilized for asynchronous programming to simplify and streamline asynchronous code.

Additionally, the Navigation Coordinator is built using NavigationStack, providing navigation management within the application.

Unit testing is implemented for the UseCases within the AppCore Swift package, ensuring the reliability and correctness of the application's core functionality.

### Screens

1. **Character Listing Screen**: The first screen is divided into two sections. The top part contains a filter section implemented using UICollectionView, and the listing part is done using UITableView. Both components are wrapped in a SwiftUI view.

2. **Details Screen**: The second screen is built entirely in SwiftUI.


## Requirements

- Swift 5.5+
- iOS 16.0+ 

## Installation
Open Xcode.
Go to "File" > "Packages" > "Resolve Package Version"

