//
//  ContentView.swift
//  Memorize
//
//  Created by Laguna.rkz on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
        
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 95))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
        
    }
    
    struct CardView: View {
        var card: MemoryGame<String>.Card
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                
                if card.isFaceUp {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 2)
                    Text(card.content).font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape
                }
                
            }.aspectRatio(2/3, contentMode: .fit)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
//    var removeButton: some View {
//        Button(
//            action: {
//                if emojisCount > 1 {
//                    emojisCount -= 1
//                }
//            },
//            label: { Image(systemName: "minus.circle") }
//        )
//    }
//
//    var addButton: some View {
//        Button(action: {
//            if emojisCount < emojis.count {
//                emojisCount += 1
//            }
//        }, label: {
//            Image(systemName: "plus.circle")
//        })
//    }
