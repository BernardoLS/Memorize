//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Laguna on 31/03/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis: [String] = [
        "🏎","🚀", "🚒", "🚑", "🛸", "✈️", "🚁", "🚜", "🚔", "🛶",
        "🚗", "🚛", "🛵", "🚂", "🚌", "🛴", "🚲", "🚤", "🚚", "🏍"
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
 
    @Published private var model = createMemoryGame()
    
    func chooseCard(_ card: Card) {
        model.choose(card)
    }
    
    var cards: Array<Card> {
        return model.cards
    }
}
