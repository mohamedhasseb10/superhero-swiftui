//
//  SuberHeroView.swift
//  SuperHero-SwiftUI
//
//  Created by Mohamed Hasseb on 08/05/2022.
//

import SwiftUI

struct SuberHeroView: View {
    var superH: SuperHero
    let gradient: [Color] = [Color("ColorHulk01"), Color("ColorHulk02")]
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    //Structure is a value type can not change properties direct in structure body so apple provide wrapper property @State keyword to change variable in structure body.
    @State var isAlertPresented: Bool = false
    @State var isScalling: Bool = false
    @State var isSliding: Bool = false
    var body: some View {
        ZStack {
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScalling ? 1 : 0.7)
                .animation(.easeOut(duration: 0.8), value: isScalling)
            
            VStack {
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                Button {
                    //Some Action
                    isAlertPresented.toggle()
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack {
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                    }
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    //isPresented: Binding Variable
                    .alert(isPresented: $isAlertPresented) {
                        Alert(title: Text("More about \(superH.title)"), message: Text(superH.message), dismissButton: .default(Text("OK")))
                    }
                }//: Label
            }//: VStack
            .offset(y: isSliding ? 150 : 300)
            .animation(.easeOut(duration: 0.8), value: isSliding)
        }//: ZStack
        .frame(width: 335, height: 545, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: .black, radius: 2, x: 2, y: 2)
        .onAppear {
            isScalling = true
            isSliding = true
        }
    }
}

struct SuberHeroView_Previews: PreviewProvider {
    static var previews: some View {
        SuberHeroView(superH: superherosData[0])
    }
}
