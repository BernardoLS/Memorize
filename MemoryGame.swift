//
//  MemoryGame.swift
//  Memorize
//
//  Created by Laguna on 31/03/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable{
    private (set) var cards: Array<Card>
    
    private var indexOfFirstSelectedCardOnTurn: Int? {
        get { return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set { return cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
    init(numberOfPairs: Int, createdCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let content = createdCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[choosenIndex].isFaceUp,
           !cards[choosenIndex].isMatched {
            if let potentialMatchIndex = indexOfFirstSelectedCardOnTurn {
                if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[choosenIndex].isFaceUp.toggle()
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFirstSelectedCardOnTurn = choosenIndex
            }
        }

    }

    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
