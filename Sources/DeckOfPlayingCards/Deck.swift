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

import PlayingCard

/// A model for shuffling and dealing a deck of playing cards.
///
/// The playing card deck consists of 52 individual cards in four suites: spades, hearts, diamonds, and clubs.
/// There are 13 ranks from two to ten, then jack, queen, king, and ace.
public struct Deck: Equatable {
  fileprivate var cards: [PlayingCard]

  /// Returns a deck of playing cards.
  public static func standard52CardDeck() -> Deck {
    var cards: [PlayingCard] = []
    for rank in Rank.allCases {
      for suit in Suit.allCases {
        cards.append(PlayingCard(rank: rank, suit: suit))
      }
    }

    return Deck(cards)
  }

  /// Creates a deck of playing cards.
  public init(_ cards: [PlayingCard]) {
    self.cards = cards
  }

  /// Randomly shuffles a deck of playing cards.
  public mutating func shuffle() {
    cards.shuffle()
  }

  /// Deals a card from the deck.
  ///
  /// The function returns the last card in the deck.
  public mutating func deal() -> PlayingCard? {
    guard !cards.isEmpty else { return nil }

    return cards.removeLast()
  }

  /// The number of remaining cards in the deck.
  public var count: Int {
    cards.count
  }
}

// MARK: - ExpressibleByArrayLiteral

extension Deck: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: PlayingCard...) {
    self.init(elements)
  }
}
