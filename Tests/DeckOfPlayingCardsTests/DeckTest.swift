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

import DeckOfPlayingCards
import PlayingCard
import Testing

struct DeckTests {
  @Test
  func standard52CardDeck() {
    var countByPlayingCard: [PlayingCard: Int] = [:]

    var deck = Deck.standard52CardDeck()
    while let playingCard = deck.deal() {
      countByPlayingCard[playingCard, default: 0] += 1
    }

    #expect(countByPlayingCard.count == 52)
    #expect(countByPlayingCard.values.allSatisfy({ $0 == 1 }))

    for rank in Rank.allCases {
      for suit in Suit.allCases {
        let playingCard = PlayingCard(rank: rank, suit: suit)
        #expect(countByPlayingCard[playingCard] == 1)
      }
    }
  }

  @Test
  func deal() {
    let playingCard = PlayingCard(rank: .ace, suit: .clubs)
    var deck: Deck = [playingCard]

    #expect(deck.deal() == playingCard)
    #expect(deck.deal() == nil)
  }

  @Test
  func countEmptyDeckHasZeroCards() {
    let deck = Deck()
    //XCTAssertEqual(deck.count, 0)
    #expect(deck.count == 0)
  }

  @Test
  func countStandard52CardDeckHas52Cards() {
    let deck = Deck.standard52CardDeck()

    #expect(deck.count == 52)
  }

  @Test
  func countDealingDecreasesCountByOne() throws {
    var deck = Deck([
      PlayingCard(rank: .ace, suit: .spades), PlayingCard(rank: .queen, suit: .hearts),
    ])

    #expect(deck.count == 2)
    try #require(deck.deal() != nil)
    #expect(deck.count == 1)
  }
}
