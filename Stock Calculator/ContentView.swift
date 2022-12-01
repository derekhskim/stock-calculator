//
//  ContentView.swift
//  Stock Calculator
//
//  Created by Derek Kim on 2022/11/30.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var purchasedPrice = ""
    @State var purchasedAmount = ""
    
    var body: some View {
            VStack {
                Text("Stock Average Caluclator")
                TextField(
                  "Shares purchased price",
                  text: $purchasedPrice
                )
                TextField(
                    "Shares Bought", text: $purchasedAmount)
                .keyboardType(.numberPad)
                .onReceive(Just(purchasedAmount)) { newValue in
                    let filtered = newValue.filter {
                        "0123456789".contains($0) }
                    if filtered != newValue {
                        self.purchasedAmount = filtered
                    }
                }
            }
            .padding()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
