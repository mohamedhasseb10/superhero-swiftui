//
//  ContentView.swift
//  SuperHero-SwiftUI
//
//  Created by Mohamed Hasseb on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(superherosData) { item in
                    SuberHeroView(superH: item)
                }
            }//: HStack
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
