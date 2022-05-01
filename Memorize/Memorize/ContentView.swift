//
//  ContentView.swift
//  Memorize
//
//  Created by LeoLu on 2022/5/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
            Text("Hello, world!")
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
}


























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
