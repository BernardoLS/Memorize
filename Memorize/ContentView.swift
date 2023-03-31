//
//  ContentView.swift
//  Memorize
//
//  Created by Laguna.rkz on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    
//    struct CardContent: Identifiable {
//        var id: String
//        var content: String
//    }
//
//    let cardContents: [CardContent] =
//    [
//        CardContent(id:"01", content: "🏎"),
//        CardContent(id:"02", content: "🚀"),
//        CardContent(id:"03", content: "🏎"),
//        CardContent(id:"04", content: "🚀"),
//
//    ]
    
    init(emojisCount: Int = 3) {
        self.emojisCount = emojisCount
        self.emojis = carEmojis.shuffled()
    }
    
    let carEmojis: [String] = [
        "🏎","🚀", "🚒", "🚑", "🛸", "✈️", "🚁", "🚜", "🚔", "🛶",
        "🚗", "🚛", "🛵", "🚂", "🚌", "🛴", "🚲", "🚤", "🚚", "🏍"
    ]
    
    let animalsEmojis: [String] = [
        "🐶","🐭", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐦", "🐍", "🦁",
        "🐱", "🐮", "🐸", "🦊", "🦉",
    ]
    
    let flagEmojis: [String] = [
        "🇯🇵","🇮🇹", "🇺🇾", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇵🇹", "🇲🇽", "🇧🇷", "🇨🇦", "🇺🇸", "🇦🇷"
    ]
    
    @State var emojisCount = 1
    
    @State var emojis: [String]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis, id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            Spacer()
            HStack {
                SelectButton(
                    imageName: "car",
                    textLabel: "Veiculos",
                    onTap: {
                        emojis = carEmojis.shuffled()
                    }
                )
                Spacer()
                SelectButton(
                    imageName: "flag",
                    textLabel: "Bandeiras",
                    onTap: {
                        emojis = flagEmojis.shuffled()
                    }
                )
                Spacer()
                SelectButton(
                    imageName: "hare",
                    textLabel: "Animais",
                    onTap: {
                        emojis = animalsEmojis.shuffled()
                    }
                )
            }.padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    
    struct SelectButton: View {
        var imageName: String
        var textLabel: String
        var onTap: () -> Void
        
        var body: some View {
            VStack {
                Button(action: {
                    onTap()
                }, label: {
                    Image(systemName: imageName)
                }).font(.largeTitle)
                Text(textLabel)
                    .font(.subheadline).foregroundColor(.blue)
            }
        }
    }
    
    struct CardView: View {
        var content: String
        @State var isFaceUp = false
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                
                if isFaceUp {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                } else {
                    shape
                }
                
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
