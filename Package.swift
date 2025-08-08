// swift-tools-version:6.0

//===----------------------------------------------------------------------===//
//
// This source file is part of the example package deckofplayingcard open source project
//
// Copyright (c) 2015-2025 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
    name: "DeckOfPlayingCards",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "DeckOfPlayingCards",
                 targets: ["DeckOfPlayingCards"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/example-package-playingcard.git",
            from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "DeckOfPlayingCards",
            dependencies: [
                .product(name: "PlayingCard",
                         package: "example-package-playingcard")
            ]),
        .testTarget(
            name: "DeckOfPlayingCardsTests",
            dependencies: [
                .target(name: "DeckOfPlayingCards")
            ]),
    ]
)
