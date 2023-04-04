//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Laguna on 31/03/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis: [String] = [
        "🏎","🚀", "🚒", "🚑", "🛸", "✈️", "🚁", "🚜", "🚔", "🛶",
        "🚗", "🚛", "🛵", "🚂", "🚌", "🛴", "🚲", "🚤", "🚚", "🏍"
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairs: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
 
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    func chooseCard(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
