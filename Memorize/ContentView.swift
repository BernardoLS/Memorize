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
        AspectVGrid(items: viewModel.cards, aspectRatio: 2/3, content: { card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    viewModel .chooseCard(card)
                }
        })
        .foregroundColor(.red)
        .padding(.horizontal)
        
    }
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    if card.isFaceUp {
                        shape.fill().foregroundColor(.white)
                        shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                            .padding(4).opacity(0.5)
                        Text(card.content).font(
                            Font.system(size: min(geometry.size.width, geometry.size.height) * DrawingConstants.fontScale)
                        )
                    } else if card.isMatched {
                        shape.opacity(0)
                    } else {
                        shape.fill()
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
  
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.60
    }
}
