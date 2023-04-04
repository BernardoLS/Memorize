//
//  MemoryGame.swift
//  Memorize
//
//  Created by Laguna on 31/03/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable{
    private (set) var cards: Array<Card>
    
    private var indexOfFirstSelectedCardOnTurn: Int?
    
    init(numberOfPairs: Int, createdCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
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
                indexOfFirstSelectedCardOnTurn = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFirstSelectedCardOnTurn = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }

    }

    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
}
